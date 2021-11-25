package com.kh.camp.admin.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Visit {

	private String visitDate;
	private int visitCount;
	private int reserCount;
}

