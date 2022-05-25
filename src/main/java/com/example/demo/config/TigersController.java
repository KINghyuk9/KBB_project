package com.example.demo.config;

import com.example.demo.service.mapper.TigersMapper;
import com.google.gson.Gson;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TigersController {

    @Autowired
    protected TigersMapper mapper;

    @Autowired
    protected SqlSession sqlSession;



}
