package com.kulkkeok.model.dao.moim;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.UserDto;

import mybatis.SqlMapConfig;

public class MoimDaoMyBatis extends SqlMapConfig implements MoimDao{

	@Override
	public List<MoimDto> getAllMoimList(int startRow, int endRow) {
		System.out.println("MyBatis : [ getAllMoimList ] 실행");
		SqlSession session = null;
		List<MoimDto> res = new ArrayList<MoimDto>();
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectList(namespace+"getAllMoimListSql",param);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return res;
	}
	
	
	@Override
	public int totalMoim() {
		System.out.println("MyBatis : [ totalMoim ] 실행");
		SqlSession session = null;
		int res= 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"totalMoimSql");
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
	
		return res;

	}
	
	@Override
	public List<MoimDto> getMoimListNotClosed() {
		System.out.println("MyBatis : [ getMoimListNotClosed ] 실행");
		SqlSession session = null;
		List<MoimDto> res = new ArrayList<MoimDto>();
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectList(namespace+"getMoimListNotClosedSql");
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
		
	}

	@Override
	public MoimDto getMoimDetail(int moimNo) {
		System.out.println("MyBatis : [ getMoimDetail ] 실행");
		SqlSession session = null;
		MoimDto res = new MoimDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"getMoimDetailSql",moimNo);
			
		}catch (Exception e) {
		
		} finally {
			session.close();
		}

		return res;
	}

	@Override
	public List<MoimDto> getMyMoimList(String userId) {
		return null;
	}

	@Override
	public int insertOne(MoimDto dto) {
		System.out.println("MyBatis : [ insertOneSql ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertOneSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int update(MoimDto dto) {
		System.out.println("MyBatis : [ update ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int delete(int moimNo) {		
		System.out.println("MyBatis : [ delete ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteSql",moimNo);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

	//글쓴이 이메일 가져와서 신청하기 폼에 넣기
	@Override
	public UserDto getWriterEmail(int moimNo) {
		System.out.println("MyBatis : [ getWriterEmail ] 실행");
		SqlSession session = null;
		UserDto dto = new UserDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			String email = session.selectOne(namespace+"getWriterEmailSql",moimNo);
			dto.setUserEmail(email);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
	
		return dto;
	}
}
