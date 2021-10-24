package com.example.rootweblearning1.util;

import lombok.Data;

@Data
public class Response {
    private Integer code;
    private Object data;
    private String message;
}
