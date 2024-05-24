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


//    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<BookingSlot> bookingSlots;
//    @ManyToMany
//    private List<Pet> pet;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "shop_id")
    private Shop shop;
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

}
