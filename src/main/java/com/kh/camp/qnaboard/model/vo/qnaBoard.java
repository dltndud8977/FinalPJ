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
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1025L;
	private int askNo;
	private String userId;
	private String askTitle;
	private String askContent;
	private	Date askDate;
	private int	askCategory;
	private	String askBoardfile;
	private String askStatus;
	private	String answerId;
	private String answerContent;
	private Date answerDate;
	private int fileCount;

}
