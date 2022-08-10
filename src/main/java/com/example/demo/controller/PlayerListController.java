package com.example.demo.controller;

import com.example.demo.dto.list.PlayerListDTO;
import com.example.demo.service.mapper.PlayerListDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class PlayerListController {
//    private final PlayerListDataService playerListDataService;
//
//    @GetMapping("/KBB/listtest")
//    public String listtest(Model model) throws IOException {
//
//        List<PlayerListDTO> playerListDTOList = playerListDataService.getplayerListDTOList();
//
//        model.addAttribute("playerListDTOList", playerListDTOList);
//
//        return "listtest"; // TODO : controller와 view 구현이 안됨. thymeleaf의 구현방식을 jsp로 바꿔야함.
//    }

}
