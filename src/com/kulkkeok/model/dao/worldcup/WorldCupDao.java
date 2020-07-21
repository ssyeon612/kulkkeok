package com.kulkkeok.model.dao.worldcup;

import java.util.List;
import java.util.Map;

import com.kulkkeok.model.dto.BeerDto;

public interface WorldCupDao {
	
	String namespace="mybatis.mapper.worldcup.";
	String getBeerListSql = " SELECT *FROM BEER WHERE BEER_NO = ? ";
	String confirmWorldcupBeerSql = " SELECT *FROM WORLDCUP_BEER WHERE BEER_NO = ? ";
	String insertWorldcupBeerSql = " INSERT INTO WORLDCUP_BEER VALUES(?,1) ";
	String countWorldcupBeerSql = " UPDATE WORLDCUP_BEER SET CUPCOUNT = CUPCOUNT+1 WHERE BEER_NO = ?";
	
	String getWorldcupRankingSql = " SELECT BEER_NO,CUPCOUNT " + 
			" FROM ( SELECT ROWNUM RN, TEMP.* " + 
			" FROM (SELECT * " + 
			" FROM WORLDCUP_BEER " + 
			" ORDER BY CUPCOUNT DESC)TEMP " + 
			"  ORDER BY RN ASC ) "+
			" WHERE RN BETWEEN 1 AND 10 ";
	
	
	List<BeerDto> getBeerList(int[] beerNoList);
	BeerDto getBeer(int win);
	boolean confirmWorldcupBeer(int beerNo);
	boolean insertWorldcupBeer(int beerNo);
	boolean countWorldcupBeer(int beerNo);
	Map<Integer,Integer> getWorldcupRanking();
	Map<BeerDto,Integer> getRanking(Map<Integer,Integer> map);
}
