package com.threeteam.dango.service.check;

import java.util.List;
import com.threeteam.dango.domain.check.CheckVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.domain.word.WordVO;

public interface CheckService {
	public CheckVO isCheck(CheckVO vo);
	public void onCheck(CheckVO vo);
	public void offCheck(CheckVO vo);
	public List<WordVO> getCheckList(UserVO userVO);
}