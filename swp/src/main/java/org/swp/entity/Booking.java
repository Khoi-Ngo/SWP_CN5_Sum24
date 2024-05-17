package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "tbl_booking")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    //pet information
    private String namePet;
    private double weight;
    private int petAge;
    //booking information
    private LocalDateTime localDateTime;
    //relationship with all ( customer, service, shop, ...)
    @ManyToOne
//    @JoinColumn(name = "userId", nullable = false)
    private User user;
    @ManyToOne
    private Service service;
}
