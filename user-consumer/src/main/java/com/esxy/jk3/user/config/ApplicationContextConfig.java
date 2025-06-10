package com.esxy.jk3.user.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class ApplicationContextConfig {
    @Bean
    @LoadBalanced //负载均衡方式一：结合Ribbon做负载均衡，用来标记restTemplate使之配置使用LoadBalancerClient
    public RestTemplate getRestTemplate() {
        return new RestTemplate();//RestTemplate 对象，专门用来做 REST 的请求的
    }
}
