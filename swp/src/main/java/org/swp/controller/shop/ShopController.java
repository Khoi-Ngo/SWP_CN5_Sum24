//package org.swp.controller.shop;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api/v1")
//public class ShopController {
//
//
//    private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
//
//    @GetMapping("/shops")
//    public ResponseEntity<?> getShops() {
//        try {
//
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//}