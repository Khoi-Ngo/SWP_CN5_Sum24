package org.swp.entity;


import org.swp.enums.UserRole;



public class User {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String password;
    private UserRole role;

}
