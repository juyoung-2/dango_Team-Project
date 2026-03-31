package com.threeteam.dango.mapper.user;

import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.domain.user.UserVO;

@Mapper
public interface UserMapper {
	public void insert(UserVO login);
	public UserVO select(UserVO login);
	public UserVO selectByUserId(String userId);
	public Long selectCountByUserId(String userId);
	public int delete(String id);
	public int update(UserVO user);
	public String selectid(UserVO user);
	public Integer selectpw(UserVO user);
}
