package com.esxy.jk3.user.service;

import com.esxy.jk3.user.pojo.Author;

import java.util.List;

public interface AuthorService {
    public Author findByNameAndPwd(String name, String passwd);

    public int addAuthor(Author author);

    public List<Author> findAllAuthor();
}
