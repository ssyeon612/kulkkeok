package com.kulkkeok.model.dto;


import java.util.Date;

public class ReviewDto {

   private int reviewNo;              //리뷰번호
   private String reviewContent;      //리뷰내용
   private Date reviewDate;           //작성일자
   private int reviewStar;            //리뷰별점
   private String userId;             //리뷰작성자
   private int beerNo;                //맥주번호
   
   
   public ReviewDto() {}

   
   //리뷰 작성
   public ReviewDto(String reviewContent, int reviewStar , String userId, int beerNo) {
	   this.reviewContent = reviewContent;
	   this.reviewStar = reviewStar;
	   this.userId = userId;
	   this.beerNo = beerNo;
   }
   
   //리뷰 수정
   public ReviewDto(int reviewNo, String reviewContent) {
	   this.reviewNo = reviewNo;
	   this.reviewContent = reviewContent;
   }

   public ReviewDto(int reviewNo, String reviewContent, Date reviewDate, int reviewStar, String userId, int beerNo) {
      super();
      this.reviewNo = reviewNo;
      this.reviewContent = reviewContent;
      this.reviewDate = reviewDate;
      this.reviewStar = reviewStar;
      this.userId = userId;
      this.beerNo = beerNo;
   }


   public ReviewDto(String content) {
	   this.reviewContent = content;
}


public int getReviewNo() {
      return reviewNo;
   }


   public void setReviewNo(int reviewNo) {
      this.reviewNo = reviewNo;
   }


   public String getReviewContent() {
      return reviewContent;
   }


   public void setReviewContent(String reviewContent) {
      this.reviewContent = reviewContent;
   }


   public Date getReviewDate() {
      return reviewDate;
   }


   public void setReviewDate(Date reviewDate) {
      this.reviewDate = reviewDate;
   }


   public int getReviewStar() {
      return reviewStar;
   }


   public void setReviewStar(int reviewStar) {
      this.reviewStar = reviewStar;
   }


   public String getUserId() {
      return userId;
   }


   public void setUserId(String userId) {
      this.userId = userId;
   }


   public int getBeerNo() {
      return beerNo;
   }


   public void setBeerNo(int beerNo) {
      this.beerNo = beerNo;
   }   
   
   
   
   
}
