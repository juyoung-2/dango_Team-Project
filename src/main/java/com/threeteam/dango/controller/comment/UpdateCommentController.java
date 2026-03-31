package com.threeteam.dango.controller.comment;

import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentVO;

public class UpdateCommentController {

	public String updateBoard(CommentVO commentVO, CommentDAO commentDAO) {
		
		commentDAO.updateComment(commentVO);

		return "getCommentList";
	}
}
