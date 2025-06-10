package com.esxy.jk3.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication //标记此类为springboot的启动类
@EnableDiscoveryClient //开启微服务的注册，标记为一个注册端
public class UserProviderMain2 {
    public static void main(String[] args) {
        SpringApplication.run(UserProviderMain2.class,args);
    }
}
