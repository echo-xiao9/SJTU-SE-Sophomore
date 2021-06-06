package com.reins.bookstore.daoimpl;

import com.reins.bookstore.dao.BookDao;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.repository.BookRepository;
//import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.JSON;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

    @Override
    public Book findOne(Integer id){
        return bookRepository.getOne(id);
    }


    @Override
    public List<Book> getBooks() {
        return bookRepository.getBooks();
    }

    @Override
    public ArrayList getAdminBook() {
        List<Book> result =bookRepository.getBooks();

        Iterator<Book> it = result.iterator();

        ArrayList<JSONArray> booksJson = new ArrayList<JSONArray>();
        while (it.hasNext()) {
            Book book = (Book) it.next();
            ArrayList<String> arrayList = new ArrayList<String>();
            arrayList.add(book.getName());
            arrayList.add(book.getAuthor());
            arrayList.add(book.getIsbn());
            arrayList.add(book.getImage());
            arrayList.add(book.getInventory().toString());
            booksJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        String  booksString = JSON.toJSONString(booksJson, SerializerFeature.BrowserCompatible);
        return booksJson;
    }

}
