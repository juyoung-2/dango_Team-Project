package com.threeteam.dango.dao.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.mapper.user.UserMapper;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private UserMapper usermapper;
	
	@Override
	public UserVO login(UserVO user) {
		return usermapper.select(user) ;
	}
	
	@Override
	public UserVO findByUserId(String userId) {
		return usermapper.selectByUserId(userId);
	}
	
	@Override
	public Long countUserId(String userId) {
		return usermapper.selectCountByUserId(userId);
	}
	
	@Override
	public void register(UserVO user) {
		usermapper.insert(user);
	}
	
	@Override
	public boolean update(UserVO user) {
		return usermapper.update(user) != 0;
	}

	@Override
	public boolean remove(String id) {
		return usermapper.delete(id) != 0;
	}
	
	@Override
	public String findid(UserVO user) {
		return usermapper.selectid(user);
	}
	
	@Override
	public Integer findpw(UserVO user) {
		return usermapper.selectpw(user);
	}
}
