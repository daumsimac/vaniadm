package com.vani.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserVO {

    private String uid;
    private String upw;
    private String uname;
    private int upoint;
}
