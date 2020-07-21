package com.kulkkeok.model.dao.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.UserDto;

import mybatis.SqlMapConfig;

public class LoginDaoMyBatis extends SqlMapConfig implements LoginDao{

	@Override
	public UserDto login(String id, String pw) {
		System.out.println("MyBatis : [ login ] 실행");
		SqlSession session = null;
		
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("userId", id);
		param.put("userPw", pw);
		
		UserDto dto = new UserDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"loginSql",param);	
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public String findId(String name, String email) {
		System.out.println("MyBatis : [ findId ] 실행");
		SqlSession session = null;
		
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("userName", name);
		param.put("userEmail", email);
		String userId = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			userId = session.selectOne(namespace+"findIdSql", param);
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return userId;
	}

	@Override
	public String findPw(String name, String userId, String email) {
		System.out.println("MyBatis : [ findPw ] 실행");
		SqlSession session = null;
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("userName", name);
		param.put("userId",userId);
		param.put("userEmail", email);
		
		String password = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			password = session.selectOne(namespace+"findPwSql",param);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return password;
	}

}
