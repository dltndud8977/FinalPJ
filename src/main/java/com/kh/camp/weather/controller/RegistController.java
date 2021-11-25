package com.kh.camp.weather.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.camp.weather.model.service.WeatherService;
import com.kh.camp.weather.model.vo.CampInfo;

@Controller
public class RegistController {
	
	@Autowired
	WeatherService weatherService;

	@RequestMapping("/weather/mapRegist.do")
	public String mapRegist() {
			
		return "weather/mapRegist";	
}
	@RequestMapping("/weather/campInfoUpdate.do")
	public String campInfoUpdate(
			@RequestParam(value="pname") String pname,
			@RequestParam(value="latclick") double latclick,
			@RequestParam(value="lngclick") double lngclick,
			@RequestParam(value="city") String city,
			@RequestParam String phone,
			HttpServletRequest request
			) {
		
		CampInfo ci = new CampInfo();
		
		ci.setCampName(pname);
		ci.setCampLa(lngclick);
		ci.setCampLo(lngclick);
		ci.setCampArea(city);
		ci.setCampTel(phone);
		
		System.out.println(ci);
		
		request.setAttribute("ci", ci);
		
		int result = weatherService.campInfoUpdate(ci);
		
		System.out.println(result);
		
		return "weather/mapRegist";
		
	}
	
}// end of class