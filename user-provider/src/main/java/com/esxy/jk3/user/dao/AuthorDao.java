package com.esxy.jk3.user.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.esxy.jk3.user.pojo.Author;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AuthorDao extends BaseMapper<Author> {
    //继承Mybatis plus 已经给我们设计好的增删改查方法，大部分情况下，不用我们写了

    //我们可以写自己想要的方法: 1. 用XML的配置文件映射方法 2. 用注解直接映射SQL语句
    @Select("select * from author where username=#{name} and password=#{pwd}")
    public Author selectByNamePasswd(@Param("name") String username , @Param("pwd")String password);

}
