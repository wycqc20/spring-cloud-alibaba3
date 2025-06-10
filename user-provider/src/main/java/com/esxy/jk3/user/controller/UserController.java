package com.esxy.jk3.user.controller;

import com.esxy.jk3.user.common.CommonResult;
import com.esxy.jk3.user.pojo.Author;
import com.esxy.jk3.user.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

//微服务的提供者，主要是提供数据，所有很少用视图，所有我们直接用restcontroller
@RestController
public class UserController {
    @Autowired //依赖注入
    AuthorService service;

    //获取本项目的端口号
    @Value("${server.port}")
    private String serverPort;

    @GetMapping("/show/server/{id}") //测试微服务之间的调用
    public String show(@PathVariable("id") Integer id) {
        return "Hello Nacos Discovery: user-provider1 :" + serverPort + " id: " + id;
    }

    //现在是在provide项目中，开发实际的功能，我们对Consumer的请求该怎么设计呢？
    @PostMapping("/user/login")
    public Author login(@RequestParam("xxx") String username,
                        @RequestParam("yyy") String password){
        System.out.println("作者登录：");
        System.out.println(username);
        System.out.println(password);

        Author author = service.findByNameAndPwd(username,password);
        System.out.println(author);
        return author;//将对象转换为JSON的字符串返回
    }

    //测试代码，模拟从数据库中查询了一些user 放在map集合中
    public static HashMap<Long, String > map = new HashMap<>();
    static {
        map.put(1L,"用户111");
        map.put(2L,"用户222");
        map.put(3L,"用户333");
    }
    @GetMapping(value = "/user/{id}")
    public CommonResult<String> StringSQL(@PathVariable("id") Long id) {
        String user = map.get(id);//测试代码，模拟根据id从集合中查询user
        CommonResult<String> result = new CommonResult<>(200,"from DataBase, serverPort: " + serverPort, user);
        System.out.println(result);
        return result;
    }

    @GetMapping(value = "/user/nacos/{id}") // 测试代码：provider接口是内部接口，内部程序调用的
    public String getServerPort(@PathVariable("id") Integer id) {//SSM开发该怎么做怎么做
        return "Hello Nacos Discovery: 网关引导过来的请求" + serverPort + "\\t id: " + id;
    }

    @GetMapping(value = "/user2/nacos/{id}") //测试代码：
    public String getServerPort2(@PathVariable("id") Integer id) {//SSM开发该怎么做怎么做
        return "Hello Nacos Discovery:  网关引导过来的请求" + serverPort + "\\t id: " + id;
    }


}
