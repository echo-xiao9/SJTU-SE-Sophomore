package com.example.demo.service;

import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.ArrayList;
import java.util.List;

public class BookDetailService {
    @Autowired
//    private static JdbcTemplate jdbcTemplate;

    JdbcTemplate jdbcTemplate;

//    public Book findBookById(Integer id){
//
//    }

    public  List<Book> getBooks(){
        List<Book> bookList = new ArrayList<>();
        List<String> bookNameList = new ArrayList<>();

        bookNameList.addAll(jdbcTemplate.queryForList("select name from book;", String.class));
        for (int i = 0; i < bookNameList.size(); i++)
            bookList.add(new Book(bookNameList.get(i)));
        return bookList;
    }

    @Autowired
    public  List<String> getBooksName(){
        List<String> bookNameList = new ArrayList<>();
        bookNameList.addAll(jdbcTemplate.queryForList("select name from book;", String.class));
        return bookNameList;
    }

}
