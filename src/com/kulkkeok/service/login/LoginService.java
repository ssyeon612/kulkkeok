package com.kulkkeok.service.login;

import com.kulkkeok.model.dto.UserDto;

public interface LoginService {
	UserDto login(String id, String pw);
	String findId(String name, String email);
	String findPw(String name, String userId, String email);
}