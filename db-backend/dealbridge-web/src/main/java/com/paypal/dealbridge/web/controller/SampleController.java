package com.paypal.dealbridge.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {
    
    @RequestMapping(path="/hello_world", method=RequestMethod.GET)
    public String helloWorld() {
        return "Hello World!";
    }
}
