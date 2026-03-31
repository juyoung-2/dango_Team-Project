package com.threeteam.dango.service.word;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.word.WrongDAO;
import com.threeteam.dango.domain.word.SentenceDTO;
import com.threeteam.dango.domain.word.WrongVO;

@Service
@Primary
public class WrongServiceImpl implements WrongService {
	
	@Autowired
	WrongDAO wrongDAO;
	
	@Override
	public List<SentenceDTO> getWrongAllByUserId(String userId) {
		return wrongDAO.getListByUserId(userId);
	}
	
	@Override
	public WrongVO getWrongVOByUserIdWordId(WrongVO wrongVO) {
		return wrongDAO.getWrongVOByUserIdWordId(wrongVO);
	}

	@Override
	public void addWrong(WrongVO wrongVO) {
		wrongDAO.addWrongVO(wrongVO);
	}

	@Override
	public void setWrong(WrongVO wrongVO) {
		wrongDAO.setWrongVO(wrongVO);
	}

	@Override
	public void removeWrong(Long wrongId) {
		wrongDAO.removeWrongVO(wrongId);
	}
}
