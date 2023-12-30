package com.firstSpringAPI.binding.Entity;


import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "customeruser")
public class CustomerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idcustomerUser")
    private Integer idcustomerUser;
    @Column(name = "fullname")
    private String fullname;
    @Column(name = "userName")
    private String userName;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;

    public CustomerUser(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }
}
