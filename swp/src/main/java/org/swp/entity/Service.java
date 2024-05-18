package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.swp.enums.TypePet;


@Entity
@Data
@Table(name = "tbl_service")
public class Service extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String serviceName;
    private String serviceDescription;
    private double price;
    private double minWeight;
    private double maxWeight;
    private TypePet typePet;
    private String tags; //regex "tag1 - tag2 - tag3"
    //relationship with BOOKING; COMMENT; SHOP
    @ManyToOne
    private ServiceCategory category;
    @ManyToOne
    private Shop shop;


}
