package com.example.demo.student;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

//@Component is the same as service, but the latter is more readable.
@Service
public class StudentService {
    public List<Student> getStudents(){
        return List.of(
                new Student(
                        1L,
                        "mary",
                        "mary@qq.com",
                        20
                )
        );
    }
}
