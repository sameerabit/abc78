package com.boutique.abc78.service;

import com.boutique.abc78.model.Role;
import com.boutique.abc78.model.User;
import com.boutique.abc78.repository.RoleRepository;
import com.boutique.abc78.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
      //  user.setRole(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        User user = userRepository.findByUsername(username);
        return user;
    }

    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    public List<Role> getRoles(){
        return roleRepository.findAll();
    }

}
