package com.kulkkeok.model.dao.bookmark;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BookMarkDto;

import mybatis.SqlMapConfig;

public class BookMarkDaoMyBatis extends SqlMapConfig implements BookMarkDao{

	@Override
	public int countBookMark(int beerNo) {
		System.out.println("MyBatis : [ countBookMark ] 실행");
		int res = 0; 
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"countBookMarkSql",beerNo);
			//System.out.println(res);
			
		} catch (Exception e) {
			
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public boolean confirmBookmarkBeer(int beerNo, String userId) {
		System.out.println("MyBatis : [ confirmBookmarkBeer ] 실행");
		int res = 0; 
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("beerNo", beerNo);
		param.put("userId", userId);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"confirmBookmarkBeerSql",param);
		} catch (Exception e) {
			
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean removeBookmarkBeer(BookMarkDto dto) {
		System.out.println("MyBatis : [ removeBookmarkBeer ] 실행");
		int res = 0; 
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"removeBookmarkBeerSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return (res>0)?true:false;
	}

	@Override
	public boolean addBookMarkBeer(BookMarkDto dto) {
		System.out.println("MyBatis : [ addBookMarkBeer ] 실행");
		int res = 0; 
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"addBookMarkBeerSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false; 
	}

}
