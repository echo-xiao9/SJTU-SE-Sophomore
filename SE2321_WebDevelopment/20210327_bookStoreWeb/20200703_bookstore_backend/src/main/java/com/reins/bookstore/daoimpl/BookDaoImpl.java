package com.reins.bookstore.daoimpl;

import com.reins.bookstore.dao.BookDao;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.repository.BookRepository;
//import net.sf.json.JSONArray;
import com.reins.bookstore.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.JSON;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

/**
 * @ClassName BookDaoImpl
 * @Description TODO
 * @Author thunderBoy
 * @Date 2019/11/5 20:20
 */
@Repository
public class BookDaoImpl implements BookDao {

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    RedisUtil redisUtil;

    @Override
    public Book findOne(Integer id){
        Book book=null;
        System.out.println("Searching Book: " + id + " in Redis");
        Object b = redisUtil.get("book" + id);
        if(b==null){
            System.out.println("Book: "+id+" is not in Redis");
            System.out.println("Searching Book: "+id+" in DB");
            book = bookRepository.getById(id);
            redisUtil.set("book"+id,JSONArray.toJSON(book));
        }else{
            book = JSONArray.parseObject(b.toString(),Book.class);
            System.out.println("Book: "+id+" is in Redis");
        }
        return book;
    }

    @Override
    public List<Book> getBooks(Integer page) {
        List<Book>bookList = new ArrayList<Book>();
        List<Integer> bookIdList =new ArrayList<Integer>();
        List<Book>targetList =  new ArrayList<Book>();
        Object bIdList=redisUtil.get("bookIdList");

        if(bIdList==null){
            // refresh the cache
            bookList=bookRepository.findAll();
            for (int i = 0; i < bookList.size(); i++) {
                Book b=bookList.get(i);
                redisUtil.set("book"+b.getBookId(),JSONArray.toJSON(b));
                bookIdList.add(b.getBookId());
                System.out.println("set Book in redis: "+bookList.get(i).getBookId());
            }
            redisUtil.set("bookIdList",JSONArray.toJSON(bookIdList));
            // prepare the result
            for(int i=4*page-3 ;i<bookList.size() && i<=4*page;i++){
                targetList.add(bookList.get(i));
            }
        }
        else{
            bookIdList=JSONArray.parseArray(bIdList.toString(),Integer.class);
            for(int i=4*page-3 ;i<bookIdList.size() && i<=4*page;i++){
                targetList.add(findOne(bookIdList.get(i)));
            }

        }
        return targetList;
    }

    public List<Book> getAllBooks(){
        List<Book> allBooks=new ArrayList<Book>();
        List<Integer> bookIdList =new ArrayList<Integer>();
        Object bIdList=redisUtil.get("bookIdList");
        if(bIdList==null){
            allBooks=bookRepository.findAll();
            for (int i = 0; i < allBooks.size(); i++) {
                Book b=allBooks.get(i);
                redisUtil.set("book"+b.getBookId(),JSONArray.toJSON(b));
                bookIdList.add(b.getBookId());
                System.out.println("set Book in redis: "+allBooks.get(i).getBookId());
            }
            redisUtil.set("bookIdList",JSONArray.toJSON(bookIdList));
        }
        else{
            bookIdList=JSONArray.parseArray(bIdList.toString(),Integer.class);
            for (int i = 0; i < bookIdList.size(); i++) {
                allBooks.add(findOne(bookIdList.get(i)));
            }
    }
        return allBooks;
}
    public void updateIdList(Boolean add, Integer id){
        Object bIdList=redisUtil.get("bookIdList");
        if(bIdList==null)return;
        List<Integer> bookIdList =new ArrayList<Integer>();
        bookIdList=JSONArray.parseArray(bIdList.toString(),Integer.class);
        if(add){
            bookIdList.add(id);
        }
        else{
            for (Integer item : bookIdList) {
                if(id.equals(item)) {
                    bookIdList.remove(item);
                }
            }
        }
        redisUtil.set("bookIdList",JSONArray.toJSON(bookIdList));
    }



    @Override
    public ArrayList getAdminBook() {
        List<Book> allBooks=getAllBooks();
        Iterator<Book> it = allBooks.iterator();
        ArrayList<JSONArray> booksJson = new ArrayList<JSONArray>();
        while (it.hasNext()) {
            Book book = (Book) it.next();
            ArrayList<String> arrayList = new ArrayList<String>();
            arrayList.add(book.getBookId().toString());
            arrayList.add(book.getIsbn());
            arrayList.add(book.getName());
            arrayList.add(book.getType());
            arrayList.add(book.getAuthor());
            arrayList.add(book.getPrice().toString());
            arrayList.add(book.getInventory().toString());
            arrayList.add(book.getImage());
            arrayList.add(book.getDescription());
            booksJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        String  booksString = JSON.toJSONString(booksJson, SerializerFeature.BrowserCompatible);
        return booksJson;
    }

    @Override
    public Book addBook( String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image) {
        Book book= new Book(isbn,name, type, author, price, description, inventory, image);
        Book b=bookRepository.save(book);
        redisUtil.set("book"+b.getBookId(),JSONArray.toJSON(b));
        updateIdList(true,b.getBookId());
        return book;
    }

    @Override
    public Book deleteBook(Integer bookId) {
        Optional<Book> b=bookRepository.findById(bookId);
        bookRepository.deleteById(bookId);
            //isPresent方法用来检查Optional实例中是否包含值
            if (b.isPresent()) {
                //在Optional实例内调用get()返回已存在的值
                // update cache
                redisUtil.del("book"+b.get().getBookId());
                updateIdList(false,b.get().getBookId());
                return b.get();
            }else return null;
    }

    @Override
    public Book changeBook(Integer id,String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image) {
        Book b=this.findOne(id);
        b.setBookId(id);
        b.setIsbn(isbn);
        b.setName(name);
        b.setType(type);
        b.setAuthor(author);
        b.setPrice(price);
        b.setDescription(description);
        b.setInventory(inventory);
        bookRepository.save(b);
        // update cache
        redisUtil.set("book"+b.getBookId(),JSONArray.toJSON(b));
        return b;
    }



}
