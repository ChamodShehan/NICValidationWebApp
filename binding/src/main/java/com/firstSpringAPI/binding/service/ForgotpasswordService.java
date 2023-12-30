package com.firstSpringAPI.binding.service;

import com.firstSpringAPI.binding.dto.ForgotpasswordDto;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;


public interface ForgotpasswordService {

    public ResponseEntity<Object> ChangePassword(ForgotpasswordDto forgotpasswordDto);
}
