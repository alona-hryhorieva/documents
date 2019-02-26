package com.documents.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Entity
@Table(name="documents")
public class Document {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @NotEmpty
    @NotNull
    private String name;
    @NotEmpty
    @NotNull
    private byte[] file;
    @NotEmpty
    @NotNull
    private String type;
    private Timestamp date;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user")
    private User user;


    public Document() {
    }

    public Document(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Document(Integer id, String name, User user) {
        this.id = id;
        this.name = name;
        this.user = user;
    }

    public Document(String name, User user) {
        this.name = name;
        this.user = user;
    }

    public Document(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Document{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", user=" + user +
                '}';
    }
}
