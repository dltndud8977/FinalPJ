package com.kh.camp.board.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attachment implements Serializable{
	
	private static final long serialVersionUID = 6943L;
	
	private int afNo;
	private int askNo;
	private int nNo;
	private String oldName;
	private String  newName;
	private String fStatus;
}
