package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.swp.enums.TypePet;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "tbl_booking")
public class Booking extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    //pet information
    private String namePet;
    private double weight;
    private int petAge;
    private TypePet typePet;
    //booking information
    private LocalDateTime bookingTime;
    @Lob
    private String bookingNote;
    private boolean isDone;
    private boolean isCanceled;

    //relationship with all ( customer, service, shop, ...)
    @ManyToOne
    private User user;
    @ManyToOne
    private Service service;
}
