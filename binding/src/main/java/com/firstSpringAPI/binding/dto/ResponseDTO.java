package com.firstSpringAPI.binding.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDTO {

    private long maleCount;
    private long femaleCount;
    private long dialogCount;
    private long mobitelCount;
    private long hutchCount;
    private long airtelCount;
    private long isDeletedZeroCount;
    private long isDeletedOneCount;

}
