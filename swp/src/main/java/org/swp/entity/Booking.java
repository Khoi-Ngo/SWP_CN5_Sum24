package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
@Table(name = "tbl_booking")
public class Booking extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Lob
    private String bookingNote;
    private boolean isDone;
    private boolean isCanceled;



    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<BookingSlot> bookingSlots ;
    @ManyToOne
    private Pet pet;
    @ManyToOne
    private User user;
    @ManyToOne
    private Shop shop;
    @ManyToOne
    private Service service;

}
