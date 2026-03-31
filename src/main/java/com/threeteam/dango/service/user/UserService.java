package com.threeteam.dango.service.user;

import org.springframework.stereotype.Service;
import com.threeteam.dango.domain.user.UserVO;

@Service
public interface UserService {
	public UserVO login(String id,String pw);
	public UserVO findByUserId(String userId);
	public Long countUserId(String userId);
	public void register(UserVO user);
	public boolean update(UserVO user);
	public boolean remove(String id);
	public String findid(UserVO user);
	public Integer findpw(UserVO user);
}
