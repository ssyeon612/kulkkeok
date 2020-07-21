package com.kulkkeok.service.worldcup;

import java.util.Map;

import com.kulkkeok.model.dto.BeerDto;

public interface WorldCupService {
	void getWorldCupGame(int gang); // 게임 첫 시작
	void getBeerList(); // beerList설정
	BeerDto getBeerDto(int index); // beerDto 가져오기
	int getGang();
	String getBeerVs(int index);
	void setWinList(String winList,int gang);
	BeerDto getWinBeer(int win);
	
	Map<BeerDto,Integer> getRanking();
}
