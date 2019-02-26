package com.documents.controller;

import com.documents.entity.User;
import com.documents.services.impl.UserServiceImpl;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userServiceImpl;

    @Autowired
    protected AuthenticationManager authenticationManager;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getMainPage(Model model) {
        return "index";
    }

    @RequestMapping(value = "registration", method = RequestMethod.GET)
    public String getRegistrationPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("user", new User());
        return "registration";
    }

    @RequestMapping(value = "registration", method = RequestMethod.POST)
    public String registerNewUser(@ModelAttribute("newUser") @Valid User user,
                                  BindingResult result,
                                  HttpServletRequest req,
                                  Model model) {

        if (result.hasErrors()){
            model.addAttribute("newUser", user);
            model.addAttribute("user", new User());
            return "registration";
        }

        System.out.println(user);
        userServiceImpl.userRegistration(user);
        authenticateUserAndSetSession(user, req);
        return "redirect:/";
    }


    private void authenticateUserAndSetSession(User user, HttpServletRequest request) {
        String username = user.getLogin();
        String password = user.getPassword();
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);

        request.getSession();

        token.setDetails(new WebAuthenticationDetails(request));
        Authentication authenticatedUser = authenticationManager.authenticate(token);

        SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
    }
}
