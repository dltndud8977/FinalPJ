package com.kh.camp.weather.model.service;

import com.kh.camp.weather.model.vo.CampInfo;

public interface WeatherService {

	//캠프장 정보 추가 메소드
	int campInfoUpdate(CampInfo ci);
}
