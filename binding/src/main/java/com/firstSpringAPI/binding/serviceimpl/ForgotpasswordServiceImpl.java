package com.firstSpringAPI.binding.serviceimpl;

import com.firstSpringAPI.binding.Entity.CustomerUser;
import com.firstSpringAPI.binding.Repository.CustomerUserRepository;
import com.firstSpringAPI.binding.Utils.Constants;
import com.firstSpringAPI.binding.Utils.ResponseHandler;
import com.firstSpringAPI.binding.dto.ForgotpasswordDto;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import com.firstSpringAPI.binding.service.ForgotpasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class ForgotpasswordServiceImpl implements ForgotpasswordService {

    @Autowired
    CustomerUserRepository customerUserRepository;
    public ResponseEntity<Object> ChangePassword(ForgotpasswordDto forgotpasswordDto) {

        CustomerUser customerUser=new CustomerUser(
                forgotpasswordDto.getUsername(),
                forgotpasswordDto.getPassword()
        );

       int i= customerUserRepository.updatePassword(forgotpasswordDto.getUsername(), forgotpasswordDto.getPassword());
        System.out.println(i);
        if (i>0){
            return ResponseHandler.generateResponse(HttpStatus.OK, Constants.SUCCESS);
        }else{
            return ResponseHandler.generateResponse(HttpStatus.UNAUTHORIZED, "Does have a user");
        }
    }

}
