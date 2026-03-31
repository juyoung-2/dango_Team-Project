package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.vo.community.CommentDTO;
import com.threeteam.dango.vo.community.CommentVO;

@Service
public interface CommentService {
	public CommentVO getComment(CommentVO commentVO);
	public List<CommentDTO> getCommentList(CommentVO commentVO);
	public int insertComment(CommentVO commentVO);
	public int deleteComment(CommentVO commentVO);
	public void deleteCommentAllByBoardId(Long boardId);
	public int updateComment(CommentVO commentVO);
}
