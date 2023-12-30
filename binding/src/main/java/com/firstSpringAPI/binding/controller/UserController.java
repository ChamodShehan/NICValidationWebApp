package com.firstSpringAPI.binding.controller;

import com.firstSpringAPI.binding.Repository.CustomerUserRepository;
import com.firstSpringAPI.binding.dto.ResponseDTO;
import com.firstSpringAPI.binding.dto.UserLoginRequestDto;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import com.firstSpringAPI.binding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    CustomerUserRepository customerUserRepository;

    @CrossOrigin
    @PostMapping("v1/user/Save")
    public ResponseEntity<Object> UserSave(@RequestBody UserSaveRequestDto userSaveRequestDto)
    {
             return userService.UserSave(userSaveRequestDto);
    }
    @PostMapping("v1/user/Login")
    public ResponseEntity<Object> UserLogin(@RequestBody UserLoginRequestDto UserLoginRequestDto)
    {

//        System.out.println("come");
        return userService.UserLogin(UserLoginRequestDto);
    }
    @GetMapping("v1/user/Userlist")
    public List<UserSaveRequestDto> getUsersWithRequiredFields() {
        return customerUserRepository.findUsersWithRequiredFields();
    }
    @DeleteMapping("v1/user/DeleteUser")
    public ResponseEntity<Object> UserDelete(@RequestBody UserSaveRequestDto userSaveRequestDto)
    {


        return userService.UserDelete(userSaveRequestDto);
    }
    @PutMapping("v1/user/UpdateUser")
    public ResponseEntity<Object> UpdateUser(@RequestBody UserSaveRequestDto userSaveRequestDto)
    {

//        System.out.println("come");
        return userService.UserUpdate(userSaveRequestDto);

    }

    @GetMapping("v1/user/ResponseCount")
    public ResponseDTO ResponseCounts()  {
        return userService.ResponseCounts();
    }

}
