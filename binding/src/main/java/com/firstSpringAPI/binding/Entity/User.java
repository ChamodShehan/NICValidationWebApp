package com.firstSpringAPI.binding.Entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer Id;

    @Column(name = "fname")
    private String fname;
    @Column(name = "address")
    private String address;
    @Column(name = "nic")
    private String nic;
    @Column(name = "birthday")
    private String birthday;
    @Column(name = "gender")
    private String gender;
    @Column(name = "age")
    private String age;
    @Column(name = "telephone")
    private String telephone;
    @Column(name = "serviceProvider")
    private String serviceProvider;
    @Column(name = "isDeleted")
    private Integer isDeleted=0;
    @Column(name = "createdBy")
    private Integer createdBy ;
    @Column(name = "createdDate")
    private LocalDateTime createdDate ;
    @Column(name = "modifyBy")
    private Integer modifyBy ;
    @Column(name = "modifyDate")
    private LocalDateTime modifyDate ;
    @Column(name = "deletedBy")
    private Integer deletedBy ;


    public User(Integer id, String fname, String address, String nic, String telephone) {
        Id = id;
        this.fname = fname;
        this.address = address;
        this.nic = nic;
        this.telephone = telephone;
    }

    public User(Integer isDeleted ) {
        this.isDeleted = isDeleted;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate=LocalDateTime.now();
    }

    public LocalDateTime getModifyDate() {
        return modifyDate=LocalDateTime.now();
    }
}
