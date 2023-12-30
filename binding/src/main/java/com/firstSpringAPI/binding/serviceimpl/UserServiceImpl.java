package com.firstSpringAPI.binding.serviceimpl;

import com.firstSpringAPI.binding.Entity.CustomerUser;
import com.firstSpringAPI.binding.Entity.User;
import com.firstSpringAPI.binding.Repository.CustomerUserRepository;
import com.firstSpringAPI.binding.Repository.UserRepository;
import com.firstSpringAPI.binding.Utils.Constants;
import com.firstSpringAPI.binding.Utils.FindLoginId;
import com.firstSpringAPI.binding.Utils.ResponseHandler;
import com.firstSpringAPI.binding.dto.ResponseDTO;
import com.firstSpringAPI.binding.dto.UserLoginRequestDto;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import com.firstSpringAPI.binding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.sql.SQLOutput;
import java.util.List;
import java.util.Optional;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    CustomerUserRepository customerUserRepository;

    public ResponseEntity<Object> UserSave(UserSaveRequestDto userSaveRequestDto){

        System.out.println(FindLoginId.findLoginId());
        User user=null;
        user=new User();
        user.setFname(userSaveRequestDto.getFname());
        user.setAddress(userSaveRequestDto.getAddress());
        user.setNic(userSaveRequestDto.getNic());
        user.setBirthday(userSaveRequestDto.getBirthday());
        user.setGender(userSaveRequestDto.getGender());
        user.setAge(userSaveRequestDto.getAge());
        user.setTelephone("+94"+userSaveRequestDto.getTelephone().substring(userSaveRequestDto.getTelephone().length()-9));
        user.setServiceProvider(userSaveRequestDto.getServiceProvider());
        user.setCreatedBy( FindLoginId.findLoginId());
        user.getCreatedDate();

        userRepository.save(user);
        return ResponseHandler.generateResponse(HttpStatus.OK, Constants.SUCCESS);
    }

    @Override
    public ResponseEntity<Object> UserLogin(UserLoginRequestDto userLoginRequestDto) {


//        CustomerUser customerUser=new CustomerUser(userLoginRequestDto.getUsername(), userLoginRequestDto.getPassword());

        List<CustomerUser> existingUsers= customerUserRepository.checkCustomer(userLoginRequestDto.getUsername(), userLoginRequestDto.getPassword());

        if (!existingUsers.isEmpty()) {
            FindLoginId.setLoginId(existingUsers.get(0).getIdcustomerUser());


            return ResponseHandler.generateResponse(HttpStatus.OK, Constants.SUCCESS);
        }else {
            return ResponseHandler.generateResponse(HttpStatus.UNAUTHORIZED, "Invalid username or password");
        }
    }
    public ResponseEntity<Object> UserDelete(UserSaveRequestDto userSaveRequestDto){
        if(userRepository.existsById(userSaveRequestDto.getId())){

            userRepository.deleteUser(userSaveRequestDto.getId(),FindLoginId.findLoginId());
        }


        return ResponseHandler.generateResponse(HttpStatus.OK, Constants.SUCCESS);
    }

    @Override
    public ResponseEntity<Object> UserUpdate(UserSaveRequestDto userSaveRequestDto) {

        System.out.println(FindLoginId.findLoginId());

        if(userRepository.existsById(userSaveRequestDto.getId())){

            Optional<User> optionalUser =userRepository.findById(userSaveRequestDto.getId());


            User user = optionalUser.get();
            user.setId(userSaveRequestDto.getId());
            user.setFname(userSaveRequestDto.getFname());
            user.setAddress(userSaveRequestDto.getAddress());
            user.setNic(userSaveRequestDto.getNic());
            user.setTelephone(userSaveRequestDto.getTelephone());
            user.setModifyBy(FindLoginId.findLoginId());
             user.getModifyDate();
            userRepository.save(user);
        }
        return  ResponseHandler.generateResponse(HttpStatus.OK, Constants.SUCCESS);
    }

    public ResponseDTO  ResponseCounts(){

        ResponseDTO response=new ResponseDTO();
        response.setMaleCount(userRepository.getMaleCount());
        response.setFemaleCount(userRepository.getFemaleCount());
        response.setDialogCount(userRepository.getDialogCount());
        response.setMobitelCount(userRepository.getMobitelCount());
        response.setHutchCount(userRepository.getHutchCount());
        response.setAirtelCount(userRepository.getAirtelCount());
        response.setIsDeletedZeroCount(userRepository.getIsDeletedZeroCount());
        response.setIsDeletedOneCount(userRepository.getIsDeletedOneCount());
        return response;

    }
}
