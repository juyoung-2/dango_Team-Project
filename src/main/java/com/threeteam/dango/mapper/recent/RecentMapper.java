package com.threeteam.dango.mapper.recent;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.domain.recent.RecentVO;
import com.threeteam.dango.domain.word.WordVO;

@Mapper
public interface RecentMapper {
	public RecentVO isRecent(RecentVO vo);
	public void setRecent(RecentVO vo);
	public void updateRecent(RecentVO vo);
	public WordVO getRecent(RecentVO vo);
	public List<WordVO> getRecentList(String userId);
}
