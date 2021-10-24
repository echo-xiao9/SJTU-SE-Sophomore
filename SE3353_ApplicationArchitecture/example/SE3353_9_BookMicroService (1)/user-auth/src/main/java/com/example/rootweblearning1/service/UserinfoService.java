package com.example.rootweblearning1.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.rootweblearning1.bean.Userinfo;
import com.example.rootweblearning1.mapper.UserinfoMapper;
import com.example.rootweblearning1.util.JWTUtils;
import com.example.rootweblearning1.util.Response;
import com.example.rootweblearning1.util.TokenPair;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class UserinfoService {
    @Autowired
    UserinfoMapper userinfoMapper;
    /*
    检测 username 是否已经存在
     */
    private boolean usernameExist(String username){
        QueryWrapper<Userinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return userinfoMapper.selectCount(queryWrapper) == 1;
    }

    public Response insert(Userinfo userinfo){
        Response response = new Response();

        // 如果 username 已经存在，则返回 error message
        if(usernameExist(userinfo.getUsername())){
            response.setCode(201);
            response.setMessage("Username existed!");
        }
        else{
            userinfo.setUserRole("USER");
            userinfoMapper.insert(userinfo);
            response.setCode(200);
            response.setMessage("success");
        }

        return response;
    }

    public TokenPair createTokenPair(Userinfo userinfo){
        String token, refreshToken;
        // token
        token = JWTUtils.createToken(userinfo, false);
        // refreshToken
        refreshToken = JWTUtils.createToken(userinfo, true);
        return new TokenPair(token, refreshToken);
    }


    public Response verify(Userinfo userinfo) {
        Response response = new Response();
        QueryWrapper<Userinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userinfo.getUsername());

        if(usernameExist(userinfo.getUsername())){
            Userinfo _userinfo = userinfoMapper.selectOne(queryWrapper);
            System.out.println(userinfo);
            if(Objects.equals(userinfo.getPassword(), _userinfo.getPassword())) {
                response.setCode(200);
                response.setMessage("success");
                response.setData(createTokenPair(_userinfo));
            }
            else{
                response.setCode(201);
                response.setMessage("Wrong username or password");
            }
        }
        else{
            response.setCode(201);
            response.setMessage("Wrong username or password");
        }
        return  response;
    }

    public Response refreshToken(String refreshToken) {
        Response response = new Response();
        String username = null;
        try{
            DecodedJWT decodedJWT = JWT.decode(refreshToken);
            username = decodedJWT.getAudience().get(0);
        }
        catch (JWTDecodeException jwtDecodeException) {
            response.setCode(201);
            response.setData("");
            response.setMessage("RefreshToken is invalid!");
            return response;
        }

        if(usernameExist(username)){
            QueryWrapper<Userinfo> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username", username);
            Userinfo _userinfo = userinfoMapper.selectOne(queryWrapper);

            response.setCode(200);
            response.setData(createTokenPair(_userinfo));
            response.setMessage("success");

        }
        else{
            response.setCode(201);
            response.setData("");
            response.setMessage("RefreshToken is invalid!");
        }
        return response;
    }

}
