package com.threeteam.dango.dao.user;

import org.springframework.stereotype.Repository;
import com.threeteam.dango.domain.user.UserVO;

@Repository
public interface UserDAO {
	public UserVO login(UserVO user);
	public UserVO findByUserId(String userId);
	public Long countUserId(String userId);
	public void register(UserVO user);
	public boolean update(UserVO user);
	public boolean remove(String id);
	public String findid(UserVO user);
	public Integer findpw(UserVO user);
}
