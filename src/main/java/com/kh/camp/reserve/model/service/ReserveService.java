package com.kh.camp.reserve.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.reserve.model.dao.ReserveDAO;
import com.kh.camp.reserve.model.vo.Camp;
import com.kh.camp.reserve.model.vo.Reservation;
import com.kh.camp.reserve.model.vo.Room;

@Service
public class ReserveService {

	@Autowired
	ReserveDAO reservedao;
	
	public Camp campInfo(int campNo) {
	
		return reservedao.campInfo(campNo);
	}
	
	public List<Camp> getPicture(int campNo) {
		
		return reservedao.getPicture(campNo);
	}

	public List<Room> getRoom(int campNo) {
		
		return reservedao.getRoom(campNo);
	}

	public int reservation(Reservation reserve) {
		
		return reservedao.reservation(reserve);
	}

}
