package com.kulkkeok.model.dao.register;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.UserDto;

import mybatis.SqlMapConfig;

public class RegisterDaoMyBatis extends SqlMapConfig implements RegisterDao{

	@Override
	public int insert(UserDto user) {
		System.out.println("MyBatis : [ insert ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertSql",user);
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public String idChk(String id) {
		System.out.println("MyBatis : [ idChk ] 실행");
		SqlSession session = null;
		String chk = null;
		String userId=id;
		try {
			session = getSqlSessionFactory().openSession(true);
			chk = session.selectOne(namespace+"idChkSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		
		}finally {
			session.close();
		}
		
		return chk;
	}

}
