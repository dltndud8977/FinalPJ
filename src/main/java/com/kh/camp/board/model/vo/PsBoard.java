package com.kh.camp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class PsBoard implements Serializable {
	
	private static final long serialVersionUTD = 79337L;
	
	private int nNo;
	private int afNo;
	private  int campNo;
	private String nTitle;
	private String nContent;
	private Date nDate;
	private String nWriter;

	private int fileCount; 
}
