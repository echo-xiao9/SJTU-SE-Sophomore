package com.reins.bookstore.serviceimpl;

import com.reins.bookstore.dao.BookDao;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName BookServiceImpl
 * @Description the Implement of BookService
 * @Author thunderBoy
 * @Date 2019/11/6 16:04
 */

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public Book findBookById(Integer id){
        return bookDao.findOne(id);
    }

    @Override
    public List<Book> getBooks(Integer page) {
        return bookDao.getBooks(page);
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

    @Override
    public Book getSingleBook(String isbn) {
        return bookDao.getSingleBook(isbn);
    }

}
