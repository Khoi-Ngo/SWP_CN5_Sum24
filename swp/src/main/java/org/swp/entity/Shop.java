package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@Table(name = "tbl_shop")
public class Shop extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String shopName;
    private String shopAddress;//e.g number 5/3 , 10 streeet
    private String shopPhone;
    private String shopEmail;
    private String area;//Thu Duc City || Sai Gon
    @Lob
    private String shopDescription;
    private LocalDateTime openTime;
    private LocalDateTime closeTime;
    private boolean isAvailable;
    //day of week working
    private String shopTitle;
    @Lob
    private String shopProfileImangeUrl;
    @Lob
    private String shopCoverImageUrl;
    private int totalServices;

    //TODO: relationship with Service + Booking + TimeSlot
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Service> serviceList;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<TimeSlot> timeSlotList;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Booking> bookingList;
    @ManyToMany
    private List<User> userList;


}
