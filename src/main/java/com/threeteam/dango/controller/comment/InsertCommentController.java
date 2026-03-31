package com.threeteam.dango.controller.comment;

import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentVO;

public class InsertCommentController {

	public String InsertBoard(CommentVO commentVO, CommentDAO commentDAO) {
		commentDAO.insertComment(commentVO);
		return "getCommentList";
	}
}
