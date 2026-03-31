package com.threeteam.dango.domain.word;

import java.util.Date;

public class WrongVO {
	private Long wrongId;
	private String userId;
	private Long wordId;
	private Integer wrongNum;
	private Date wrongRegisterDate;
	private Date wrongUpdateDate;
	
	public Long getWrongId() {
		return wrongId;
	}
	
	public void setWrongId(Long wrongId) {
		this.wrongId = wrongId;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Long getWordId() {
		return wordId;
	}
	
	public void setWordId(Long wordId) {
		this.wordId = wordId;
	}
	
	public Integer getWrongNum() {
		return wrongNum;
	}
	
	public void setWrongNum(Integer wrongNum) {
		this.wrongNum = wrongNum;
	}
	
	public Date getWrongRegisterDate() {
		return wrongRegisterDate;
	}
	
	public void setWrongRegisterDate(Date wrongRegisterDate) {
		this.wrongRegisterDate = wrongRegisterDate;
	}
	
	public Date getWrongUpdateDate() {
		return wrongUpdateDate;
	}
	
	public void setWrongUpdateDate(Date wrongUpdateDate) {
		this.wrongUpdateDate = wrongUpdateDate;
	}
}
