package com.kulkkeok.model.dao.review;

import java.util.List;

import com.kulkkeok.model.dto.ReviewDto;

public interface ReviewDao {
	String namespace = "mybatis.mapper.review.";
	String getBeerReviewListSql = "SELECT * FROM REVIEW WHERE BEER_NO=? ORDER BY REVIEW_DATE DESC";
	String insertReviewSql = "INSERT INTO REVIEW VALUES(REVIEWSQ.NEXTVAL, ?, SYSDATE, ?, ?, ?)";
	String updateReviewSql = "UPDATE REVIEW SET REVIEW_CONTENT=? WHERE REVIEW_NO=?";
	String deleteReviewSql = "DELETE FROM REVIEW WHERE BEER_NO=? AND REVIEW_NO=?";
	
	
	//리뷰 리스트 가져오기
	public List<ReviewDto> getBeerReviewList(int beerNo);
	
	//리뷰 작성
	public boolean insertReview(ReviewDto dto);

	//리뷰 수정
	public boolean updateReview(int reviewNo, String reviewContent);
	
	//리뷰 삭제
	public boolean deleteReview(int beerNo, int reviewNo);
	
	
}
