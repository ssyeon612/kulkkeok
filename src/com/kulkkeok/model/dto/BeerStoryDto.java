package com.kulkkeok.model.dto;


public class BeerStoryDto {
   private int storyNo;
   private String storyName;
   private String storyLink;
   private String storyImg;
   
   
   public BeerStoryDto() {
      
   }

   public BeerStoryDto(int storyNo, String storyName, String storyLink, String storyImg) {
      super();
      this.storyNo = storyNo;
      this.storyName = storyName;
      this.storyLink = storyLink;
      this.storyImg = storyImg;
   }

   public BeerStoryDto(int storyNo, String storyName, String storyLink) {
	super();
	this.storyNo = storyNo;
	this.storyName = storyName;
	this.storyLink = storyLink;
   }

   public int getStoryNo() {
      return storyNo;
   }

   public void setStoryNo(int storyNo) {
      this.storyNo = storyNo;
   }

   public String getStoryName() {
      return storyName;
   }

   public void setStoryName(String storyName) {
      this.storyName = storyName;
   }

   public String getStoryLink() {
      return storyLink;
   }

   public void setStoryLink(String storyLink) {
      this.storyLink = storyLink;
   }

   public String getStoryImg() {
	return storyImg;
   }

   public void setStoryImg(String storyImg) {
	this.storyImg = storyImg;
   }
   
   
   

   
}