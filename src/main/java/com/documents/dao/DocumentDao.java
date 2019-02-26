package com.documents.dao;

import com.documents.entity.Document;

import java.util.List;

public interface DocumentDao {
    List<Document> selectAll();
    void insert(Document document);
    void deleteById(Integer id);
    void updateById(Document document);
    Document getById(Integer id);
}
