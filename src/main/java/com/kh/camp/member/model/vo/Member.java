package com.kh.camp.member.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	private String userId;
	private String userPw;
	private int userType;
	private String phone;
	private String email;
	private String userName;
	private String userStatus;
	private String bsNo;
	private String bsName;
	private Date bsEndDate;
	private String bsStatus;

	
	public Member(String userId, String userPw, String email) {
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		
	}
	
}
