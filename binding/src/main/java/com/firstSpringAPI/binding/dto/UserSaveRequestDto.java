package com.firstSpringAPI.binding.dto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserSaveRequestDto {
    private Integer id;
    private String fname;
    private String address;
    private String nic;
    private String birthday;
    private String gender;
    private String age;
    private String telephone;
    private String serviceProvider;

    public UserSaveRequestDto(Integer id,String fname, String address, String nic, String telephone) {
        this.id = id;
        this.fname = fname;
        this.address = address;
        this.nic = nic;
        this.telephone = telephone;
    }
}
