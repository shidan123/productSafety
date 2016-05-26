package com.shidan.product.domain;

import java.io.Serializable;

public class Message implements Serializable{
	private static final long serialVersionUID = -6633131240804671179L;
	private String code;
	private Object message;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Object getMessage() {
		return message;
	}

	public void setMessage(Object message) {
		this.message = message;
	}

	public Message() {
		super();
	}

	public Message(String code, Object message) {
		super();
		this.code = code;
		this.message = message;
	}

	@Override
	public String toString() {
		return "Message [code=" + code + ", message=" + message + "]";
	}


}
