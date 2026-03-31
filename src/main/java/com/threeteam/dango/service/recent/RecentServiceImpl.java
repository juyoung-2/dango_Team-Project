package com.threeteam.dango.service.recent;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.recent.RecentDAO;
import com.threeteam.dango.domain.recent.RecentVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.domain.word.WordVO;

@Service
public class RecentServiceImpl implements RecentService {
	
	@Autowired
	private RecentDAO recentDAO;

	@Override
	public RecentVO isRecent(RecentVO vo) {
		return recentDAO.isRecent(vo);
	}

	@Override
	public void setRecent(RecentVO vo) {
		recentDAO.setRecent(vo);
	}

	@Override
	public void updateRecent(RecentVO vo) {
		recentDAO.updateRecent(vo);
	}

	@Override
	public List<WordVO> getRecentList(UserVO userVO) {
		return recentDAO.getRecentList(userVO);
	}

}
