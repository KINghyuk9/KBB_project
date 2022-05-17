package com.example.demo.controller;

import com.example.demo.config.TigersController;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class CreateTableController extends TigersController {

    @PostConstruct
    public void CreateTable() throws Exception{
        String[] tableList = {"PLAYER_LIST"};

        for (int i=0; i<tableList.length; i++){
            String tableName = tableList[i];
            Integer count = sqlSession.selectOne("CreateTable", tableName);
            if(count == 0) {
                if(tableName.equals("PLAYER_LIST")){
                    String result = sqlSession.selectOne("createPlayerList");
                }
            }
        }
    }

}
