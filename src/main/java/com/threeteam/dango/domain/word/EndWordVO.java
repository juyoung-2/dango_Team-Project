package com.threeteam.dango.domain.word;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
public class EndWordVO {
	private Long endWordId;
	private String userId;
	private Long wordId;
	private Date endWordRegisterDate;
	private Date endWordUpdateDate;
	
	public Long getEndWordId() {
		return endWordId;
	}
	
	public void setEndWordId(Long endWordId) {
		this.endWordId = endWordId;
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
	
	public Date getEndWordRegisterDate() {
		return endWordRegisterDate;
	}
	
	public void setEndWordRegisterDate(Date endWordRegisterDate) {
		this.endWordRegisterDate = endWordRegisterDate;
	}
	
	public Date getEndWordUpdateDate() {
		return endWordUpdateDate;
	}
	
	public void setEndWordUpdateDate(Date endWordUpdateDate) {
		this.endWordUpdateDate = endWordUpdateDate;
	}
}
