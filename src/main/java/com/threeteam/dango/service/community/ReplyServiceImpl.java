package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.community.ReplyDAO;
import com.threeteam.dango.vo.community.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO replyDAO;
	
	@Override
	public void insertReply(ReplyVO replyVO) {
		replyDAO.insertReply(replyVO);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) {
		replyDAO.deleteReply(replyVO);
	}

	@Override
	public ReplyVO getReply(ReplyVO replyVO) {
		return replyDAO.getReply(replyVO);
	}

	@Override
	public List<ReplyVO> getReplyList(ReplyVO replyVO) {
		return replyDAO.getReplyList(replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) {
		replyDAO.updateReply(replyVO);
	}

}
