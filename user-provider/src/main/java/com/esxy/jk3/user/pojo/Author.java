package com.esxy.jk3.user.pojo;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

//使用 lombok插件，通过注解，帮我们生成代码,getter/setter ,构造器，tostring 等
@Data
@NoArgsConstructor
@TableName("author") // mybatis-plus 框架，将此实体类跟数据库中的表进行映射
public class Author {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String address;
    private String phone;

}