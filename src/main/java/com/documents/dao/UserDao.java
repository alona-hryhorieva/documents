package com.documents.dao;

import com.documents.entity.User;

import java.util.List;

public interface UserDao {
    List<User> selectAll();
    User getByLoginAndPassword(String login, String password);
    User getByLogin(String login);
    User getById(Integer id);
    void insert(User user);
    void deleteById(Integer id);
    void updateById(User user);
}
