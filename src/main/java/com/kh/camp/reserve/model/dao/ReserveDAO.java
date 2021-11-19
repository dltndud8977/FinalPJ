package com.kh.camp.reserve.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.reserve.model.vo.Camp;
import com.kh.camp.reserve.model.vo.Reservation;
import com.kh.camp.reserve.model.vo.Room;

@Repository
public class ReserveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Camp campInfo(int campNo) {
		
		return sqlSession.selectOne("reservationSQL.selectOne", campNo);
	}

	public List<Camp> getPicture(int campNo) {
		
		return sqlSession.selectList("reservationSQL.selectPicture", campNo);
	}

	public List<Room> getRoom(int campNo) {
		
		return sqlSession.selectList("reservationSQL.selectRoom",campNo);
	}

	public int reservation(Reservation reserve) {
		
		return sqlSession.insert("reservationSQL.reservation",reserve);
	}

}
