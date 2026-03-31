package com.threeteam.dango.controller.reply;

import org.springframework.web.servlet.ModelAndView;
import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

public class getReplyListController {

	public ModelAndView getReplyList (ReplyVO replyVO, ReplyDAO replyDAO, ModelAndView mav) {
		mav.addObject("replyList", replyDAO.getReplyList(replyVO));
		mav.setViewName(".jsp");
		return mav;
	}
}
