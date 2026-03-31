package com.threeteam.dango.mapper.check;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.domain.check.CheckVO;
import com.threeteam.dango.domain.word.WordVO;

@Mapper
public interface CheckMapper {
	public CheckVO isCheck(CheckVO vo);
	public void onCheck(CheckVO vo);
	public void offCheck(CheckVO vo);
	public List<WordVO> getCheckList(String userId);
}
