package org.swp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "tbl_type_pet")
public class TypePet {
    @Id
    @GeneratedValue
    private Long id;

    private String name;

    //relationship with pet || service
}
