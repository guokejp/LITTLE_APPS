package com.kangrise.xunjian.admin.sm.exception;


public class LoginaccountExistException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public LoginaccountExistException() {
		super();
	}
	
	public LoginaccountExistException(String errmsg) {
		super(errmsg);
	}
	
}
