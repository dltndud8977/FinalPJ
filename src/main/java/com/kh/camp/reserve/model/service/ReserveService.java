package com.kh.camp.reserve.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.board.model.vo.PsBoard;
import com.kh.camp.reserve.model.dao.ReserveDAO;
import com.kh.camp.reserve.model.vo.Camp;
import com.kh.camp.reserve.model.vo.Reservation;
import com.kh.camp.reserve.model.vo.Room;

@Service
public class ReserveService {

	@Autowired
	ReserveDAO reservedao;
	//캠프장 정보 가져오기
	public Camp campInfo(int campNo) {
	
		return reservedao.campInfo(campNo);
	}
	//캠프장 사진 가져오기
	public List<Camp> getPicture(int campNo) {
		
		return reservedao.getPicture(campNo);
	}
	
	//캠프장 ROOM 정보 가져오기
	public List<Room> getRoom(int campNo) {
		
		return reservedao.getRoom(campNo);
	}
	//캠프장 예약하기
	public int reservation(Reservation reserve) {
		// 예약 수 증가
		 reservedao.updateReserveCount();
		 
		return reservedao.reservation(reserve);
	}

	//캠프장 후기 가져오기
	public List<PsBoard> getBoard(int campNo) {
		
		return reservedao.getBoard(campNo);
	}
	//user 예약 정보(표) 가져오기
	public List<Reservation> getMyReserve(String userId) {
		
		return reservedao.getMyReserve(userId);
	}
	//user 예약 정보(캘린더) 가져오기
	public List<Reservation> schedule(String userId) {
		
		return reservedao.schedule(userId);
	}

	public int cancleReserve(int rNo) {
		
		return reservedao.cancelReserve(rNo);
	}
	public List<Reservation> reserveFull(String campName) {
		
		return reservedao.reserveFull(campName);
	}

}
