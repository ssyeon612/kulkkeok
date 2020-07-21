package com.kulkkeok.model.dao.beer;

import java.util.List;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.StarAvgDto;

public interface BeerDao {
	
	//String allBeerListSql = "SELECT * FROM BEER ORDER BY BEER_ENG_NAME";
	String namespace = "mybatis.mapper.beer.";
	String allBeerListSql = "SELECT * \n" + 
							"FROM BEER\n" + 
							"JOIN ORIGIN USING(ORIGIN_CODE)\n" + 
							"JOIN TYPE USING(TYPE_CODE) ORDER BY BEER_ENG_NAME";
	
	String typeOfBeerListTypeSql =  "SELECT *\n" + 
									"FROM BEER \n" + 
									"JOIN TYPE USING(TYPE_CODE)\n" + 
									"WHERE TYPE_NAME LIKE ? ORDER BY BEER_ENG_NAME";
	
	String typeOfBeerListOriginSql = "SELECT * FROM BEER WHERE ORIGIN_CODE=? ORDER BY BEER_ENG_NAME";
	
	String typeOfBeerListNameSql = "SELECT * FROM BEER WHERE BEER_KOR_NAME LIKE ? OR UPPER(BEER_ENG_NAME) LIKE UPPER(?) ORDER BY BEER_ENG_NAME";
	
	String selectOneSql = "SELECT * \n" + 
							"FROM BEER\n" + 
							"JOIN ORIGIN USING(ORIGIN_CODE)\n" + 
							"JOIN TYPE USING(TYPE_CODE)\n" + 
							"WHERE BEER_NO=?";
	
	String otherOriginBeerListSql = "SELECT * \n" + 
									"FROM BEER\n" + 
									"WHERE ORIGIN_CODE NOT IN('KOREA','AMERICA','CHINA', 'BELGIUM', 'ENGLAND','GERMANY','CZECH') ORDER BY BEER_ENG_NAME";
	
	String otherTypeBeerListSql = "SELECT *\n" + 
									"FROM BEER\n" + 
									"JOIN TYPE USING(TYPE_CODE)\n" + 
									"WHERE TYPE_NAME NOT LIKE '%라이트 라거%' AND \n" + 
									"TYPE_NAME NOT LIKE '%도펠복%' AND\n" + 
									"TYPE_NAME NOT LIKE '%페일 라거%' AND\n" + 
									"TYPE_NAME NOT LIKE '%필스너' AND\n" + 
									"TYPE_NAME NOT LIKE '%람빅%' AND\n" + 
									"TYPE_NAME NOT LIKE '%밀맥주%' AND\n" + 
									"TYPE_NAME NOT LIKE '%바이젠복%' AND\n" + 
									"TYPE_NAME NOT LIKE '%벨지안 에일%' AND\n" + 
									"TYPE_NAME NOT LIKE '%인디아 페일 에일%' AND\n" + 
									"TYPE_NAME NOT LIKE '%스타우트%' AND\n" + 
									"TYPE_NAME NOT LIKE '%쾰쉬%' ORDER BY BEER_ENG_NAME";
	
	//모든 맥주 리스트 
	public List<BeerDto> AllBeerList();
	
	//맥주 종류 검색시 해당 맥주 가져오기
	public List<BeerDto> TypeOfBeerListType(String typeCode);
	
	//맥주 나라 검색시 해당 맥주 가져오기
	public List<BeerDto> TypeOfBeerListOrigin(String originCode);
	
	//맥주 이름 검색시 해당 맥주 가져오기
	public List<BeerDto> TypeOfBeerListName(String beerName);
	
	//맥주 이름 선택시 해당 맥주 정보 가져오기
	public BeerDto selectOne(int beerNo);
	
	//맥주 나라 검색시 해당 맥주 가져오기 (옵션외의 다른 맥주들)
	public List<BeerDto> otherOriginBeerList();
	
	//맥주 종류 검색시 해당 맥주 가져오기 (옵션외의 다른 맥주들)
	public List<BeerDto> otherTypeBeerList();
	
	//별점 가져오기
	public StarAvgDto updateStarAvg(int beerNo);
	
}