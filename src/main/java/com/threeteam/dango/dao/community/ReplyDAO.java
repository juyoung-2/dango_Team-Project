package com.threeteam.dango.dao.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.mapper.community.ReplyMapper;
import com.threeteam.dango.vo.community.ReplyVO;

@Repository
public class ReplyDAO {

	@Autowired
	ReplyMapper replyMapper;
	
	public void insertReply(ReplyVO replyVO) {
		replyMapper.addReply(replyVO);
	}
	
	public void deleteReply(ReplyVO replyVO) {
		replyMapper.deleteReply(replyVO);
	}
	
	public void updateReply(ReplyVO replyVO) {
		replyMapper.updateReply(replyVO);
	}
	
	public ReplyVO getReply(ReplyVO replyVO) {
		return replyMapper.getReply(replyVO);
	}
	
	public List<ReplyVO> getReplyList(ReplyVO replyVO){
		return replyMapper.getReplyList(replyVO);
	}
		
}
