package com.esxy.jk3.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.esxy.jk3.common.CommonResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

@RestController
public class FlowLimitController {
    //写几个简单的请求资源路径，测试sentinel的限流功能
    @GetMapping("/s1")
    public String test1() {
        return "----test1";
    }

    @GetMapping("/s2")
    public String test2() {
        return "----test2";
    }

    @GetMapping("/s3")
    public String test3() {
        int x = 10/0; // 抛算术异常
        try {
            TimeUnit.SECONDS.sleep(5);//让线程休眠5秒
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "----test3";
    }

    @GetMapping("/s4")
    @SentinelResource(value = "s4",blockHandler = "handler_testHot")
    //value = "xxx" 不带/,sentinel配置的请求资源名,热点规则基于此资源名进行配置
    public String test4(@RequestParam(value = "p1",required = false) String p1,
                        @RequestParam(value = "p2",required = false) String p2) {
        return "----test4 热点限流案例";
    }

    //定义自己的方法处理限流提示。handler方法的声明须要跟业务方法保持一致，并需添加BlockException参数
    public String handler_testHot(String p1, String p2, BlockException exception) {
        return "热点限流，上热门了，不能把系统搞崩溃----fallback_testHot, 出错了！";
        // sentinel的默认提示都是： Blocked by Sentinel (flow limiting)
    }

    @GetMapping("/s5")
    @SentinelResource(value = "s5",blockHandler = "myhandler")
    public CommonResult test5() {
        CommonResult cr = new CommonResult(200,"返回自定义的一个结果","自己生成的数据，随便都行");
        return cr;
    }

    public CommonResult myhandler(BlockException exception) {//用自定义的功能，返回限流结果
        System.out.println("---------------------------s5被限流了");
        return  new CommonResult(456,exception.getClass().getCanonicalName() + "\t 服务不可用");
    }

}
