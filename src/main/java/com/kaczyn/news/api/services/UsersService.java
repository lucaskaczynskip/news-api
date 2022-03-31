package com.kaczyn.news.api.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kaczyn.news.api.exceptions.BusinessRuleException;
import com.kaczyn.news.api.model.dtos.users.UsersCreateDTO;
import com.kaczyn.news.api.model.dtos.users.UsersDTO;
import com.kaczyn.news.api.model.entities.UsersEntity;
import com.kaczyn.news.api.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private ObjectMapper mapper;

    public UsersDTO create(UsersCreateDTO usersCreateDTO) throws BusinessRuleException {
        if (this.userAlreadyExists(usersCreateDTO.getEmail())) {
            throw new BusinessRuleException("User alreary exists.");
        }
        UsersEntity entity = mapper.convertValue(usersCreateDTO, UsersEntity.class);
        UsersEntity created = this.usersRepository.save(entity);
        UsersDTO usersDTO = mapper.convertValue(created, UsersDTO.class);
        usersDTO.setUsername(usersDTO.getEmail());
        return usersDTO;
    }

    public boolean userAlreadyExists(String email) {
        Optional<UsersEntity> exists = this.usersRepository.findByEmail(email);
        return exists.isPresent();
    }
}
