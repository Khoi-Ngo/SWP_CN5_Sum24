package org.swp.controller.user.admin;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/admin")
public class DashboardController {
    public ResponseEntity<String> sayHello() {
        return ResponseEntity.ok("Hello World");
    }
}