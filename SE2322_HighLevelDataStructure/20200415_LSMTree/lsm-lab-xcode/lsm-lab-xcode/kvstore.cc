#include "kvstore.h"
#include "stdio.h"
#include <string>
#include <fstream>
#include "math.h"
KVStore::KVStore(const std::string &dir): KVStoreAPI(dir),fileDir(dir)
{
    // set the message in the front of sstable to memeory. Initialize the vector
    vector<SsMsg> si[max_level];
    for(int i=0;i<max_level;i++){
        si[i].clear();
        allSsMsg.push_back(si[i]);
    }
}

KVStore::~KVStore(){
}


string KVStore::getFileName(int layer, int num){
    string curFileDir = fileDir+"/level-"+to_string(layer)+"/ssTable"+to_string(num)+".sst";
    return curFileDir;
}

bool KVStore::fileExist(string fileDir){
    fstream _file;
    _file.open(fileDir, ios::in);
    if (_file){
        _file.seekg(0, ios_base::end);
        fstream::off_type Len = _file.tellg();
        _file.close();
        if (Len == 0)return false;
        else return true;
    }
    _file.close();
    return false;
}

/**
 * Insert/Update the key-value pair.
 * No return values for simplicity.
 */
void KVStore::put(uint64_t key, const std::string &s)
{
    // If the 2MB limit is reached after insertion, the SSTables are generated
    int newSize =slmSkip.memSize+12+s.length();
    if(newSize > 2*MB){
        SsTable *newSsTable = new SsTable(curTime, slmSkip);
        curTime++;
        string filename = getFileName(0, layerFiles[0]);
        const char *p = filename.c_str();
        
        // push the new sstable message to memory.
        SsMsg newSsMsg(curTime,newSsTable->num, newSsTable->max, newSsTable->min,p,newSsTable->bloomFilter, newSsTable->keyOff);
        allSsMsg[0].push_back(newSsMsg);
        writeToFile(*newSsTable,0);
        merge();
        slmSkip.init();
    }
    slmSkip.put(key, s);
    
    return;
}

void KVStore::putAgain(uint64_t key, const std::string &s,time_t stamp,int layer){
    int newSize =slmSkipMerge.memSize+12+s.length();
    if(newSize > 2*MB){
        SsTable *newSsTable = new SsTable(stamp, slmSkipMerge);
        string filename = getFileName(layer, layerFilesIndex[layer]);
        const char *p = filename.c_str();
        
        // push the new sstable message to memory.
        SsMsg newSsMsg(curTime,newSsTable->num, newSsTable->max, newSsTable->min,
                       p,newSsTable->bloomFilter, newSsTable->keyOff);
        allSsMsg[layer].push_back(newSsMsg);
        writeToFile(*newSsTable,layer);
        slmSkipMerge.init();
    }
    slmSkipMerge.put(key, s);
    return;
}

/**
 * Returns the (string) value of the given key.
 * An empty string indicates not found.
 */
std::string KVStore::get(uint64_t key)
{
    string s = slmSkip.get(key);
    return s;
}

/**
 * Delete the given key-value pair if it exists.
 * Returns false iff the key is not found.
 */
bool KVStore::del(uint64_t key)
{
    //need to find in ssTable later!
    if(slmSkip.remove(key))return true;
    return false;
}

/**
 * This resets the kvstore. All key-value pairs should be removed,
 * including memtable and all sstables files.
 */
void KVStore::reset()
{
    slmSkip.init();
    return;
}

void KVStore::writeToFile(SsTable &st,int layer){
    ofstream outfile;int numOfKey=0;
    int first=0;
    string curFileDir1 = getFileName(layer, layerFilesIndex[layer]);
    layerFilesIndex[layer]++;
    cout<<"write to file:"<<curFileDir1<<endl;
    try {
        string dirPath=fileDir+"/level-"+to_string(layer);
        if(!dirExists(dirPath.c_str())){
            if(mkdir(dirPath.c_str())!=0)
                throw "can't make direct correctly!";
        }
        outfile.open(curFileDir1,ios::out|ios::binary);
        if(!outfile)
            throw "can't open the file!";
    } catch (string s) {
        cout<<s;
        return;
    }
    outfile.write((char*)&st.sTime, 8);
    outfile.write((char*)&st.num, 8);
    outfile.write((char*)&st.min, 8);
    outfile.write((char*)&st.max, 8);
    // write bloom filter
    for (int i=0; i<10240; i++) {
        outfile.write(st.bloomFilter+i,1);
    }
    // write key and offset
    for(auto it = st.keyOff.begin(); it != st.keyOff.end(); it++){
        outfile.write((char*)(&it->first),sizeof(it->first));
        outfile.write((char*)(&it->second),sizeof(it->second));
        numOfKey++;
    }
    for(int i=0;i<st.data.size();i++){
        string curString=st.data[i];
        char* curString1=new char[curString.length()];
        strcpy(curString1,curString.c_str());
        for(int i=0;i<curString.length();i++){
            outfile.write((char*)(&curString1[i]), curString.length());
        }
    }
    outfile.close();
    layerFiles[layer]++;

}

uint64_t KVStore:: GetFileSize(const std::string& file_name){
    std::ifstream in(file_name.c_str());
    in.seekg(0, std::ios::end);
    size_t size = in.tellg();
    in.close();
    return size; //单位是：byte
}

void KVStore::merge(){
    int layer=1;
    if(checkLayer(0)==1){
        mergeFirstLayer();
    }
    while (true) {
        if(checkLayer(layer)==1){
            mergeOtherLayer(layer);
            //判定超出，若超出，layerFiles[layer]为上限
            layer++;
        }
        else break;
    }
}

void KVStore::mergeSort(vector<keyValTime>&v){
    vector<keyValTime>left;
    vector<keyValTime>right;
    left.assign(v.begin(), v.begin()+v.size()/2);
    right.assign(v.begin()+v.size()/2, v.end());
    if(left.size()==0 || right.size()==0){
        return;
    }
    mergeSort(left);
    mergeSort(right);
    mergeBoth(left, right,v);
}

void KVStore::mergeBoth(vector<keyValTime>&left,vector<keyValTime>&right,vector<keyValTime>&v){
    v.clear();
    int i=0,j=0;
    while (i<left.size()&& j<right.size()) {
        if(left[i].key<right[j].key)
            v.push_back(left[i++]);
        else if(left[i].key==right[j].key){
            if(left[i].stamp<right[j].stamp)v.push_back(right[j++]);
            else v.push_back(left[i++]);
        }
        else v.push_back(right[j++]);
    }
    for(i;i<left.size();i++)v.push_back(left[i]);
    for(j;j<right.size();j++)v.push_back(right[j]);
    
    return;
}

void KVStore::mergeSstable(vector<string>intersectionFile, max_t maxKey, min_t minKey, time_t maxStamp,int targetLayer){
    time_t stamp=0;
    max_t maxKeyTmp=0;
    min_t minKeyTmp=0;
    num_t num=0;
    key_t key=0,prev_key=0;
    off_t off,prev_off=0;
    int prevPos=0;
    char target[100]="";
    char bloom[10245]="";
    vector<keyValTime> allKeyValTime;
    allKeyValTime.clear();

    // search for the sstable intersected with previos layer.
    cout<<"第"<<targetLayer<<"层的开始合并的位置为："<<getBegin(targetLayer)<<endl;
    for(int i=getBegin(targetLayer);
        i<layerFiles[targetLayer]+getBegin(targetLayer);
        i++){
        string filename =getFileName(targetLayer, i);
        stamp=allSsMsg[targetLayer][i].stamp;
        if(stamp>maxStamp)maxStamp=stamp;
        num=allSsMsg[targetLayer][i].num;
        maxKeyTmp = allSsMsg[targetLayer][i].max;
        minKeyTmp =allSsMsg[targetLayer][i].min;
        //  check if intersect with the [min, max]
        bool intersection = !(minKeyTmp > maxKey || maxKeyTmp < minKey);
        if(intersection)intersectionFile.push_back(filename);
    }
    // 读入keyoff vector, note: we should push the current sstable stamp together for comparasion

    for(int i=0;i<intersectionFile.size();i++){
        ifstream inFile(intersectionFile[i],ios::in|ios::binary); //二进制读方式打开

        if(!inFile)break;
        inFile.read((char *)&stamp, sizeof(stamp)); // time
        if(stamp>maxStamp)maxStamp=stamp;
        inFile.read((char *)&num, sizeof(num)); // num
        inFile.read((char *)&minKeyTmp, sizeof(minKeyTmp)); // min
        inFile.read((char *)&maxKeyTmp, sizeof(minKeyTmp)); // max
        inFile.read((char*)&bloom, 10240);
        inFile.read((char *)&prev_key, sizeof(prev_key));
        inFile.read((char *)&prev_off, sizeof(prev_off));
        // we have read one pair key and off before.
        for(int i=0;i<num-1;i++){
            prevPos=inFile.tellg();
            inFile.read((char *)&key, sizeof(key));
            inFile.read((char *)&off, sizeof(off));
            inFile.seekg(prev_off);
            inFile.read((char *)&target, off-prev_off);
            allKeyValTime.push_back(keyValTime(prev_key, target,stamp));
            // 必须回到原来的offset的位置
            inFile.seekg(prevPos+(sizeof(key)+sizeof(off)));
            prev_key = key;
            prev_off = off;
        }
        // don't forget the last one
        inFile.read((char *)&key, sizeof(key));
        inFile.seekg(0, std::ios::end);
        off= inFile.tellg();
        inFile.read((char *)&target, off-prev_off);
        allKeyValTime.push_back(keyValTime(prev_key, target,stamp));
    }
        // 归并排序得到新的有序数组allKeyValTime
        mergeSort(allKeyValTime);
        // write to the kvstore, the stamp of every sstable= maxStamp
        for(int i=0;i<allKeyValTime.size();i++){
            putAgain(allKeyValTime[i].key, allKeyValTime[i].val, maxStamp,targetLayer);
        }
    // the last sstable can <<2 mb
        if(slmSkipMerge.num){
            SsTable *newSsTable = new SsTable(stamp, slmSkipMerge);
            string fileName = getFileName(targetLayer,layerFilesIndex[targetLayer]);
            const char*p=fileName.c_str();
            SsMsg newSsMsg(maxStamp,newSsTable->num, newSsTable->max, newSsTable->min, p,newSsTable->bloomFilter, newSsTable->keyOff);
            allSsMsg[targetLayer].push_back(newSsMsg);
            writeToFile(*newSsTable,targetLayer);
            slmSkipMerge.init();
        }
        return;
    }
    
void KVStore::mergeFirstLayer(){
    head_t minKey = INT_MAX, maxKey = 0, minKeyTmp = 0, maxKeyTmp = 0, num=0,stamp=0,maxStamp=0;
    vector<string>intersectionFile;
    vector<pair<key_t, off_t>> allKeyOff;
    vector<keyValTime> allKeyValTime;
    intersectionFile.clear();
    allKeyOff.clear();
    allKeyValTime.clear();
    //SSTable 中除了数据区外的 其他部分缓存在内存中
    for(int i=getBegin(0);i<layerFilesIndex[0];i++){
        string filename =getFileName(0, i);
        intersectionFile.push_back(filename);
        //?
        stamp=allSsMsg[0][i-getBegin(0)].stamp;
        if(stamp>maxStamp)maxStamp=stamp;
        num=allSsMsg[0][i-getBegin(0)].num;
        maxKeyTmp = allSsMsg[0][i-getBegin(0)].max;
        maxKey = (maxKey < maxKeyTmp)?maxKeyTmp:maxKey;
        minKeyTmp =allSsMsg[0][i-getBegin(0)].min;
        minKey = (minKey > minKeyTmp)?minKeyTmp:minKey;
    }
//    cout<<"min key:"<<minKey<<'\n'<<"max key:"<<maxKey<<endl;
    
    mergeSstable(intersectionFile, maxKey, minKey, maxStamp, 1);
    for(int i=getBegin(0);i<layerFilesIndex[0];i++){
        string filename = getFileName(0,i);
        const char *p = filename.c_str();
        rmfile(p);
    }
    layerFiles[0]=0;
    allSsMsg[0].clear();
}


void KVStore::mergeOtherLayer(int layer){
    int more=0;
    head_t minKey = INT_MAX, maxKey = 0, minKeyTmp = 0, maxKeyTmp = 0, num=0,stamp=0,maxStamp=0;
    int begin=getBegin(layer);
    vector<string>intersectionFile;
    vector<pair<key_t, off_t>> allKeyOff;
    vector<keyValTime> allKeyValTime;
    intersectionFile.clear();
    allKeyOff.clear();
    allKeyValTime.clear();
    
    more=layerFiles[layer]-pow(2, layer+1);
    
    
    for(int i=getBegin(layer
                       );i<begin+more;i++){
        string filename =getFileName(layer, i);
        intersectionFile.push_back(filename);
        stamp=allSsMsg[layer][i-begin].stamp;
        if(stamp>maxStamp)maxStamp=stamp;
        num=allSsMsg[layer][i-begin].num;
        maxKeyTmp = allSsMsg[layer][i-begin].max;
        maxKey = (maxKey < maxKeyTmp)?maxKeyTmp:maxKey;
        minKeyTmp =allSsMsg[layer][i-begin].min;
        minKey = (minKey > minKeyTmp)?minKeyTmp:minKey;
    }
    mergeSstable(intersectionFile, maxKey, minKey, maxStamp, layer+1);
    layerFiles[layer]=pow(2,layer+1);
    // delete the file merged
    for(int i=begin;i<more+begin;i++){
        allSsMsg[layer].erase(allSsMsg[layer].begin());
        string filename =getFileName(layer, i);
        const char*p = filename.c_str();
        rmfile(p);
    }
}

bool KVStore::checkLayer(int i){
    // return 1 if layer is overweight;
    int bound = pow(2, i+1);
    if(layerFiles[i]>bound)return 1;
    return 0;
}
