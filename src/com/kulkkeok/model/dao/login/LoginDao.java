package com.kulkkeok.model.dao.login;

import com.kulkkeok.model.dto.UserDto;

public interface LoginDao {
	
	String namespace = "mybatis.mapper.login.";
	
	String loginSql = "SELECT * FROM USER_TB WHERE USER_ID = ? AND USER_PW = ?";
	String findIdSql = "SELECT USER_ID FROM USER_TB WHERE USER_NAME = ? AND USER_EMAIL = ?";
	String findPwSql = "SELECT USER_PW FROM USER_TB WHERE USER_NAME = ? AND USER_ID = ? AND USER_EMAIL = ?";
	
	UserDto login(String id, String pw);
	String findId(String name, String email);
	String findPw(String name, String userId, String email);
}