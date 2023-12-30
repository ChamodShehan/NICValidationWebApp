package com.firstSpringAPI.binding.Repository;

import com.firstSpringAPI.binding.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository <User,Integer>{

    @Transactional
    @Modifying

    @Query("UPDATE User u SET u.isDeleted = 1, u.deletedBy = :loginId WHERE u.Id = :id")
    int deleteUser(@Param("id") Integer id ,@Param("loginId")Integer loginId);

    @Query("SELECT COUNT(c) FROM User c WHERE c.gender = 'M' AND c.isDeleted=0")
    long getMaleCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.gender = 'F' AND c.isDeleted=0")
    long getFemaleCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.serviceProvider = 'Dialog' AND c.isDeleted=0")
    long getDialogCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.serviceProvider = 'Mobitel' AND c.isDeleted=0")
    long getMobitelCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.serviceProvider = 'Hutch' AND c.isDeleted=0")
    long getHutchCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.serviceProvider = 'Airtel' AND c.isDeleted=0")
    long getAirtelCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.isDeleted = 0")
    long getIsDeletedZeroCount();

    @Query("SELECT COUNT(c) FROM User c WHERE c.isDeleted = 1")
    long getIsDeletedOneCount();

}
