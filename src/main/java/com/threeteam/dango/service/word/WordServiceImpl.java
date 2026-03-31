package com.threeteam.dango.service.word;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.word.WordDAO;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WordVO;

@Service
@Primary
public class WordServiceImpl implements WordService {
	
	@Autowired
	WordDAO wordDAO;
	
	@Override
	public List<SentenceDTO> getSentenceList(Integer wordLevel, String userId) {
		return wordDAO.getSentenceList(wordLevel, userId);
	}

	@Override
	public SentenceDTO getSentenceByWordId(Long wordId) {
		return wordDAO.getSentenceByWordId(wordId);
	}

	@Override
	public List<WordVO> getWordAllByKeyword(String keyword) {
		return wordDAO.getWordAllByKeyword(keyword);
	}
}
