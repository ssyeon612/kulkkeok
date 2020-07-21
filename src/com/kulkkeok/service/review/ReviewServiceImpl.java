package com.kulkkeok.service.review;

import java.util.List;

import com.kulkkeok.model.dao.review.ReviewDao;
import com.kulkkeok.model.dao.review.ReviewDaoMyBatis;
import com.kulkkeok.model.dto.ReviewDto;

public class ReviewServiceImpl implements ReviewService{
	
	private ReviewDao dao = new ReviewDaoMyBatis();
	

	@Override
	public List<ReviewDto> getBeerReviewList(int beerNo) {
		return dao.getBeerReviewList(beerNo);
	}

	
	@Override
	public boolean insertReview(ReviewDto dto) {
		dto.setUserId(dto.getUserId().trim());
		return dao.insertReview(dto);
	}
	
	
	@Override
	public boolean updateReview(int reviewNo, String reviewContent) {
		return dao.updateReview(reviewNo, reviewContent);
	}

	
	@Override
	public boolean deleteReview(int beerNo, int reviewNo) {
		return dao.deleteReview(beerNo, reviewNo);
	}


}
