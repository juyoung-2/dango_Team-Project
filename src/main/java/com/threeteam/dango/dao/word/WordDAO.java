package com.threeteam.dango.dao.word;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WordVO;
import com.threeteam.dango.mapper.word.WordMapper;

@Repository
public class WordDAO {
	
	@Autowired
	WordMapper wordMapper;
	
	public List<SentenceDTO> getSentenceList(Integer wordLevel, String userId) {
		return wordMapper.selectSentenceList(wordLevel, userId);
	}
	
	public SentenceDTO getSentenceByWordId(Long wordId) {
		return wordMapper.selectSentenceByWordId(wordId);
	}
	
	public List<WordVO> getWordAllByKeyword(String keyword) {
		return wordMapper.selectAllByKeyword(keyword);
	}
}
