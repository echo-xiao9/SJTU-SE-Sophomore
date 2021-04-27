#include "kvstore.h"
#include <string>
#include <fstream>

KVStore::KVStore(const std::string &dir): KVStoreAPI(dir),fileDir(dir)
{
}

KVStore::~KVStore(){
}

/**
 * Insert/Update the key-value pair.
 * No return values for simplicity.
 */
void KVStore::put(uint64_t key, const std::string &s)
{
    // If the 2MB limit is reached after insertion, the SSTables are generated.
    slmSkip.put(key, s);
    if(slmSkip.memSize()>MB*2){
        SsTable *newSsTable = new SsTable(curTime, slmSkip);
        curTime++;
        memTable.push_back(*newSsTable);
        Front frontPart(*newSsTable);
        frontList.push_back(frontPart);
        writeToFile(*newSsTable);
        slmSkip.init();
    }
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

void KVStore::writeToFile(SsTable &st){
    ofstream outfile;
    string curFileDir = fileDir+"/level-0/ssTable0.sst";
    outfile.open("data/level-0/ssTable0.sst",ios::out);
    if(!outfile)
        throw "can't open the file!";
    // write head 32B, all uint64_t
    outfile <<setw(8)<< st.sTime<<setw(8)<<
    st.num<<setw(8)<<st.min<<setw(8)<<st.max<<endl;
    // write bloom filter
    for (int i=0; i<102400; i++) {
        outfile << st.bloomFilter[i];
    }
    if(st.keyOff.size()!=st.data.size()) throw "keyOff size != data size";
    // write key and offset
    for(map<uint64_t, uint32_t>::iterator it = st.keyOff.begin(); it != st.keyOff.end(); it++){
        outfile<<setw(8)<<it->first<<setw(8)<<it->second;
        }
    // write data
    for(int i=0;i<st.data.size();i++){
        string curString=st.data[i];
        for(int i=0;i<curString.length();i++){
            outfile<<curString[i];
        }
    }
    outfile.close();
    cout<<GetFileSize("data/level-0/ssTable0.sst");
    cout<<endl;
}

uint64_t KVStore:: GetFileSize(const std::string& file_name){
    std::ifstream in(file_name.c_str());
    in.seekg(0, std::ios::end);
    size_t size = in.tellg();
    in.close();
    return size; //单位是：byte
}
