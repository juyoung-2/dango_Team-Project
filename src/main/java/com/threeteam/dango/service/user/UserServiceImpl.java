package com.threeteam.dango.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.user.UserDAO;
import com.threeteam.dango.domain.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(String id,String pw) {
		UserVO user = new UserVO();
		user.setUserId(id);
		user.setUserPw(pw);
		return userDAO.login(user) ;
	}
	
	@Override
	public UserVO findByUserId(String userId) {
		return userDAO.findByUserId(userId);
	}
	
	@Override
	public Long countUserId(String userId) {
		return userDAO.countUserId(userId);
	}
	
	@Override
	public void register(UserVO user) {
		userDAO.register(user);
	}
	
	@Override
	public boolean update(UserVO user) {
		return userDAO.update(user);
	}
	
	@Override
	public boolean remove(String id) {
		return userDAO.remove(id);
	}
	
	@Override
	public String findid(UserVO user) {
		return userDAO.findid(user);
	}
	
	@Override
	public Integer findpw(UserVO user) {
		return userDAO.findpw(user);
	}

}
