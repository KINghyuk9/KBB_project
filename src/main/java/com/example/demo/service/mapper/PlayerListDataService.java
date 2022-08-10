package com.example.demo.service.mapper;

import com.example.demo.dto.list.PlayerListDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class PlayerListDataService {

    private static String KBO_LIST_URL = "https://www.koreabaseball.com/Player/Register.aspx";

    @PostConstruct
    public void getPlayerList() throws IOException{
        Document doc = Jsoup.connect(KBO_LIST_URL).get();
        Elements contents = doc.select("table tbody tr");

        for(Element content :contents){
            Elements tbContents = content.select("td");
            PlayerListDTO playerList = PlayerListDTO.builder()
                    .BackNumber(Integer.parseInt(tbContents.get(0).text()))
                    .Name(tbContents.get(1).text())
                    .Type(tbContents.get(2).text())
                    .BirthDay(tbContents.get(3).text())
                    .Size(tbContents.get(4).text())
                    .build();

            System.out.println(playerList.toString());
        }

    }
}
