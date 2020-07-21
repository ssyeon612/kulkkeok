package com.kulkkeok.model.dao.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

import mybatis.SqlMapConfig;

public class MypageDaoMyBatis extends SqlMapConfig implements MypageDao{

	@Override
	public boolean update(UserDto user) {
		System.out.println("MyBatis : [ update ] 실행");
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateSql",user);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return (res>0)?true:false;
	}

	@Override
	public List<BeerDto> getMyBeerList(String userId) {
		System.out.println("MyBatis : [ getMyBeerList ] 실행");
		
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"getMyBeerListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}
		
		return list;
	}

	@Override
	public List<ReviewDto> getMyReviewList(String userId) {
		System.out.println("MyBatis : [ getMyReviewList ] 실행");
		
		SqlSession session = null;
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"getMyReviewListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<MoimDto> getMyMoimList(String userId) {
		System.out.println("MyBatis : [ getMyMoimList ] 실행");
		SqlSession session = null;
		List<MoimDto> list = new ArrayList<MoimDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"getMyMoimListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public boolean delete(String id, String pw) {
		System.out.println("MyBatis : [ delete ] 실행");
		SqlSession session = null;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userId", id);
		param.put("userPw", pw);
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteSql",param);
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public List<BeerDto> getBeerList(int[] beerNo) {
		System.out.println("MyBatis : [ getBeerList ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			for(int i=0;i<beerNo.length;i++) {
				int no = beerNo[i];
				BeerDto dto = session.selectOne(namespace+"getBeerList",no);
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

}
