package com.kulkkeok.model.dto;

public class StarAvgDto {
	
	private int beerNo;			//맥주번호
	private int starAvg;		//별점평균
	
	public StarAvgDto () {}
	public StarAvgDto(int starAvg) {
		this.starAvg = starAvg;
	}

	public StarAvgDto(int beerNo, int starAvg) {
		super();
		this.beerNo = beerNo;
		this.starAvg = starAvg;
	}

	public int getBeerNo() {
		return beerNo;
	}

	public void setBeerNo(int beerNo) {
		this.beerNo = beerNo;
	}

	public int getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(int starAvg) {
		this.starAvg = starAvg;
	}
	
	

}
