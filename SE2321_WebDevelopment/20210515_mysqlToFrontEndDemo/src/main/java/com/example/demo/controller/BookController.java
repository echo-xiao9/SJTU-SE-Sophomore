package com.example.demo.controller;
import com.example.demo.entity.Book;
import com.example.demo.service.BookDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
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

//    @Autowired
//    private BookDetailService bookService;
//
//@GetMapping(path="/getUsers")
//public ResponseEntity<List<User>> getUsers
//(@RequestParam (required = false) String username,
// @RequestParam (required = false) String password) {
//    return new ResponseEntity<>(customUserDetailsService.getUsers(), HttpStatus.OK); /* 注意返回Http状态 */
//}


//
//    @RequestMapping("/getBook")
//    public Book getBook(@RequestParam("id") Integer id){
//        return bookService.findBookById(id);
//    }
}

