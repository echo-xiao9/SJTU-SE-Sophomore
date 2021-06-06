package com.reins.bookstore.controller;
import com.reins.bookstore.entity.Book;
import com.reins.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    //    @RequestMapping("/getBooks")
//    public List<Book> getBooks(@RequestBody Map<String, String> params) {
//        return bookService.getBooks();
//    }
    @GetMapping("/getBooks")
    public List<Book> getBooks() {
        return bookService.getBooks();
    }

    @GetMapping("/getBook")
    public Book getBook(@RequestParam("id") Integer id){
        return bookService.findBookById(id);
    }

    @GetMapping("/adminBook")
    public ArrayList getAdminBook(){
        return bookService.getAdminBook();
    }



}