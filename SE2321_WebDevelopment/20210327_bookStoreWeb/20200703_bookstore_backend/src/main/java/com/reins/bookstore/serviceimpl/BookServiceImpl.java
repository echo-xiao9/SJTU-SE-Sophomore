package com.reins.bookstore.serviceimpl;

import com.reins.bookstore.dao.BookDao;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.service.BookService;
import com.reins.bookstore.utils.lucene.SearchFiles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName BookServiceImpl
 * @Description the Implement of BookService
 * @Author thunderBoy
 * @Date 2019/11/6 16:04
 */

@Service
@Transactional(propagation= Propagation.REQUIRED)
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;
    @Autowired
    private SearchFiles searchFiles;

    @Override
    public Book findBookById(Integer id){
        return bookDao.findOne(id);
    }

    @Override
    public List<Book> getBooks(Integer page) {
        return bookDao.getBooks(page);
    }

    @Override
    public List<Book> searchBooks(String query) {
        List<Integer> bookIdList=new ArrayList<Integer>();
        List<Book> bookList = new ArrayList<Book>();
        bookIdList = searchFiles.searchBook(query);
        if(bookIdList.size()==0)return null;
        for(Integer item:bookIdList){
            bookList.add(bookDao.findOne(item));
        }
        return bookList;
    }

    @Override
    public ArrayList getAdminBook() {
        return bookDao.getAdminBook();
    }

    @Override
    public Book addBook( String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image) {
        return bookDao.addBook( isbn,  name,  type,  author,  price,  description,  inventory,  image);

    }

    @Override
    public Book deleteBook(Integer bookId) {
        return bookDao.deleteBook( bookId);
    }

    @Override
    public Book changeBook(Integer id, String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image) {
        return bookDao.changeBook( id,isbn,  name,  type,  author,  price,  description,  inventory,  image);
    }

}
