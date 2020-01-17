package com.boutique.abc78.controller;

import com.boutique.abc78.model.Role;
import com.boutique.abc78.model.User;
import com.boutique.abc78.service.SecurityService;
import com.boutique.abc78.service.UserService;
import com.boutique.abc78.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        List<Role> roles = userService.getRoles();
        model.addAttribute("roles",roles);
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,
                               Model model) {
        userValidator.validate(userForm, bindingResult);
        List<Role> roles = userService.getRoles();
        model.addAttribute("roles",roles);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

     //   securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/users";
    }

    @RequestMapping(path ="/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/", "/index"})
    public String welcome(Model model) {
        return "index";
    }


    @RequestMapping("/users")
    public String getAllItems(Model model){
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return  "users";
    }

    @GetMapping("/user")
    public String edit(Model model) {
        List<Role> roles = userService.getRoles();
        model.addAttribute("roles",roles);
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/user/edit/{username}", method = RequestMethod.GET)
    public String show(@PathVariable("username") String username,Model model){
        User user = userService.findByUsername(username);
        List<Role> roles = userService.getRoles();
        model.addAttribute("roles",roles);
        model.addAttribute("userForm", user);
        return "registration";
    }
}
