package com.example.demo.config;

import com.google.gson.Gson;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class FunctionController {

    @Autowired
    protected SqlSession sqlSession;

    @RequestMapping(value = "/player_list", method = RequestMethod.POST, produces = "application/json; charset=utf8")
    public String player_list(HttpServletRequest req) throws Exception {

        HashMap<Object, Object> result = new HashMap<Object, Object>();

        List<Map<String, String>> list = sqlSession.selectList("player_list", result);

        String json = new Gson().toJson(list);

        return json;
    }
}
