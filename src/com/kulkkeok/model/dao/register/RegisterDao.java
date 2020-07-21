package com.kulkkeok.model.dao.register;

import com.kulkkeok.model.dto.UserDto;

public interface RegisterDao {
	
	String namespace = "mybatis.mapper.register.";
	
	String insertSql = "INSERT INTO USER_TB VALUES(?, ?, ?, ?, ?, ?, 'USER')";
	String idChkSql = "SELECT * FROM USER_TB WHERE USER_ID = ?";
	
	int insert(UserDto user);
	String idChk(String id);
}