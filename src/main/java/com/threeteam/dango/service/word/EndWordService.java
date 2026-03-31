package com.threeteam.dango.service.word;

import org.springframework.stereotype.Service;
import com.threeteam.dango.domain.word.EndWordVO;

@Service
public interface EndWordService {
	public EndWordVO getEndWordByUserIdWordId(EndWordVO endWordVO);
	public void addEndWord(EndWordVO endWordVO);
}
