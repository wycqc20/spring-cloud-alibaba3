package com.esxy.jk3.user.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.esxy.jk3.user.common.CommonResult;
import com.esxy.jk3.user.pojo.Author;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
public class UserController {
    //我们需要用RestTemplate 去远程调用 user-provider中的功能
    @Autowired
    RestTemplate restTemplate;
    //从配置文件中，取出你想要调用的远程的微服务地址
    @Value("${service-url.nacos-user-service}")
    private String serverURL;

    @GetMapping(value = "/consumer/getser/{id}")//给客户访问的路径
    public String paymentInfo(@PathVariable("id") Integer id) {
        return restTemplate.getForObject(serverURL + "/show/server/" + id,String.class);//后端实际请求的路径
    }

    @PostMapping(value = "/consumer/user/login")//给客户访问的路径
    public Object login(@RequestParam("name") String username,
                        @RequestParam("pwd") String password){
        System.out.println("Consumer 作者登录：");
        //重点：学会怎样用 restTemplate 来发送 HTTP请求
        //1.根据自己的需要，准备请求头（键值对）
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("esxy","hubeiens666"); // 添加自定义的请求头
        //2.根据自己的需要，准备请求体，只有post请求有请求体。以键值对的方式传数据
        MultiValueMap<String, String> request_body= new LinkedMultiValueMap<>();
        request_body.add("xxx", username);
        request_body.add("yyy", password);
        //3.将上面的请求头和请求体，打包到一个 HttpEntity 实体中
        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(request_body, headers);

//        Author author = restTemplate.postForObject(serverURL + "/user/login/?xxx="+username+"&yyy="+password, null, Author.class);//去调远程provider的登录功能
        Author author = restTemplate.postForObject(serverURL + "/user/login",httpEntity,Author.class);//通过restTemplate 带上请求实体HttpEntity ，去发送请求
        //课堂作业：模仿登录的代码，完成一个注册功能
        return author;//后端实际请求的路径
    }

//     /*负载均衡方式二：不用 @LoadBalanced标注，自己调用*/
//    @Autowired
//    private LoadBalancerClient loadBalancerClient;
//
//    @GetMapping(value = "/consumer/getser2/{id}")
//    public String paymentInfo2(@PathVariable("id") Integer id) {
//        ServiceInstance instance = loadBalancerClient.choose("user-provider");
//        String url = String.format("http://%s:%s/show/server/%d",instance.getHost(),instance.getPort(),id);
//        System.out.println("-----------------"+url);
//        return restTemplate.getForObject(url,String.class);
//    }

    @RequestMapping("/user/fallback/{id}")
    @SentinelResource(value = "fallback",fallback ="userFallback",blockHandler = "userHandler", exceptionsToIgnore ={IllegalArgumentException.class})
    public CommonResult<String> fallback(@PathVariable Long id) {
        CommonResult<String> result = restTemplate.getForObject(serverURL + "/user/" + id,CommonResult.class,id);
        if(id == 0){//测试代码，当id=0抛出异常
            throw new IllegalArgumentException("IllegalArgument ,非法参数异常...");
        }else if(result.getData() == null) {//测试代码，当CommonResult 中的data=null抛出异常
            throw new NullPointerException("NullPointerException,该ID没有对应记录，空指针异常");
        }
        return  result;
    }

    public CommonResult userFallback(@PathVariable Long id,Throwable e) {//好比第二个保安，只负责处理系统内部的错误，跟限流没关系
        String str= new String(id+" : null");
        return new CommonResult(666,"异常 userFallback，exception内容： " + e.getMessage(), str);
    }

    public CommonResult userHandler(@PathVariable Long id, BlockException e) { //好比第一个保安，只负责处理限流的问题，保证系统稳定性
        String str= new String(id+":null");
        return new CommonResult(888,"blockHandler-sentinel 限流，BlockException： " + e.getMessage(), str);
    }

}
