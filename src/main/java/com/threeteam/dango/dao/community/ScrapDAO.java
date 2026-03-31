package com.threeteam.dango.dao.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.mapper.community.ScrapMapper;
import com.threeteam.dango.vo.community.ScrapVO;

@Repository
public class ScrapDAO {

	@Autowired
	ScrapMapper scrapMapper;
	
	public boolean isScrap(ScrapVO scrapVO) {
		return scrapMapper.isScrap(scrapVO);
	}
	
	public void insertScrap(ScrapVO scrapVO) {
		scrapMapper.addScrap(scrapVO);
	}
	
	public void deleteScrap(ScrapVO scrapVO) {
		scrapMapper.deleteScrap(scrapVO);
	}
	
	public ScrapVO getScrap(ScrapVO scrapVO) {
		return scrapMapper.getScrap(scrapVO);
	}
	
	public List<ScrapVO> getScrapList(ScrapVO scrapVO){
		return scrapMapper.getScrapList(scrapVO);
	}
}
