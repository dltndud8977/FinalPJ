package com.kh.camp.weather.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrafficController {

	@RequestMapping("weather/trafficView.do")
	public String trafficView() {
		
		return "weather/traffic";
	}
}
