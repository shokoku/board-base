package kr.sanus.base1.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {

    private String id;
    private String pw;
    private String name;
    private String phone;
    private String email;

}
