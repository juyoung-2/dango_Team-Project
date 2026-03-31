package com.threeteam.dango.mapper.community;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.vo.community.ReplyVO;

@Mapper
public interface ReplyMapper {
	public ReplyVO getReply(ReplyVO replyVO);
	public List<ReplyVO> getReplyList(ReplyVO replyVO);
	public void addReply(ReplyVO replyVO);
	public void deleteReply(ReplyVO replyVO);
	public void updateReply(ReplyVO replyVO);
}