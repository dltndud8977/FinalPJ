package com.kh.camp.member.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import com.kh.camp.exception.MemberException;
import com.kh.camp.member.model.service.MemberService;
import com.kh.camp.member.model.vo.Member;

@Controller
@SessionAttributes({"member"})
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
	public String memberEnrollEnd(Member m, Model model, SessionStatus status) {
		
		System.out.println("받아온 정보 확인 : " + m);
		
		String pass1 = m.getUserPw();
		String pass2 = bcryptPasswordEncoder.encode(pass1);
		
		System.out.println(pass1 + " / " + pass2);
		
		m.setUserPw(pass2);

		try {
		int result = memberService.insertMember(m);
		
		String loc = "/";
		
		String msg = "";
		
		if(result > 0) {
			msg = "회원가입 완료!";
			if ( ! status.isComplete() ) {
				status.setComplete();			
			}
		} else {
			msg = "회원가입 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		} catch(Exception e) {
			System.out.println("회원가입시 에러발생");
			System.out.println("Err :: " + e.getMessage());
		
			throw new MemberException(e.getMessage());
		}
		return "common/msg";
	}
	
	
	
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(@RequestParam String userId, 
							  @RequestParam String userPw,
							  Model model) {  //Model : HttpServletRequest / HttpServletResponse
		
		System.out.println("로그인 기능 접근 확인!");
		
		// 1. 아이디를 통해 회원 정보 조회
		Member result = memberService.selectOneMember(userId); // -> 서비스로 출발~!
		
		String loc = "/";
		String msg = "";
		
		if( result != null ) {
			// 아이디는 있었다!
			if( bcryptPasswordEncoder.matches(userPw, result.getUserPw())) {
				// bcrypt에서 비교를 위한 메소드를 제공해준다!
				msg = "로그인 성공!";
				
				model.addAttribute("member", result);
				// model은 기본적으로 객체를 request 영역에 저장한다.
				// @SessionAttributes 어노테이션을 통해 세션에 저장할 수 있다!
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}			
		} else {
			msg = "존재하지 않는 아이디입니다!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		// HttpSession --> session.invalidate(); 세션 무효화
		
		if ( ! status.isComplete() ) {
			status.setComplete();			
		}
		
		return "redirect:/";
	
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		int result = memberService.updateMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			
			msg = "회원 정보 수정 완료!";
			model.addAttribute("member", member);
		} else {
			
			msg = "회원 정보 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(Member member, SessionStatus status, Model model) {
		
		int result = memberService.deleteMember(member.getUserId());
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			
			msg = "회원 탈퇴 완료!";
			status.setComplete();
		} else {
			msg = "회원 탈퇴 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int check = memberService.checkIdDuplicate(userId);
		
		if( check == 0 ) {
			map.put("isUsable", true);
		} else {
			map.put("isUsable", false);
		}
		
		return map;
	}
	
	@RequestMapping("/member/pw_find.do")
	public String pw_find() {
		
		return "member/pw_find";
	}
	
	@RequestMapping("/member/pw_findEnd.do")
	public String pw_findEnd(@RequestParam String userId, 
			  			@RequestParam String email,
			  			Model model) {
		
		
		Member result = memberService.selectOneMember(userId);
		
		System.out.println("받아온 정보 확인 : " + userId + "/" + email);
		
		String loc = "/member/pw_find.do";
		String msg = "";

		
		if(userId.equals(result.getUserId())) {
			if( email. equals(result.getEmail())) {
				
				msg = "이메일 확인 완료";
				
				
				model.addAttribute("userId", userId);
				return "member/pw_new";
				
			} else {
				
				msg = "이메일이 일치하지 않습니다.";
				System.out.println(result.getUserId());
				
			} 
		} else {
			
			msg = "존재하지 않는 아이디입니다.";
		}
	
		
//		System.out.println(result.getEmail());
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/pw_new.do")
	public String pw_new(Member member, Model model, SessionStatus status , @RequestParam String userPw ) throws IOException {
		
		
		
		String pass1 = member.getUserPw();
		String pass2 = bcryptPasswordEncoder.encode(pass1);
		
		System.out.println(pass1 + " / " + pass2);
		
		member.setUserPw(pass2);
		
		int result = memberService.pwUpdateMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) {
			
			msg = "비밀번호 수정 완료!";
			model.addAttribute("member", member);
			
			if ( ! status.isComplete() ) {
				status.setComplete();			
			}
			
		} else {
			
			msg = "비밀번호 수정 실패!";
			if ( ! status.isComplete() ) {
				status.setComplete();			
			}
			
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	
	
	
}
