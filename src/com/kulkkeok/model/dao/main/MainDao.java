package com.kulkkeok.model.dao.main;

import java.util.List;

import com.kulkkeok.model.dto.BestbeerDto;
import com.kulkkeok.model.dto.RecentReviewDto;

public interface MainDao {

	String namespace="mybatis.mapper.main.";
	//평점순으로 가져오기
	String bestStarSql = "SELECT * FROM (" + 
			"    SELECT BEER_NO, BEER_KOR_NAME, BEER_ABV, AVG(REVIEW_STAR), COUNT(*) RV, TYPE_NAME, BEER_PIC," + 
			"    ROW_NUMBER() OVER(ORDER BY AVG(REVIEW_STAR) DESC) RR" + 
			"    FROM REVIEW" + 
			"    JOIN BEER USING (BEER_NO)" + 
			"    JOIN TYPE USING (TYPE_CODE)" + 
			"    GROUP BY BEER_NO, BEER_KOR_NAME, BEER_ABV, TYPE_NAME, BEER_PIC" + 
			")" + 
			"WHERE RR<4";
	
	String countReviewSql = "SELECT * FROM (" + 
			"    SELECT BEER_NO, BEER_KOR_NAME, BEER_ABV, AVG(REVIEW_STAR), COUNT(*), TYPE_NAME, BEER_PIC," + 
			"    ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) RR" + 
			"    FROM REVIEW" + 
			"    JOIN BEER USING (BEER_NO)" + 
			"    JOIN TYPE USING (TYPE_CODE)" + 
			"    GROUP BY BEER_NO, BEER_KOR_NAME, BEER_ABV, TYPE_NAME, BEER_PIC" + 
			")" + 
			"WHERE RR<4";
	
	String getRecentReviewlistSql = "SELECT * FROM (" + 
			"    SELECT USER_ID, REVIEW_CONTENT, REVIEW_STAR, BEER_KOR_NAME, REVIEW_DATE, BEER_NO," + 
			"    ROW_NUMBER() OVER(ORDER BY REVIEW_DATE DESC) RR" + 
			"    FROM REVIEW" + 
			"    JOIN BEER USING (BEER_NO)" + 
			"	)" + 
			"WHERE RR<6";

	
	public List<BestbeerDto> bestStar();
	public List<BestbeerDto> countReview();
	public List<RecentReviewDto> getRecentReviewList();
	
}