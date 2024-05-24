package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.swp.enums.TypePet;

import java.util.List;


@Entity
@Data
@Table(name = "tbl_service")
public class Service extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String serviceName;
    private String serviceDescription;
    private double price;
    private double minWeight;
    private double maxWeight;
    private TypePet typePet;
    private String tags; //regex "tag1 - tag2 - tag3"


    //TODO: relationship with  BOOKING + CATEGORY
    @ManyToOne
    private ServiceCategory category;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Booking> bookingList;
    @ManyToOne
    private Shop shop;


}
