package com.kulkkeok.model.dao.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.ReviewDto;

import mybatis.SqlMapConfig;

public class ReviewDaoMyBatis extends SqlMapConfig implements ReviewDao{

	//해당 맥주 리뷰 리스트
	@Override	
	public List<ReviewDto> getBeerReviewList(int beerNo) {
		System.out.println("MyBatis : [ getBeerReviewList ] 실행");
		SqlSession session = null;
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		//System.out.println(beerNo);
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getBeerReviewListSql",beerNo);
			//System.out.println(list.size());
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
		
	}
	

	
		//리뷰 작성
		@Override
		public boolean insertReview(ReviewDto dto) {
			System.out.println("MyBatis : [ insertReview ] 실행");
			SqlSession session = null;
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.insert(namespace+"insertReviewSql",dto);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				session.close();
			}

			return (res>0)?true:false;
		}
	
		
		//리뷰 수정
		@Override
		public boolean updateReview(int reviewNo, String reviewContent) {
			System.out.println("MyBatis : [ updateReview ] 실행");
			SqlSession session = null;
			
			ReviewDto dto = new ReviewDto();
			dto.setReviewNo(reviewNo);
			dto.setReviewContent(reviewContent);
			
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.update(namespace+"updateReviewSql",dto);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				session.close();
			}

			return (res>0)?true:false;
		}

		
		//리뷰삭제
		@Override
		public boolean deleteReview(int beerNo, int reviewNo) {
			System.out.println("MyBatis : [ deleteReview ] 실행");
			SqlSession session = null;
			
			HashMap<String, Integer> param = new HashMap<String, Integer>();
			
			param.put("beerNo", beerNo);
			param.put("reviewNo", reviewNo);
			
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.delete(namespace+"deleteReviewSql",param);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				session.close();
			}

			return (res>0)?true:false;
		}

}
