package com.example.rootweblearning1.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.rootweblearning1.bean.Userinfo;
//import org.apache.catalina.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserinfoMapper extends BaseMapper<Userinfo> {
}
