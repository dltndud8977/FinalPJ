package com.kh.camp.weather.model.dao;

import com.kh.camp.weather.model.vo.CampInfo;

public interface WeatherDAO {

	//캠프장 정보 추가 메소드
	int campInfoUpdate(CampInfo ci);
}
