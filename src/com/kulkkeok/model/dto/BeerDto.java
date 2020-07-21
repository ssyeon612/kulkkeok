package com.kulkkeok.model.dto;


public class BeerDto {

   private int beerNo;               	//맥주번호
   private String beerKorName;          //맥주 한국 이름   
   private String beerEngName;          //맥주 영어 이름
   private String originCode;           //맥주 원산지 (영어)
   private String typeCode;         	//맥주 종류 (영어)
   private String beerAbv;              //맥주 도수
   private String beerDetail;           //맥주 정보
   private String beerPic;              //맥주 사진
   private String typeName; 			//맥주 종류 (한글)
   private String originName;			//맥주 원산지 (한글)
   
   
    public BeerDto() {}
    
	public BeerDto(int beerNo, String beerKorName, String beerEngName, String originCode, String typeCode,
			String beerAbv, String beerDetail, String beerPic) {
		super();
		this.beerNo = beerNo;
		this.beerKorName = beerKorName;
		this.beerEngName = beerEngName;
		this.originCode = originCode;
		this.typeCode = typeCode;
		this.beerAbv = beerAbv;
		this.beerDetail = beerDetail;
		this.beerPic = beerPic;
	}



	public BeerDto(int beerNo, String beerKorName, String beerEngName, String originCode, String typeCode,
			String beerAbv, String beerDetail, String beerPic, String typeName, String orginName) {
		super();
		this.beerNo = beerNo;
		this.beerKorName = beerKorName;
		this.beerEngName = beerEngName;
		this.originCode = originCode;
		this.typeCode = typeCode;
		this.beerAbv = beerAbv;
		this.beerDetail = beerDetail;
		this.beerPic = beerPic;
		this.typeName = typeName;
		this.originName = orginName;
	}
	

	public BeerDto (String typeCode, String originCode, int beerNo, String beerKorName, String beerEngName, 
					String beerAbv, String beerDetail, String beerPic, String originName, String typeName) {
		super();
		this.typeCode = typeCode;
		this.originCode = originCode;
		this.beerNo = beerNo;
		this.beerKorName = beerKorName;
		this.beerEngName = beerEngName;
		this.beerAbv = beerAbv;
		this.beerDetail = beerDetail;
		this.beerPic = beerPic;
		this.originName = originName;
		this.typeName = typeName;
		
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


	public String getBeerEngName() {
		return beerEngName;
	}


	public void setBeerEngName(String beerEngName) {
		this.beerEngName = beerEngName;
	}


	public String getOriginCode() {
		return originCode;
	}


	public void setOriginCode(String originCode) {
		this.originCode = originCode;
	}


	public String getTypeCode() {
		return typeCode;
	}


	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}


	public String getBeerAbv() {
		return beerAbv;
	}


	public void setBeerAbv(String beerAbv) {
		this.beerAbv = beerAbv;
	}


	public String getBeerDetail() {
		return beerDetail;
	}


	public void setBeerDetail(String beerDetail) {
		this.beerDetail = beerDetail;
	}


	public String getBeerPic() {
		return beerPic;
	}


	public void setBeerPic(String beerPic) {
		this.beerPic = beerPic;
	}
	
	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	//맥주 월드컵
	public boolean compareTo(Object obj) {
	      if (this == obj)
	         return true;
	      if (obj == null)
	         return false;
	      if (getClass() != obj.getClass())
	         return false;
	      BeerDto other = (BeerDto) obj;
	      if (beerAbv == null) {
	         if (other.beerAbv != null)
	            return false;
	      } else if (!beerAbv.equals(other.beerAbv))
	         return false;
	      if (beerDetail == null) {
	         if (other.beerDetail != null)
	            return false;
	      } else if (!beerDetail.equals(other.beerDetail))
	         return false;
	      if (beerEngName == null) {
	         if (other.beerEngName != null)
	            return false;
	      } else if (!beerEngName.equals(other.beerEngName))
	         return false;
	      if (beerKorName == null) {
	         if (other.beerKorName != null)
	            return false;
	      } else if (!beerKorName.equals(other.beerKorName))
	         return false;
	      if (beerNo != other.beerNo)
	         return false;
	      if (beerPic == null) {
	         if (other.beerPic != null)
	            return false;
	      } else if (!beerPic.equals(other.beerPic))
	         return false;
	      if (originCode == null) {
	         if (other.originCode != null)
	            return false;
	      } else if (!originCode.equals(other.originCode))
	         return false;
	      if (typeCode == null) {
	         if (other.typeCode != null)
	            return false;
	      } else if (!typeCode.equals(other.typeCode))
	         return false;
	      return true;
	   }

   
}
