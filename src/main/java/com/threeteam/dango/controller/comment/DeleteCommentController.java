package com.threeteam.dango.controller.comment;

import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentVO;

public class DeleteCommentController {

	public String deleteBoard(CommentVO commentVO, CommentDAO commentDAO) {
		commentDAO.deleteComment(commentVO);
		return "getCommentList";
	}
}
