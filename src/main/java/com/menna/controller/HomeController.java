package com.menna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("/")

    public ModelAndView helloWorld()
    {
        return new
                ModelAndView("welcome","message","Hello World");

    }

    @RequestMapping("/UserRegistration")
    // the String method returns the jsp page that we want to show
    public String htmlForm() {
        return "UserRegistration";
    }
/*
    @RequestMapping("/formresults")

    // model is a parameter that allows us to add stuff to our jsp
    // requestParam allows us to take in data from the form -- we must assign a type and variable name with it

    public String formSuccess(Model model, @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
                              @RequestParam("email") String email, @RequestParam("phoneNumber") String phoneNumber,
                              @RequestParam("password") String password) {


        // add the values to the jsp using the model and addAttribute method
        model.addAttribute("firstName", firstName);
        model.addAttribute("lastName", lastName);
        model.addAttribute("email", email);
        model.addAttribute("phoneNumber", phoneNumber);
        model.addAttribute("password", password);



        return "registrationResults";
    }
*/
}