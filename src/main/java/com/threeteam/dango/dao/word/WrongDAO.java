package com.threeteam.dango.dao.word;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WrongVO;
import com.threeteam.dango.mapper.word.WrongMapper;

@Repository
public class WrongDAO {
	
	@Autowired
	WrongMapper wrongMapper;
	
	public List<SentenceDTO> getListByUserId(String userId) {
		return wrongMapper.selectAllByUserId(userId);
	}
	
	public WrongVO getWrongVOByUserIdWordId(WrongVO wrongVO) {
		return wrongMapper.selectByUserIdWordId(wrongVO);
	}
	
	public void addWrongVO(WrongVO wrongVO) {
		wrongMapper.insert(wrongVO);
	}
	
	public void setWrongVO(WrongVO wrongVO) {
		wrongMapper.update(wrongVO);
	}
	
	public void removeWrongVO(Long wrongId) {
		wrongMapper.delete(wrongId);
	}
}
