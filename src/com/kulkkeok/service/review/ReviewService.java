package com.kulkkeok.service.review;

import java.util.List;

import com.kulkkeok.model.dto.ReviewDto;

public interface ReviewService {
	
	public List<ReviewDto> getBeerReviewList(int beerNo);
	
	public boolean insertReview(ReviewDto dto);
	
	public boolean updateReview(int reviewNo, String reviewContent);

	public boolean deleteReview(int beerNo, int reviewNo);
	
}
