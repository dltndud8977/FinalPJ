package com.kh.camp.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ReserveController {

	@RequestMapping("/reserve/reserveList.do")
	public String adminPage() {
		
		return "reserve/reserveList";
	}
}
