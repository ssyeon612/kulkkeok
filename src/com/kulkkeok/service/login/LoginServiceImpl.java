package com.kulkkeok.service.login;

import com.kulkkeok.model.dao.login.LoginDao;
import com.kulkkeok.model.dao.login.LoginDaoMyBatis;
import com.kulkkeok.model.dto.UserDto;

public class LoginServiceImpl implements LoginService{
	LoginDao dao = new LoginDaoMyBatis();

	@Override
	public UserDto login(String id, String pw) {
		return new LoginDaoMyBatis().login(id, pw);
	}

	@Override
	public String findId(String name, String email) {
		return dao.findId(name, email);
	}

	@Override
	public String findPw(String name, String userId, String email) {
		return dao.findPw(name, userId, email);
	}

}