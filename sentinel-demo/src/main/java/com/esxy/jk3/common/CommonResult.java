package com.esxy.jk3.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonResult <T> { //定义一个统一的数据返回格式
    //设计一个泛型类，在设计时不知道到底用什么类型的数据，我们用一个字母代替，将来代码调用时传递的是什么类型，这个字母代表的数据就是什么类型
    private Integer code;//放响应的状态码 eg: 404 not found
    private String message;//放响应的提示信息
    private T data; //放返回数据。泛型(定义的时候不指定数据类型，用的时候再指定数据类型)

    public CommonResult(Integer code,String message){
        this(code,message,null);//调用lombok的生成的全参构造
    }
}
