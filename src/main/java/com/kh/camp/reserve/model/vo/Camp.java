package com.kh.camp.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Camp {

	private int campNo;
	private String campName;
	private double campLa;
	private double campLo;
	private String campArea;
	private String campTel;
	private String explain;
	private int picNo;
	private String picName;
}
