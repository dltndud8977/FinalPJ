package com.kh.camp.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonIOException;
import com.kh.camp.admin.model.service.AdminService;
import com.kh.camp.admin.model.vo.Visit;
import com.kh.camp.common.Utils;
import com.kh.camp.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		
		return "admin/adminPage";
	}
	
	@RequestMapping("/admin/memberManage.do")
	public String memberManage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
	
		// 한 페이지당 회원 수
		int numPerPage = 10;
		
		// 현재 페이지의 회원 수
		List<Map<String, String>> list = adminService.selectMemberList(cPage, numPerPage);
		
		// 전체 회원수
		int totalContents = adminService.selectTotalMemberNum();
		
		// --- 페이징 처리 Utils 사용하기--- //
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberManage.do");
	
		/*
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		*/
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		System.out.println(list);
		
		return "admin/memberManage";
	}
	

	
	@RequestMapping("/admin/bsMemberManage.do")
	public String bsmemberManage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
	
		// 한 페이지당 회원 수
		int numPerPage = 10;
		
		// 현재 페이지의 회원 수
		List<Map<String, String>> list = adminService.selectbsMemberList(cPage, numPerPage);
		
		// 전체 회원수
		int totalContents = adminService.selectTotalbsMemberNum();
		
		// --- 페이징 처리 Utils 사용하기--- //
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "bsmemberManage.do");
	 	
		/*
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		*/
	
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		
		
		return "admin/bsmemberManage";
	}
	
	@RequestMapping("/admin/extend.do")
	@ResponseBody
	public Map<String, Object> extend(@RequestParam(value="checkList[]") List<String> list, 
						  HttpServletResponse response) throws JsonIOException, IOException {
		String [] bsNo = list.toArray(new String[list.size()]);
		
		int result = 0;
		Member m = new Member();
		for(int i=0; i<bsNo.length;i++) {
			// 첫계약 or 연장 알아보기 위해 Member 데이터를 가져옴 
		   m = adminService.selectOne(bsNo[i]);
		  result = adminService.extendContract(m);
		  
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result > 0) {
			map.put("date", m.getBsEndDate());
			map.put("status", m.getBsStatus());
		}
		
		return map;
	}
	
	@RequestMapping("/admin/expire.do")
	@ResponseBody
	public String expire(Member m, Model model) {
		
		int result = adminService.expire(m);
		
		if( result > 0) {
			model.addAttribute("list",m);
		}
		return "admin/bsmemberManage";
	}
	
	
	@RequestMapping("/admin/reserManage.do")
	public String Manager(Model model) {
		List<Visit> visit = adminService.visit();
		
		model.addAttribute("list",visit);
		
		return "admin/adminPage";
	}
	
	
}
