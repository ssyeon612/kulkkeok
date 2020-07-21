package com.kulkkeok.model.dto;

public class BookMarkDto {
	
	private int beerNo;				//맥주번호
	private String userId;			//사용자 아이디
	private String bookMarkStatus;	//북마크 여부 ('Y' or 'N')
	
	public BookMarkDto () {}

	public BookMarkDto(int beerNo, String userId, String bookMarkStatus) {
		super();
		this.beerNo = beerNo;
		this.userId = userId;
		this.bookMarkStatus = bookMarkStatus;
	}
	
	public BookMarkDto(String userId) {
		this.userId = userId;
	}

	public int getBeerNo() {
		return beerNo;
	}

	public void setBeerNo(int beerNo) {
		this.beerNo = beerNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookMarkStatus() {
		return bookMarkStatus;
	}

	public void setBookMarkStatus(String bookMarkStatus) {
		this.bookMarkStatus = bookMarkStatus;
	}
	
	

}
