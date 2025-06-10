package com.esxy.jk3.conf.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope //用来启动Nacos的动态刷新功能
public class ConfigClenetController {

    @Value("${database.password}")
    String configinfo;

//    @Value("${config.info}") //取 public 取公共空间的参数
//    private String configinfo;

    @GetMapping("/config/info")
    public String getConfig(){
        System.out.println("nacos配置中心的参数："+configinfo);
        return configinfo;
    }
}
