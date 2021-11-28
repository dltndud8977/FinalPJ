package com.kh.camp.weather.model.dao;

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

}
