package com.documents.services;

import com.documents.entity.User;

import java.util.List;

public interface UserService {
    User userRegistration(User user);

    User userAuthorization(User user);

    boolean deleteUserById(Integer id);

    List<User> selectUsers();

    User getByLoginAndPassword(String login, String password);

    User getByLogin(String login);

    User getById(Integer id);
}
