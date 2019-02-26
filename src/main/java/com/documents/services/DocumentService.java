package com.documents.services;

import com.documents.entity.Document;

import java.util.List;

public interface DocumentService {
    List<Document> allDocuments();

    void newDocument(Document document);

    void updateById(Document document);

    void deleteById(Integer id);

    Document getById(Integer id);
}
