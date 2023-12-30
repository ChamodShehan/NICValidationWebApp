package com.firstSpringAPI.binding.Repository;

import com.firstSpringAPI.binding.Entity.CustomerUser;
import com.firstSpringAPI.binding.Entity.User;
import com.firstSpringAPI.binding.dto.UserSaveRequestDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CustomerUserRepository extends JpaRepository<CustomerUser,Integer> {

    @Query("SELECT u FROM CustomerUser u WHERE u.userName = :username AND u.password = :password")
    List<CustomerUser> checkCustomer(@Param("username") String username, @Param("password") String password);

    @Transactional
    @Modifying
    @Query("UPDATE CustomerUser u SET u.password = :password WHERE u.userName = :username")
    int updatePassword(@Param("username") String username, @Param("password") String password );

    @Query("SELECT new com.firstSpringAPI.binding.dto.UserSaveRequestDto(u.Id, u.fname, u.address , u.nic, u.telephone) FROM User u where u.isDeleted=0")
    List<UserSaveRequestDto> findUsersWithRequiredFields();
}
