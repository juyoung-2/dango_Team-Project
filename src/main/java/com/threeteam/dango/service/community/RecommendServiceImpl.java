package com.threeteam.dango.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.community.RecommendDAO;
import com.threeteam.dango.vo.community.RecommendVO;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	RecommendDAO recommendDAO;
	
	@Override
	public void plusRecommend(RecommendVO recommendVO) {
		recommendDAO.plusRecommend(recommendVO);
	}

	@Override
	public void minusRecommend(RecommendVO recommendVO) {
		recommendDAO.minusRecommend(recommendVO);
	}

	@Override
	public Integer findByUserIdBoardId(RecommendVO recommendVO) {
		return recommendDAO.findByUserIdBoardId(recommendVO);
	}

	@Override
	public Integer findCountByBoardId(Long boardId) {
		return recommendDAO.findCountByBoardId(boardId);
	}
}