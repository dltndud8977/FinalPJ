package com.kh.camp.weather.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.weather.model.vo.CampInfo;

@Repository
public class WeatherDAOImpl implements WeatherDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int campInfoUpdate(CampInfo ci) {
	
		return sqlSession.insert("weatherSQL.campInfoUpdate", ci);
	}

	@Override
	public List<CampInfo> selectWeather() {
		
		return sqlSession.selectList("weatherSQL.selectWeather");
	}

	@Override
	public List<CampInfo> selectTraffic() {
		
		return sqlSession.selectList("weatherSQL.selectTraffic");
	}

}
