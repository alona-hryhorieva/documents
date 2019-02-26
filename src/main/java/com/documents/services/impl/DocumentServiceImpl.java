package com.documents.services.impl;

import com.documents.dao.DocumentDao;
import com.documents.dao.SpringDataDocumentDao;
import com.documents.entity.Document;
import com.documents.services.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    SpringDataDocumentDao documentDao;

    public DocumentServiceImpl(){}

    public List<Document> allDocuments(){
        return documentDao.findAll();
    }

    public void newDocument(Document document){
        documentDao.save(document);
    }

    public void updateById(Document document){
        documentDao.updateById(document.getName(), document.getId());
    }

    public Document getById(Integer id){
        return documentDao.findDocumentById(id);
    }

    public void deleteById(Integer id){
        documentDao.deleteById(id);
    }
}
