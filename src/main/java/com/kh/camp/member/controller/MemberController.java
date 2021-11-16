package com.kh.camp.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		System.out.println("회원가입(memberEnroll.do) 접근확인!");
		
		return "member/memberEnroll";
		
	}

}
