package com.kaczyn.news.api.model.dtos.users;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UsersCreateDTO {

    @NotEmpty
    @Email
    private String email;

    @NotNull
    @Size(min = 8, message = "password must be have 8 characters.")
    private String password;

    @NotNull
    private Integer age;

    private String description;

    public UsersCreateDTO(String email, String password, Integer age, String description) {
        this.email = email;
        this.password = password;
        this.age = age;
        this.description = description;
    }

    public UsersCreateDTO() {
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
}
