package com.example.demo.config;

import org.springframework.stereotype.Component;

@Component
public class Tags {
    public class Config{
        public static final String COMPONENT_SCAN_PATH 		= "com.example.demo";
        public static final String MAPPER_SCAN_PATH         = "com.example.demo.service.mapper";
        public static final String MAPPER_RESOURCE_PATH     = "classpath*:/mappers/**/*Mapper.xml";
    }
}
