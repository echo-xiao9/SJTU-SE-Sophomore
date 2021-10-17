package com.reins.bookstore.service;

import com.reins.bookstore.entity.Book;

import java.util.ArrayList;
import java.util.List;


public interface BookService {

    Book findBookById(Integer id);

    List<Book> getBooks(Integer page);

    List<Book> searchBooks(String query);

    ArrayList getAdminBook();

    Book addBook(String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image);

    Book deleteBook(Integer bookId);

    Book changeBook(Integer id, String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image);

}