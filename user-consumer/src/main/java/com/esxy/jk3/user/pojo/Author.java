package com.esxy.jk3.user.pojo;


import lombok.Data;
import lombok.NoArgsConstructor;

//使用 lombok插件，通过注解，帮我们生成代码,getter/setter ,构造器，tostring 等
@Data
@NoArgsConstructor
public class Author {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String address;
    private String phone;
}