package com.threeteam.dango.dao.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.mapper.community.RecommendMapper;
import com.threeteam.dango.vo.community.RecommendVO;

@Repository
public class RecommendDAO {

	@Autowired
	RecommendMapper recommendMapper;

	public void plusRecommend(RecommendVO recommendVO) {
		recommendMapper.plusRecommend(recommendVO);
	}

	public void minusRecommend(RecommendVO recommendVO) {
		recommendMapper.minusRecommend(recommendVO);
	}

	public Integer findByUserIdBoardId(RecommendVO recommendVO) {
		return recommendMapper.selectByUserIdBoardId(recommendVO);
	}
	
	public Integer findCountByBoardId(Long boardId) {
		return recommendMapper.selectCountByBoardId(boardId);
	}
}