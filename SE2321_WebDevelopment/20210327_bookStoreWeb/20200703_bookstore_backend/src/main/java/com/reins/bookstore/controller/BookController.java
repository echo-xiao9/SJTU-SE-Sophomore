package com.reins.bookstore.controller;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName BookController
 * @Description TODO
 * @Author thunderBoy
 * @Date 2019/11/6 16:07
 */
@RestController
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/getBooks")
    public List<Book> getBooks(@RequestParam("page") Integer page) {
        List<Book> bookList = bookService.getBooks(page);
        System.out.println("bookList size:"+bookList.size());
        return bookList;
    }

    @GetMapping("/getBook")
    public Book getBook(@RequestParam("id") Integer id){
        return bookService.findBookById(id);
    }

    @GetMapping("/adminBook")
    public ArrayList getAdminBook(){
        return bookService.getAdminBook();
    }

    @GetMapping("/addBook")
    public Book addBook(
            @RequestParam("isbn") String isbn,
            @RequestParam("name") String name,
            @RequestParam("type")String type,
            @RequestParam("author")String author,
            @RequestParam("price") Integer price,
            @RequestParam("description")String description,
            @RequestParam("inventory") Integer inventory,
            @RequestParam("image") String image
    ){return bookService.addBook(isbn,name,type,author,price,description,inventory,image);}

    @GetMapping("/deleteBook")
    public Book deleteBook(@RequestParam("bookId") Integer bookId){
        return bookService.deleteBook(bookId);
    }

    @GetMapping("/changeBook")
    public Book changeBook(
            @RequestParam("id") Integer id,
    @RequestParam("isbn") String isbn,
    @RequestParam("name") String name,
    @RequestParam("type")String type,
    @RequestParam("author")String author,
    @RequestParam("price") Integer price,
    @RequestParam("description")String description,
    @RequestParam("inventory") Integer inventory,
    @RequestParam("image") String image
    ){





            return bookService.changeBook(id,isbn,name,type,author,price,description,inventory,image);
    }
}
