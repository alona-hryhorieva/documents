package com.documents.dao;

import com.documents.entity.User;
import org.springframework.data.repository.CrudRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface SpringDataUserDao extends CrudRepository<User, Integer> {
    List<User> findAll();
    User findUserByLogin(String login);
    User findUserById(Integer id);
    User findUserByLoginAndPassword(String login, String Password);

    @Transactional
    void deleteById(Integer id);

}