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
        for(int i=4*page-3;i<=4*page;i++){
            bookList.add(this.findOne(i));
        }
        return bookList;
    }

    @Override
    public ArrayList getAdminBook() {

        List<Book> allBooks=null;
        System.out.println("Searching allBooks in Redis");
        Object b = redisUtil.get("allBooks" );
        if(b==null){
            System.out.println("allBooks are not in Redis");
            System.out.println("Search allBooks in DB");
            allBooks = bookRepository.getBooks();
            redisUtil.set("allBooks", JSONArray.toJSON(allBooks));
        }else{
            allBooks = JSONArray.parseArray(b.toString(),Book.class);
            System.out.println("allBooks are in Redis");
        }
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
        bookRepository.save(book);
        return book;
    }

    @Override
    public Book deleteBook(Integer bookId) {
        Optional<Book> b=bookRepository.findById(bookId);
        bookRepository.deleteById(bookId);
            //isPresent方法用来检查Optional实例中是否包含值
            if (b.isPresent()) {
                //在Optional实例内调用get()返回已存在的值
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
        return b;
    }

    @Override
    public Book getSingleBook(String isbn) {
        Book book=null;
        Object b = redisUtil.get("BookISBN"+isbn );
        if(b==null){
            book=bookRepository.findByIsbn(isbn);
            redisUtil.set("BookISBN"+isbn ,JSONArray.toJSON(book));
        }else{
            book= JSONArray.parseObject(b.toString(),Book.class);
        }
        return book;
    }


}
