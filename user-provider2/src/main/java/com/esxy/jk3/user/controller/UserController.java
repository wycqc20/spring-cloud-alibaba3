package com.esxy.jk3.user.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

//微服务的提供者，主要是提供数据，所有很少用视图，所有我们直接用restcontroller
@RestController
public class UserController {
    //获取本项目的端口号
    @Value("${server.port}")
    private String serverPort;

    @GetMapping("/show/server/{id}") //测试微服务之间的调用
    public String show(@PathVariable("id") Integer id) {
        return "Hello Nacos Discovery: user-provider1 :" + serverPort + " id: " + id;
    }

    @GetMapping("/login")
    public String login(){
        return "有人来登录了！";
    }
}
