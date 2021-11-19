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
	
	private static final long serialVersion = 6943L;
	
	private int afnNo;
	private int askNo;
	private String oldName;
	private String  newName;
	private String fStatus;
}
