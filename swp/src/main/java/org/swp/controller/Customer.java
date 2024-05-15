package org.swp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/customer")
public class Customer {
    public ResponseEntity<String> sayHello() {
        return ResponseEntity.ok("Hello World");
    }
}
