package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.swp.enums.TypePet;


@Entity
@Data
@Table(name = "tbl_service")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String serviceName;
    private String serviceDescription;
    private double price;
    private double minWeight;
    private double maxWeight;
    private TypePet typePet;
    //relationship with BOOKING; COMMENT; SHOP
    @ManyToOne
    private ServiceCategory category;
    @ManyToOne
//    @JoinColumn(name = "shopId", nullable = false)
    private Shop shop;


}
