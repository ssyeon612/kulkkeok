package com.kulkkeok.model.dao.mypage;

import java.util.Date;
import java.util.List;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

public interface MypageDao {
	// 회원 개인정보 수정
	String namespace = "mybatis.mapper.mypage.";
	
	String updateSql = "UPDATE USER_TB SET USER_PW = ?, USER_NAME = ?, USER_EMAIL = ?, USER_PHONE = ? WHERE USER_ID = ?";
	
	// 나의 맥주 북마크
	String getMyBeerListSql = "SELECT * FROM BEER B JOIN BOOKMARK M "
			+ "ON(M.USER_ID=? AND B.BEER_NO=M.BEER_NO)";

	// 내가 쓴 리뷰
	String getMyReviewListSql = "SELECT * FROM REVIEW WHERE USER_ID=?";
	
	// 내가 연 모임
	  String getMyMoimListSql = " SELECT MOIM_NO, " + 
	  		" MOIM_TITLE, " + 
	  		" MOIM_CONTENT, " + 
	  		" MOIM_WRITEDATE, " + 
	  		" MOIM_DATE, " + 
	  		" MOIM_PLACENAME, " + 
	  		" MOIM_PLACEADD, " + 
	  		" CATEGORY_NAME, " + 
	  		" USER_ID FROM MOIM_BOARD " + 
	  		" JOIN CATEGORY USING (CATEGORY_CODE) " + 
	  		" WHERE USER_ID=? ";
	
	// 회원 탈퇴
	String deleteSql = "DELETE FROM USER_TB WHERE USER_ID = ? AND USER_PW = ?";
	
	String getBeerListSql = "SELECT *FROM BEER WHERE BEER_NO = ?";

	boolean update(UserDto user);
	List<BeerDto> getMyBeerList(String userId);
	List<ReviewDto> getMyReviewList(String userId);
	List<MoimDto> getMyMoimList(String userId);
	boolean delete(String id, String pw);
	List<BeerDto> getBeerList(int[] beerNo);
	
}
