package com.threeteam.dango.dao.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.mapper.community.CommentMapper;
import com.threeteam.dango.vo.community.CommentDTO;
import com.threeteam.dango.vo.community.CommentVO;

@Repository
public class CommentDAO {

	@Autowired
	CommentMapper commentMapper;
	
	public int insertComment(CommentVO commentVO) {
		return commentMapper.addComment(commentVO);
	}
	
	public int deleteComment(CommentVO commentVO) {
		return commentMapper.deleteComment(commentVO);
	}
	
	public void deleteCommentAllByBoardId(Long boardId) {
		commentMapper.deleteCommentAllByBoardId(boardId);
	}
	
	public int updateComment(CommentVO commentVO) {
		return commentMapper.updateComment(commentVO);
	}
	
	public CommentVO getComment(CommentVO commentVO) {
	    return commentMapper.getComment(commentVO);
	}
	
	public List<CommentDTO> getCommentList(CommentVO commentVO){
		return commentMapper.getCommentList(commentVO);
	}
}
