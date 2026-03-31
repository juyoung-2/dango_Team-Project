package com.threeteam.dango.mapper.word;

import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.domain.word.EndWordVO;

@Mapper
public interface EndWordMapper {
	public void insert(EndWordVO endWordVO);
	public EndWordVO selectByUserIdWordId(EndWordVO endWordVO);
}