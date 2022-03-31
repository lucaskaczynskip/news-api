package com.kaczyn.news.api.model.dtos.users;

public class UsersDTO extends UsersCreateDTO {

    private String idUser;
    private String username;

    public UsersDTO(String email, String password, Integer age, String description, String idUser) {
        super(email, password, age, description);
        this.idUser = idUser;
    }

    public UsersDTO() {
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

     public void setUsername(String string) {
        String[] email = string.split("@");
        this.username = email[0];
    }

    public String getIdUser() {
        return idUser;
    }

    public String getUsername() {
        return username;
    }
}
