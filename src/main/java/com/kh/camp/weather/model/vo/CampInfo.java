package com.kh.camp.weather.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CampInfo implements Serializable{

	private int campNo;
	private String campName;
	private double campLa;
	private double campLo;
	private String campArea;
	private String campTel;
	private String explain;
	
	public CampInfo(String campName, double campLa, double campLo, String campArea) {
		super();
		this.campName = campName;
		this.campLa = campLa;
		this.campLo = campLo;
		this.campArea = campArea;
	}
}
