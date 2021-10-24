package com.example.demo_book.Controller;

import com.example.demo_book.DTO.ResultDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
public class BookController {
    @RequestMapping("/buyBook")
    public ResultDTO checkAuth(@RequestHeader("userName") String userName,
                               @RequestParam("bookName") String bookName){
        log.info("userName: {}, bookName: {}", userName, bookName);
        return ResultDTO.success(String.format("userName: %s, bookName: %s", userName, bookName));
    }
}
