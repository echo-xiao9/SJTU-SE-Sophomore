package com.example.rootweblearning1.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.rootweblearning1.bean.Userinfo;
import org.springframework.context.annotation.Bean;

import java.util.Calendar;
import java.util.Date;


public class JWTUtils {

    public static String createToken(Userinfo userinfo, Boolean refresh){
        Date iatDate = new Date();
        // expire time
        Calendar nowTime = Calendar.getInstance();
        if(refresh){
            //refreshToken 10天过期
            nowTime.add(Calendar.DATE, 10);
        }else {
            //非refreshToken 1小时过期
            nowTime.add(Calendar.HOUR, 1);
        }
        Date expiresDate = nowTime.getTime();
        String token ="";
        String tokenSignKey = "secret123456";
        token = JWT.create().withAudience(userinfo.getUsername())
                .withClaim("user_role", userinfo.getUserRole())
                .withClaim("user_name", userinfo.getUsername())
                .withExpiresAt(expiresDate)
                .sign(Algorithm.HMAC256(tokenSignKey));
        return token;
    }

}
