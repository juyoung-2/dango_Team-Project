package com.threeteam.dango.vo.community;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class ReplyVO {
	private String replyId;
	private String userId;
	private String commentId;
	private String replyMain;
	private Date replyRegisterdate;
	private Date replyUpdatedate;
}