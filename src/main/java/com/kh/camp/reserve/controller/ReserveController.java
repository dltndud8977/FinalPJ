package com.kh.camp.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.camp.reserve.model.service.ReserveService;
import com.kh.camp.reserve.model.vo.Camp;
import com.kh.camp.reserve.model.vo.Reservation;
import com.kh.camp.reserve.model.vo.Room;
@Controller
public class ReserveController {

	@Autowired
	ReserveService reserveService;
	
	@RequestMapping("/reserve/reserveList.do")
	public String campListPage() {
		
		return "reserve/reserveList";
	}
	@RequestMapping("/reserve/campInfo.do")
	public String campInfo(@RequestParam int campNo, Model model) {
		Camp camp = reserveService.campInfo(campNo);
		List<Camp> picture = reserveService.getPicture(campNo);
		
		model.addAttribute("list",camp);
		model.addAttribute("picture",picture);
		
		
		return "reserve/campInfo";
	}
	
	@RequestMapping("/reserve/reserve.do")
	public String reservation(@RequestParam int campNo, Model model) {
		
		Camp camp = reserveService.campInfo(campNo);
		List<Camp> picture = reserveService.getPicture(campNo);
		List<Room> room = reserveService.getRoom(campNo);
		
		model.addAttribute("list",camp);
		model.addAttribute("picture",picture);
		model.addAttribute("room",room);
		
		return "reserve/reserveView";
	}
	
	@RequestMapping("/reserve/roomReserve.do")
	public String roomReserve(Reservation reserve,Model model) {
		
		int result = reserveService.reservation(reserve);
		
		
		return "/";
	}
}
