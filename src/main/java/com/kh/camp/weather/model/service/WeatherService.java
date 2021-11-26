package com.kh.camp.weather.model.service;

import java.util.List;

import com.kh.camp.weather.model.vo.CampInfo;

public interface WeatherService {

	//캠프장 정보 추가 메소드
	int campInfoUpdate(CampInfo ci);

	//날씨지도 용 캠프장 정보 조회 메소드
	List<CampInfo> selectWeather();

	//교통지도 용 캠프장 정보 조회 메소드
	List<CampInfo> selectTraffic();
	
	
}
