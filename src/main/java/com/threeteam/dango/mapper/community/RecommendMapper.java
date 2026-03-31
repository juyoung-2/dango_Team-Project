package com.threeteam.dango.mapper.community;

import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.vo.community.RecommendVO;

@Mapper
public interface RecommendMapper {
	public void plusRecommend(RecommendVO recommendVO);
	public void minusRecommend(RecommendVO recommendVO);
	public Integer selectByUserIdBoardId(RecommendVO recommendVO);
	public Integer selectCountByBoardId(Long boardId);
}
