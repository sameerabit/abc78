package com.boutique.abc78.service;


import com.boutique.abc78.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
