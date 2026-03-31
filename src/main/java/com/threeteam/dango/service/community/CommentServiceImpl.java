package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.community.CommentDAO;
import com.threeteam.dango.vo.community.CommentDTO;
import com.threeteam.dango.vo.community.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDAO commentDAO;
	
	@Override
	public int insertComment(CommentVO commentVO) {
		return commentDAO.insertComment(commentVO);
	}

	@Override
	public int deleteComment(CommentVO commentVO) {
		return commentDAO.deleteComment(commentVO);
	}
	
	@Override
	public void deleteCommentAllByBoardId(Long boardId) {
		commentDAO.deleteCommentAllByBoardId(boardId);
	}

	@Override
	public CommentVO getComment(CommentVO commentVO) {
		return commentDAO.getComment(commentVO);
	}

	@Override
	public List<CommentDTO> getCommentList(CommentVO commentVO) {
		return commentDAO.getCommentList(commentVO);
	}

	@Override
	public int updateComment(CommentVO commentVO) {
		return commentDAO.updateComment(commentVO);
	}

}
