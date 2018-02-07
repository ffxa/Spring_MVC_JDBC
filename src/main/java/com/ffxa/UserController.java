package com.ffxa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController
{
    private final UserDAO userDAO;

    @Autowired
    public UserController(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @RequestMapping(value = "/user",method=RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute("user") User user)
    {
        userDAO.saveUser(user);
        return new ModelAndView("redirect:/users");
    }

    @RequestMapping(value = "/users")
    public ModelAndView listUsers(@ModelAttribute("user") User user)
    {
        ModelAndView model = new ModelAndView("users");

        List<User> userList = userDAO.getAllUsers();
        model.addObject("userList", userList);
        
        return model;
    }
}
