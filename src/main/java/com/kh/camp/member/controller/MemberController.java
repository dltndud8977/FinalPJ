package com.kh.camp.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.member.model.service.MemberService;
import com.kh.camp.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		System.out.println("회원가입(memberEnroll.do) 접근확인!");
		
		return "member/memberEnroll";
		
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		
		System.out.println("받아온 정보 확인 : " + m);
		
		String pass1 = m.getUserPw();
		String pass2 = bcryptPasswordEncoder.encode(pass1);
		
		System.out.println(pass1 + " / " + pass2);
		
		m.setUserPw(pass2);

		int result = memberService.insertMember(m);
		
		String loc = "/";
		
		String msg = "";
		
		if(result > 0) {
			msg = "회원가입 완료!";
		} else {
			msg = "회원가입 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}
