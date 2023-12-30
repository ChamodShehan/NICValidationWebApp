package com.firstSpringAPI.binding.controller;

import com.firstSpringAPI.binding.dto.ForgotpasswordDto;
import com.firstSpringAPI.binding.service.ForgotpasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("api/v1/ForgotPassword")
public class ForgotpasswordController {



    @Autowired
    ForgotpasswordService forgotpasswordService;

    @CrossOrigin
    @PostMapping(path = "/update")
    public ResponseEntity<Object> changePassword(@RequestBody ForgotpasswordDto forgotpasswordDto){


        System.out.println("come");

        return forgotpasswordService.ChangePassword(forgotpasswordDto);

    }
}
