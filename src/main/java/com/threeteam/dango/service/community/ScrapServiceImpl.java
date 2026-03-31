package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.community.ScrapDAO;
import com.threeteam.dango.vo.community.ScrapVO;

@Service
public class ScrapServiceImpl implements ScrapService {

	@Autowired
	ScrapDAO scrapDAO;
	
	@Override
	public boolean isScrap(ScrapVO scrapVO) {
		boolean isScrap = scrapDAO.isScrap(scrapVO);
		if(!isScrap) {
			scrapDAO.insertScrap(scrapVO);
			isScrap = true;
		}else {
			scrapDAO.deleteScrap(scrapVO);
			isScrap = false;
		}
		return !isScrap;
	}
	
	@Override
	public List<ScrapVO> getScrapList(ScrapVO scrapVO) {
		return scrapDAO.getScrapList(scrapVO);
	}

	@Override
	public ScrapVO getScrap(ScrapVO scrapVO) {
		return scrapDAO.getScrap(scrapVO);
	}
	
	@Override
	public void insertScrap(ScrapVO scrapVO) {
		scrapDAO.insertScrap(scrapVO);
	}

	@Override
	public void deleteScrap(ScrapVO scrapVO) {
		scrapDAO.deleteScrap(scrapVO);
	}

}
