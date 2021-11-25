package com.kh.camp.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Room {

	private int roomNo;
	private String roomName;
	private String roomPicture;
	private String roomPrice;
	private String campName;
}

