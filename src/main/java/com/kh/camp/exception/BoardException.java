package com.kh.camp.exception;

public class BoardException extends RuntimeException {
	public BoardException() { }
	
	public BoardException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
