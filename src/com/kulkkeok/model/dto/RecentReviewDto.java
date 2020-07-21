package com.kulkkeok.model.dto;

import java.util.Date;

public class RecentReviewDto {
	private String userId;
	private String reviewContent;
	private String reviewStar;
	private String beerKorName;
	private Date reviewDate;
	private int beerNo;
	
	public RecentReviewDto() {}

	public RecentReviewDto(String userId, String reviewContent, String reviewStar, String beerKorName,
			Date reviewDate) {
		super();
		this.userId = userId;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.beerKorName = beerKorName;
		this.reviewDate = reviewDate;
		this.beerNo = beerNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getBeerKorName() {
		return beerKorName;
	}

	public void setBeerKorName(String beerKorName) {
		this.beerKorName = beerKorName;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public int getBeerNo() {
		return beerNo;
	}
	
	public void setBeerNo(int beerNo) {
		this.beerNo = beerNo;
	}
	
	
	

}
