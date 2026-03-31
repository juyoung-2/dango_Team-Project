package com.threeteam.dango.controller.reply;

import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

public class DeleteReplyController {

	public String deleteReply(ReplyVO replyVO, ReplyDAO replyDAO) {
		replyDAO.deleteReply(replyVO);
		return "getReplyList";
	}
}
