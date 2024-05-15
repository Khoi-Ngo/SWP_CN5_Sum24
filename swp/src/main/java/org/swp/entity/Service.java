package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Data
@Table(name = "tbl_service")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private Double price;

    //Category relationship
}
