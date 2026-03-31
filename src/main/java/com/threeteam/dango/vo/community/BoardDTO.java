package com.threeteam.dango.vo.community;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class BoardDTO {
	private Long boardId;
	private String boardTitle;
	private String userId;
	private String boardMain;
	private int boardNotice;
	private int boardViews;
	private String boardRegisterDate;
	private String boardUpdateDate;
	private String searchCondition;
	private String searchKeyword;
	private int recommends;
	private String userProfile;
	private Integer page = 1;
	private String keyword;
}
