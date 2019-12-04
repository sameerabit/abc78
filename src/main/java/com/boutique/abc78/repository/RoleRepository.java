package com.boutique.abc78.repository;

import com.boutique.abc78.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long>{

    List<Role> findAll();

}
