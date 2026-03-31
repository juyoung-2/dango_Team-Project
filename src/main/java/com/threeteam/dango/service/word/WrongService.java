package com.threeteam.dango.service.word;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WrongVO;

@Service
public interface WrongService {
	public List<SentenceDTO> getWrongAllByUserId(String userId);
	public WrongVO getWrongVOByUserIdWordId(WrongVO wrongVO);
	public void addWrong(WrongVO wrongVO);
	public void setWrong(WrongVO wrongVO);
	public void removeWrong(Long wrongId);
}
