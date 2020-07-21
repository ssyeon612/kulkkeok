package com.kulkkeok.model.dto;

public class BestbeerDto {
	private int beerNo;
	private String beerKorName;
	private double beerAbv;
	private double starAvg;
	private int intStarAvg;
	private int countReview;
	private String typeName;
	private String beerPic;
	
	public BestbeerDto() {
	}

	public BestbeerDto(int beerNo, String beerKorName, double beerAbv, double starAvg, int intStarAvg, int countReview,
			String typeName, String beerPic) {
		super();
		this.beerNo = beerNo;
		this.beerKorName = beerKorName;
		this.beerAbv = beerAbv;
		this.starAvg = starAvg;
		this.intStarAvg = intStarAvg;
		this.countReview = countReview;
		this.typeName = typeName;
		this.beerPic = beerPic;
	}

	public int getBeerNo() {
		return beerNo;
	}

	public void setBeerNo(int beerNo) {
		this.beerNo = beerNo;
	}

	public String getBeerKorName() {
		return beerKorName;
	}

	public void setBeerKorName(String beerKorName) {
		this.beerKorName = beerKorName;
	}

	public double getBeerAbv() {
		return beerAbv;
	}

	public void setBeerAbv(double beerAbv) {
		this.beerAbv = beerAbv;
	}

	public double getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}

	public int getIntStarAvg() {
		return intStarAvg;
	}

	public void setIntStarAvg(int intStarAvg) {
		this.intStarAvg = intStarAvg;
	}

	public int getCountReview() {
		return countReview;
	}

	public void setCountReview(int countReview) {
		this.countReview = countReview;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getBeerPic() {
		return beerPic;
	}

	public void setBeerPic(String beerPic) {
		this.beerPic = beerPic;
	}

	
	
	
	

}
