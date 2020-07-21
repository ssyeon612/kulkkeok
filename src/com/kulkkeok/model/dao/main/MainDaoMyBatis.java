package com.kulkkeok.model.dao.main;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BestbeerDto;
import com.kulkkeok.model.dto.RecentReviewDto;

import mybatis.SqlMapConfig;

public class MainDaoMyBatis extends SqlMapConfig implements MainDao{
	
	public List<BestbeerDto> bestStar(){
		System.out.println("MyBatis : [ bestStar ] 실행");
		SqlSession session = null;
		
		List<BestbeerDto> res = new ArrayList<BestbeerDto>();

		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectList(namespace+"bestStarSql");
		
		} catch (Exception e) {
		}finally {
			session.close();
		}
		
		for(BestbeerDto dto : res) {
			dto.setIntStarAvg((int) dto.getStarAvg());
		}
		
		return res;
	}
	
	
	//리뷰 개수 순
	public List<BestbeerDto> countReview(){
		System.out.println("MyBatis : [ countReview ] 실행");
		SqlSession session = null;
		
		List<BestbeerDto> res = new ArrayList<BestbeerDto>();

		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectList(namespace+"countReviewSql");
		
		} catch (Exception e) {
		}finally {
			session.close();
		}
		
		for(BestbeerDto dto : res) {
			dto.setIntStarAvg((int) dto.getStarAvg());
		}
		
		return res;
	}
	
	
	//최근 리뷰
	public List<RecentReviewDto> getRecentReviewList(){
		System.out.println("MyBatis : [ getRecentReviewList ] 실행");
		SqlSession session = null;

		List<RecentReviewDto> res = new ArrayList<RecentReviewDto>();
	
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectList(namespace+"getRecentReviewlistSql");
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
		
	}
}
