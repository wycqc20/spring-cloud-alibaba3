package com.esxy.jk3.gateway.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Date;

//@Component
@Slf4j
public class MyLogGatewayFilter implements GlobalFilter, Ordered {

    @Override
    public Mono< Void > filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("****** come in MyLogGateWayFilter: " + new Date());
        //测试代码，模拟用户要登录后，才能访问，必须携带 uname 这个参数，才放行
        String uname = exchange.getRequest().getQueryParams().getFirst("uname");
        if(uname == null) {
          log.info("*****用户名为null，非法用户，o(╥﹏╥)o");
          exchange.getResponse().setStatusCode(HttpStatus.NOT_ACCEPTABLE);
          return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }

    /**
     * 加载过滤器的顺序，数字越小，优先级越高
     * @return
     */
    @Override
    public int getOrder() {
        return 0;
    }
}
