package com.kulkkeok.service.register;

import com.kulkkeok.model.dao.register.RegisterDao;
import com.kulkkeok.model.dao.register.RegisterDaoMyBatis;
import com.kulkkeok.model.dto.UserDto;

public class RegisterServiceImpl implements RegisterService{
	RegisterDao dao = new RegisterDaoMyBatis();
	@Override
	public int insert(UserDto user) {
		return dao.insert(user);
	}

	@Override
	public String idChk(String id) {
		return dao.idChk(id);
	}

}
