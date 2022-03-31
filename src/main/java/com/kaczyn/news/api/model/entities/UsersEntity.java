package com.kaczyn.news.api.model.entities;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.sql.Date;
import java.time.LocalDate;
import java.util.UUID;

@Entity(name = "users")
public class UsersEntity {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id_user", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    @Type(type = "org.hibernate.type.UUIDCharType")
    private UUID idUser;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "age")
    private Integer age;

    @Column(name = "description")
    private String description;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "created_at")
    private final Date createdAt = Date.valueOf(LocalDate.now());

    public UsersEntity(String email, String password, Integer age, String description) {
        this.email = email;
        this.password = password;
        this.age = age;
        this.description = description;
    }

    public UsersEntity() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public UUID getIdUser() {
        return idUser;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
}
