package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.vo.community.ReplyVO;

@Service
public interface ReplyService {
	public ReplyVO getReply(ReplyVO replyVO);
	public List<ReplyVO> getReplyList(ReplyVO replyVO);
	public void insertReply(ReplyVO replyVO);
	public void deleteReply(ReplyVO replyVO);
	public void updateReply(ReplyVO replyVO);
}
