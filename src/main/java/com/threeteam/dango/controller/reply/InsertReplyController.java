package com.threeteam.dango.controller.reply;

import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

public class InsertReplyController {

	public String insertReply(ReplyVO replyVO, ReplyDAO replyDAO) {
		replyDAO.insertReply(replyVO);
		return "getReplyList";
	}
}
