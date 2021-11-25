package com.kh.camp.exception;

public class MemberException extends RuntimeException {

	public MemberException() {}
	
	public MemberException(String msg) {
		 super("회원 EROOR :: " + msg);
	}
}
