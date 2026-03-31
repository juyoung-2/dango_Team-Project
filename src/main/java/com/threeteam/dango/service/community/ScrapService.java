package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.vo.community.ScrapVO;

@Service
public interface ScrapService {
	public boolean isScrap(ScrapVO scrapVO);
	public void insertScrap(ScrapVO scrapVO);
	public void deleteScrap(ScrapVO scrapVO);
	public List<ScrapVO> getScrapList(ScrapVO scrapVO);
	public ScrapVO getScrap(ScrapVO scrapVO);
}