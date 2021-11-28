package com.kh.camp.weather.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.weather.model.service.WeatherService;
import com.kh.camp.weather.model.vo.CampInfo;

@Controller
public class TrafficController {
	
	@Autowired
	WeatherService weatherService;

	@RequestMapping("weather/trafficView.do")
	public String selectTraffic(Model model) {
		
		List<CampInfo> list = weatherService.selectTraffic();
		
		System.out.println("trafficlist : " + list);
		model.addAttribute("list", list);
		
		return "weather/traffic";
	}
}
