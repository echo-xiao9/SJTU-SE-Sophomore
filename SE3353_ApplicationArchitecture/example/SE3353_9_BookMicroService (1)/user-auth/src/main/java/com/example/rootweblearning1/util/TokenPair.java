package com.example.rootweblearning1.util;

import lombok.Data;

@Data
public class TokenPair {
    public TokenPair(String _token, String _refreshToken){
        token = _token;
        refreshToken = _refreshToken;
    }
    String token;
    String refreshToken;
}
