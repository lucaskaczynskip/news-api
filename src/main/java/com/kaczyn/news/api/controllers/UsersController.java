package com.kaczyn.news.api.controllers;

import com.kaczyn.news.api.model.dtos.users.UsersCreateDTO;
import com.kaczyn.news.api.model.dtos.users.UsersDTO;
import com.kaczyn.news.api.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @PostMapping("/register")
    @Validated
    private UsersDTO register(@Valid @RequestBody UsersCreateDTO usersCreateDTO) throws Exception {
        return this.usersService.create(usersCreateDTO);
    }
}
