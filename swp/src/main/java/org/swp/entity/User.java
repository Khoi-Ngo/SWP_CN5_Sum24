package org.swp.entity;


import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.swp.enums.UserRole;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Entity
@Data
@Table(name = "tbl_user")
public class User extends BaseEntity implements UserDetails {
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    //account information
    private String username;
    private String password;
    private UserRole role;
    //fundamental personal information
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    //other
    @Lob
    private String profileImageUrl;
    @Lob
    private String coverImageUrl;
    private LocalDate birthday;

    //information for SHOP_OWNER only
    //TODO: relationship with SHOP
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Shop> shopList = new ArrayList<>();

    //information for CUSTOMER only
    //TODO: relationship with Booking
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<Booking> bookings;
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<Pet> petList;


}
