package com.esxy.jk3.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.esxy.jk3.user.dao.AuthorDao;
import com.esxy.jk3.user.pojo.Author;
import com.esxy.jk3.user.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

//service 业务层，是要做业务处理的
@Service
public class AuthorServiceImpl implements AuthorService {
    //Service 调用 dao 进行增删改查
    @Autowired // spring 进行依赖注入
    private AuthorDao dao;
    @Override
    public Author findByNameAndPwd(String name, String passwd) {
        //根据账号和密码查作者，查询条件可能是千变万化的，我们需要用动态SQL拼接查询条件
//        HashMap map = new HashMap();
//        map.put("username",name);
//        map.put("password",passwd);
        QueryWrapper<Author> wrapper = new QueryWrapper<>();
        wrapper.eq("username",name);
        wrapper.eq("password",passwd);

        Author author = dao.selectOne(wrapper);

        return author;
    }

    @Override
    public int addAuthor(Author author) {
        return dao.insert(author);
    }

    @Override
    public List<Author> findAllAuthor() {
        return dao.selectList(null);
    }
}
