package com.kh.camp.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	private int userNo;
	private String userId;
	private String userPw;
	private int userType;
	private String phone;
	private String email;
	private String userName;
	private String userStatus;
	private String bsNo;
	private String bsStatus;
	private Date bsEndDate;
	private String bsName;
	
}
