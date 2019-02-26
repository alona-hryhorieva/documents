package com.documents.dao;

import com.documents.entity.Role;
import com.documents.entity.User;
import org.springframework.data.repository.CrudRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface SpringDataRoleDao extends CrudRepository<Role, Integer> {
    Role findRoleByRole(String role);
}