package com.threeteam.dango.mapper.community;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.vo.community.ScrapVO;

@Mapper
public interface ScrapMapper {
	public ScrapVO getScrap(ScrapVO scrapVO);
	public List<ScrapVO> getScrapList(ScrapVO scrapVO);
	public void addScrap(ScrapVO scrapVO);
	public void deleteScrap(ScrapVO scrapVO);
	public boolean isScrap(ScrapVO scrapVO);
}