package org.swp.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.sql.Update;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.swp.enums.UserRole;

import java.util.Collection;
import java.util.List;
import java.util.Set;


@Entity
@Data
@Table(name = "tbl_user")
public class User implements UserDetails {
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
    private Long id;

    private String username;
    private String password;
    private UserRole role;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;


    //relationship with PET; BOOKING; SHOP; COMMENT; REPORT

//    //1 - n booking
//    @OneToMany(cascade = CascadeType.REFRESH)
//    private Set<Booking> bookings;
//    //n-n shop

    @ManyToMany(cascade = CascadeType.ALL)
//    @JoinTable(
//            name = "user_shop",
//            joinColumns = @JoinColumn(name = "userId"),
//            inverseJoinColumns = @JoinColumn(name = "shopId")
//    )
    private Set<Shop> shops;


}
