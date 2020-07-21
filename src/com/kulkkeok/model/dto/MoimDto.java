package com.kulkkeok.model.dto;

import java.util.Date;

	public class MoimDto{
		private int moimNo;
		private String moimTitle;
		private String userId;
		private String categoryNo;
		private String moimContent;
		private java.sql.Date moimWriteDate; //작성날짜
		private java.sql.Date moimDate; //모임일자
		private String moimStatus; //종료여부
		private String moimPlaceName;
		private String moimPlaceAdd;
   
		public MoimDto() {}

		public MoimDto(int moimNo, String moimTitle, String userId, String categoryNo, String moimContent, java.sql.Date moimWriteDate,
					java.sql.Date moimDate, String moimStatus, String moimPlaceName, String moimPlaceAdd) {
			super();
			this.moimNo = moimNo;
			this.moimTitle = moimTitle;
			this.userId = userId;
			this.categoryNo = categoryNo;
			this.moimContent = moimContent;
			this.moimWriteDate = moimWriteDate;
			this.moimDate = moimDate;
			this.moimStatus = moimStatus;
			this.moimPlaceName = moimPlaceName;
			this.moimPlaceAdd = moimPlaceAdd;
		}

		public int getMoimNo() {
			return moimNo;
		}

		public void setMoimNo(int moimNo) {
			this.moimNo = moimNo;
		}

		public String getMoimTitle() {
			return moimTitle;
		}

		public void setMoimTitle(String moimTitle) {
			this.moimTitle = moimTitle;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getCategoryNo() {
			return categoryNo;
		}

		public void setCategoryNo(String categoryNo) {
			this.categoryNo = categoryNo;
		}

		public String getMoimContent() {
			return moimContent;
		}

		public void setMoimContent(String moimContent) {
			this.moimContent = moimContent;
		}

		public Date getMoimWriteDate() {
			return moimWriteDate;
		}

		public void setMoimWriteDate(java.sql.Date moimWriteDate) {
			this.moimWriteDate = moimWriteDate;
		}

		public java.sql.Date getMoimDate() {
			return moimDate;
		}

		public void setMoimDate(java.sql.Date moimDate) {
			this.moimDate = moimDate;
		}

		public String getMoimStatus() {
			return moimStatus;
		}

		public void setMoimStatus(String moimStatus) {
			this.moimStatus = moimStatus;
		}

		public String getMoimPlaceName() {
			return moimPlaceName;
		}

		public void setMoimPlaceName(String moimPlaceName) {
			this.moimPlaceName = moimPlaceName;
		}

		public String getMoimPlaceAdd() {
			return moimPlaceAdd;
		}

		public void setMoimPlaceAdd(String moimPlaceAdd) {
			this.moimPlaceAdd = moimPlaceAdd;
		}
   
   
   
}