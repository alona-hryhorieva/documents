package com.documents.dao;

import com.documents.entity.Document;
import com.documents.entity.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface SpringDataDocumentDao extends CrudRepository<Document, Integer> {
    List<Document> findAll();
    Document findDocumentById(Integer id);

    @Transactional
    @Modifying
    @Query("update Document d set d.name = :name where d.id = :id")
    void updateById(@Param("name")String name, @Param("id")Integer id);

}