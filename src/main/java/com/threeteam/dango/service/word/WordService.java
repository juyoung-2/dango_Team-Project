package com.threeteam.dango.service.word;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WordVO;

@Service
public interface WordService {
	public List<SentenceDTO> getSentenceList(Integer wordLevel, String userId);
	public SentenceDTO getSentenceByWordId(Long wordId);
	public List<WordVO> getWordAllByKeyword(String keyword);
}
