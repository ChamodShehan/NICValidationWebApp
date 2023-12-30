package com.firstSpringAPI.binding.service;

import com.firstSpringAPI.binding.Utils.FindLoginId;
import com.firstSpringAPI.binding.dto.ResponseDTO;
import com.firstSpringAPI.binding.dto.UserLoginRequestDto;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import org.springframework.http.ResponseEntity;

public interface UserService {
    ResponseEntity<Object> UserSave(UserSaveRequestDto userSaveRequestDto);

    ResponseEntity<Object> UserLogin(UserLoginRequestDto userLoginRequestDto);
     ResponseEntity<Object> UserDelete(UserSaveRequestDto userSaveRequestDto);
     ResponseEntity<Object> UserUpdate(UserSaveRequestDto userSaveRequestDto);

     ResponseDTO ResponseCounts();
}
