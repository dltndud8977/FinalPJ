package com.kh.camp.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.board.model.vo.PsBoard;
import com.kh.camp.reserve.model.vo.Camp;
import com.kh.camp.reserve.model.vo.Reservation;
import com.kh.camp.reserve.model.vo.Room;

@Repository
public class ReserveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	//캠프장 정보 가져오기
	public Camp campInfo(int campNo) {
		
		return sqlSession.selectOne("reservationSQL.selectOne", campNo);
	}
	//캠프장 사진 가져오기
	public List<Camp> getPicture(int campNo) {
		
		return sqlSession.selectList("reservationSQL.selectPicture", campNo);
	}
	//캠프장 ROOM 정보 가져오기
	public List<Room> getRoom(int campNo) {
		
		return sqlSession.selectList("reservationSQL.selectRoom",campNo);
	}
	//캠프장 예약하기
	public int reservation(Reservation reserve) {
		
		return sqlSession.insert("reservationSQL.reservation",reserve);
	}

	//캠프장 후기 가져오기
	public List<PsBoard> getBoard(int campNo) {
		
		return sqlSession.selectList("reservationSQL.getBoard",campNo);
	}
	//user 예약 정보(표) 가져오기
	public List<Reservation> getMyReserve(String userId) {
		
		return sqlSession.selectList("reservationSQL.myReservation",userId);
	}
	//user 예약 정보(캘린더) 가져오기
	public List<Reservation> schedule(String userId) {
		
		return sqlSession.selectList("reservationSQL.myReservation",userId);
	}
	
	// 예약수 증가
	public int updateReserveCount() {
		
		return sqlSession.update("reservationSQL.reserveCount");
	}

	public int cancelReserve(int rNo) {
		
		return sqlSession.update("reservationSQL.cancelReserve",rNo);
	}
	public List<Reservation> reserveFull(String campName) {
		
		return sqlSession.selectList("reservationSQL.reserveFull",campName);
	}

	

	

}
