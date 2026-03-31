package com.threeteam.dango.dao.recent;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.recent.RecentVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.domain.word.WordVO;
import com.threeteam.dango.mapper.recent.RecentMapper;

@Repository("recentDAO")
public class RecentDAO {
	
	@Autowired
	public RecentMapper recentMapper;
	
	public RecentVO isRecent(RecentVO vo) {
		System.out.println("------>>> isCheck() 기능 처리");
		return recentMapper.isRecent(vo);
	}
	
	public void setRecent(RecentVO vo) {
		System.out.println("------>>> setRecent() 기능 처리");
		recentMapper.setRecent(vo);
	}
	
	public void updateRecent(RecentVO vo) {
		System.out.println("------>>> updateRecent() 기능 처리");
		recentMapper.updateRecent(vo);
	}
	
	public List<WordVO> getRecentList(UserVO userVO){
		System.out.println("------>>> getRecentList() 기능 처리");
		return recentMapper.getRecentList(userVO.getUserId());
	}
}
