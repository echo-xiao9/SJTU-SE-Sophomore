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

//    @RequestMapping(value="/books", method = RequestMethod.GET,params = "query")
    @GetMapping(path = "/books", params = "query")
    public List<Book> searchBooks(@RequestParam("query") String query){
        return bookService.searchBooks( query);
    }
    @GetMapping(path = "/books",params = "page")
    public List<Book> getBooks(@RequestParam("page") Integer page) {
        List<Book> bookList = bookService.getBooks(page);
        return bookList;
    }

    @GetMapping(value = "/books",params = "id")
    public Book getBook(@RequestParam("id") Integer id){
        return bookService.findBookById(id);
    }

    @GetMapping("/adminBook")
    public ArrayList getAdminBook(){
        return bookService.getAdminBook();
    }

    @PostMapping("/books")
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

    @DeleteMapping (path = "/books",params = "bookId")
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
