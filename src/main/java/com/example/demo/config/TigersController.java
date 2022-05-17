package com.example.demo.config;

import com.example.demo.service.mapper.TigersMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TigersController {

    @Autowired
    protected TigersMapper mapper;

    @Autowired
    protected SqlSession sqlSession;
}
