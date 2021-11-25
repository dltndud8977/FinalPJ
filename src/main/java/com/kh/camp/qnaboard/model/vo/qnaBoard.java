package com.kh.camp.qnaboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data

public class qnaBoard implements Serializable{
	
	private int askno;
	private String userid;
	private String asktitle;
	private String askcontent;
	private	Date askdate;
	private int	askcategory;
	private	String askboardfile;
	private String askstatus;
	private	String answerid;
	private String answercontent;
	private Date answerdate;

}
