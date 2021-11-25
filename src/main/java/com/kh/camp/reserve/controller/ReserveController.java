package com.kh.camp.reserve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.camp.board.model.vo.PsBoard;
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
		List<PsBoard> board = reserveService.getBoard(campNo);
		
		model.addAttribute("list",camp);
		model.addAttribute("picture",picture);
		model.addAttribute("board",board);
		
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
	public String roomReserve(Reservation reserve) {
		
		
		int result = reserveService.reservation(reserve);
	
		return "redirect:/";
	}
	
	
	@RequestMapping("/reserve/goCheck.do")
	public String goReserCheck(@RequestParam String userId, Model model) {
		

		List<Reservation> myReservation = reserveService.getMyReserve(userId);
		
		model.addAttribute("list",myReservation);
		
		return "reserve/reserveCheck";
		
	}
	
	@ResponseBody
	@RequestMapping("/reserve/schedule.do")
	public List<Reservation> scheduleCheck(@RequestParam String userId) {
		
		List<Reservation> myReservation = reserveService.schedule(userId);
		
		
		/*
		for(int i=0; i<myReservation.size();i++) {
		map.put("title", myReservation.get(i).getCampName());
		map.put("start", myReservation.get(i).getCheckIn());
		map.put("end", myReservation.get(i).getCheckOut());

		System.out.println(map);
		} 
		*/
		return myReservation;
	}
	
	@RequestMapping("/reserve/cancel.do")
	public String cancelReserve(@RequestParam int rNo) {
		
		int result = reserveService.cancleReserve(rNo);
		
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping("/reserve/reserveFull.do")
	
	public List<Reservation> reserveFull(@RequestParam String campName) {		
		List<Reservation> Reservation = reserveService.reserveFull(campName);
		
		return Reservation;
		
	}
	

	
	
}
