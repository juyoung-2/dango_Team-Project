package com.threeteam.dango.vo.community;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class CommentVO {
	private Long commentId;
	private String commentMain;
	private String userId;
	private Long boardId;
	private Date commentRegisterDate;
	private Date commentUpdateDate;
}