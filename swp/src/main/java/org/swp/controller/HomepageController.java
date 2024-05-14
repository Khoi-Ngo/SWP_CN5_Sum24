package org.swp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.swp.dto.response.HomepageResponse;
import org.swp.service.GuestService;

@RestController
@RequestMapping("/api/v1")
public class HomepageController {
    @Autowired
    private GuestService guestService;

    @GetMapping("/homepage")
    public ResponseEntity<HomepageResponse> homepage() {
        try {
            return ResponseEntity.ok(guestService.getHomepage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
