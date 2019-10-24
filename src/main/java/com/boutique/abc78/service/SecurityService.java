package com.boutique.abc78.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
