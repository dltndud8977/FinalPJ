package com.kh.camp.weather.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.weather.model.service.WeatherService;
import com.kh.camp.weather.model.vo.CampInfo;

@Controller
public class WeatherController {

	@Autowired
	WeatherService weatherService;
	
	@RequestMapping("weather/weatherView.do")
	public String selectWeather(Model model) {
		
		List<CampInfo> list = weatherService.selectWeather();
		
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		
		return "weather/weather";
	}
}
