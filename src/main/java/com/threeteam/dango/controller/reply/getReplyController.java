package com.threeteam.dango.controller.reply;

import org.springframework.web.servlet.ModelAndView;

import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

public class getReplyController {

	public ModelAndView getReply(ReplyVO replyVO, ReplyDAO replyDAO, ModelAndView mav) {
		mav.addObject("reply", replyDAO.getReply(replyVO));
		mav.setViewName(".jsp");
		return mav;
	}
}
