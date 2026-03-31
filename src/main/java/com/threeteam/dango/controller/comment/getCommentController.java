package com.threeteam.dango.controller.comment;

import org.springframework.web.servlet.ModelAndView;

import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentVO;

public class getCommentController {

	public ModelAndView getCommentList (CommentVO commentVO, CommentDAO commentDAO, ModelAndView mav) {
		mav.addObject("board", commentDAO.getComment(commentVO));
		mav.setViewName(".jsp");
		return mav;
	}

}