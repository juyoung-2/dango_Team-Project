package com.threeteam.dango.dao.word;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.word.EndWordVO;
import com.threeteam.dango.mapper.word.EndWordMapper;

@Repository
public class EndWordDAO {
	
	@Autowired
	EndWordMapper endWordMapper;
	
	public EndWordVO getEndWordByUserIdWordId(EndWordVO endWordVO) {
		return endWordMapper.selectByUserIdWordId(endWordVO);
	}
	
	public void addEndWord(EndWordVO endWordVO) {
		endWordMapper.insert(endWordVO);
	}
}
