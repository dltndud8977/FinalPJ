package com.kh.camp.reserve.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reservation {

	private int rNo;
	private Date checkIn;
	private Date checkOut;
	private String rStatus;
	private String userId;
	private String roomName;
	private String campName;
}
