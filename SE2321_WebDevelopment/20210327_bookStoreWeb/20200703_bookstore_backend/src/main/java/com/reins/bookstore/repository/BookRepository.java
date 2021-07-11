package com.reins.bookstore.repository;

import com.reins.bookstore.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BookRepository extends JpaRepository<Book,Integer> {

    @Query("select b from Book b")
    List<Book> getBooks();

    Book findByIsbn(String isbn);

    @Modifying
    @Query("update Book b set b.inventory=:inventory where b.bookId=:bookId")
    void decreaseInventory(@Param("inventory") Integer inventory , @Param("bookId") Integer bookId);

}




