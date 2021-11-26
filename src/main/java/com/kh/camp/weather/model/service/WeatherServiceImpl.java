package com.kh.camp.weather.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.weather.model.dao.WeatherDAO;
import com.kh.camp.weather.model.vo.CampInfo;

@Service
public class WeatherServiceImpl implements WeatherService {

	@Autowired
	WeatherDAO weatherDAO;
	
	@Override
	public int campInfoUpdate(CampInfo ci) {
		
		return weatherDAO.campInfoUpdate(ci);
	}

	@Override
	public List<CampInfo> selectWeather() {

		return weatherDAO.selectWeather();
	}

	@Override
	public List<CampInfo> selectTraffic() {
		
		return weatherDAO.selectTraffic();
	}

}
