package org.swp.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

@Entity
@Data
@Table(name = "tbl_shop")
public class Shop extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String shopName;
    private String address;
    private String phone;
    private String email;
    private String area;
    private String country;

    //relationship with SHOP_OWNER; MEMBERSHIP; COMMENT, SERVICE

}
