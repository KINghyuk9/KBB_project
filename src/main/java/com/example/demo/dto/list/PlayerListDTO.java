package com.example.demo.dto.list;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@ToString
@Builder
@Getter
public class PlayerListDTO {

    private int BackNumber; // 등번호

    private String Name; // 이름

    private String Type; // 투타유형

    private String BirthDay; // 생년월일

    private String Size; // 체격
}
