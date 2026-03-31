package com.threeteam.dango.dao.check;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.check.CheckVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.domain.word.WordVO;
import com.threeteam.dango.mapper.check.CheckMapper;

@Repository
public class CheckDAO {
	
	@Autowired
	private CheckMapper checkMapper;
	
	public CheckVO isCheck(CheckVO vo) {
		return checkMapper.isCheck(vo);
	}
	
	public void onCheck(CheckVO vo) {
		checkMapper.onCheck(vo);
	}
	
	public void offCheck(CheckVO vo) {
		checkMapper.offCheck(vo);
	}
	
	public List<WordVO> getCheckList(UserVO userVO){
		return checkMapper.getCheckList(userVO.getUserId());
	}
}