package com.threeteam.dango.controller.comment;

import org.springframework.web.servlet.ModelAndView;

import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentVO;

public class getCommentListController {
	
	public ModelAndView getCommentList (CommentVO commentVO, CommentDAO commentDAO, ModelAndView mav) {
		mav.addObject("boardList", commentDAO.getCommentList(commentVO));
		mav.setViewName(".jsp");
		return mav;
	}
}
