package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/KBB")
public class WebController {

    @GetMapping("/tigers_list")
    public String tigers(){
        return "tigers_list";
    }

    @GetMapping("/create")
    public String create() { return "create";}

    @GetMapping("/home")
    public String read() { return "home";}

    @GetMapping("/main")
    public String test() { return "main";}
}

