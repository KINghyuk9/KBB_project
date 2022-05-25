package com.example.demo.service.mapper;

import org.apache.ibatis.annotations.Mapper;

import javax.servlet.http.HttpServletRequest;

@Mapper
public interface SelectPlayerMapper {
    public void player_list(HttpServletRequest req) throws Exception;
}
