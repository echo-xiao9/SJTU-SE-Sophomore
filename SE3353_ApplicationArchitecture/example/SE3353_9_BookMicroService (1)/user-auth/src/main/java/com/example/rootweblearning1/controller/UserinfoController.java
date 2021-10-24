package com.example.rootweblearning1.controller;

import com.example.rootweblearning1.bean.Userinfo;
import com.example.rootweblearning1.service.UserinfoService;
import com.example.rootweblearning1.util.Response;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserinfoController {

    @Autowired
    UserinfoService userinfoService;

    @ResponseBody
    @PostMapping("/register")
    public Response register(Userinfo userinfo){
        return userinfoService.insert(userinfo);
    }

    @ResponseBody
    @PostMapping("/Login")
    public Response login(Userinfo userinfo){
        System.out.println("userInfo " + userinfo.toString());
        return  userinfoService.verify(userinfo);
    }

    @PostMapping("/refresh-token")
    public Response refreshToken(@RequestBody Map<String, String> refreshToken){
        return userinfoService.refreshToken(refreshToken.get("refreshToken"));
    }

}
