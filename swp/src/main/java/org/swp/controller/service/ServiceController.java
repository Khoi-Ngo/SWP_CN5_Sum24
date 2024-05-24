//package org.swp.controller.service;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.swp.controller.shop.ShopController;
//import org.swp.service.ServiceService;
//
//@RestController
//@RequestMapping("/api/v1")
//public class ServiceController {
//    private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);
//
//    @Autowired
//    private ServiceService serviceService;
//
//
//    //get all services
//    @GetMapping("/services")
//    public ResponseEntity<?> getServices() {
//        try {
//            return ResponseEntity.ok(serviceService.getServices());
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //get top Services
//    @GetMapping("/services/top")
//    //Default No input for number of record => 5
//    public ResponseEntity<?> getService() {
//        try {
//            return ResponseEntity.ok(serviceService.getTopServices());
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    @GetMapping("/services/top/{topNumber}")
//    public ResponseEntity<?> getService(@PathVariable("topnNumber") int topNumber) {
//        try {
//            return ResponseEntity.ok(serviceService.getTopServices(topNumber));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //get a Service
//    @GetMapping("/service/{serviceId}")
//    public ResponseEntity<?> getServiceById(@PathVariable("serviceId") int serviceId) {
//        try {
//            return ResponseEntity.ok(serviceService.getService(serviceId));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //search service by name String
//    @GetMapping("/services/{search}")
//    public ResponseEntity<?> getServiceBySearch(@PathVariable("search") String search) {
//        try {
//            return ResponseEntity.ok(serviceService.getServices(search));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //search service by petype
//
//    //search service by price
//    @GetMapping("/services/{price}")
//    public ResponseEntity<?> getServiceByPrice(@PathVariable("price") double price) {
//        try {
//            return ResponseEntity.ok(serviceService.getServices(price));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //search service lower price
//    @GetMapping("/services/{maxPrice}")
//    public ResponseEntity<?> getServicesLowerPrice(@PathVariable("maxPrice") double maxPrice) {
//        try {
//            return ResponseEntity.ok(serviceService.getServices(0, maxPrice));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//
//    }
//
//    //search service higher price
//    @GetMapping("/services/{minPrice}")
//    public ResponseEntity<?> getServicesHigherPrice(@PathVariable("minPrice") double minPrice) {
//        try {
//            return ResponseEntity.ok(serviceService.getServices(minPrice, Double.MAX_VALUE));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//
//    }
//
//
//    //search service in price range
//    @GetMapping("/services/{minPrice}/{maxPrice}")
//    public ResponseEntity<?> getServiceInPriceRange(@PathVariable("minPrice") double minPrice, @PathVariable("maxPrice") double maxPrice) {
//        try {
//            return ResponseEntity.ok(serviceService.getServices(minPrice, maxPrice));
//        } catch (Exception e) {
//            logger.error(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }
//
//    //search service by address||area||country of shops
//    //TODO: multiple filter should be conducted on frontend
//}
