package com.boutique.abc78.service;


import com.boutique.abc78.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> findAll();


}
