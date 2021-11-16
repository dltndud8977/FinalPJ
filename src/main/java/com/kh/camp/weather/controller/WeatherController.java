package com.kh.camp.weather.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {

	
	@RequestMapping("weather/weatherView.do")
	public String weatherView() {
		
		return "weather/weather";
	}
	
}
