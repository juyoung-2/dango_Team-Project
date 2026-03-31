package com.threeteam.dango.controller.reply;

import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

public class UpdateReplyController {

	public String updateReply(ReplyVO replyVO, ReplyDAO replyDAO) {
		replyDAO.updateReply(replyVO);
		return "getReplyList";
	}
}
