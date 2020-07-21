package com.kulkkeok.service.register;

import com.kulkkeok.model.dto.UserDto;

public interface RegisterService {
	int insert(UserDto user);
	String idChk(String id);
}
