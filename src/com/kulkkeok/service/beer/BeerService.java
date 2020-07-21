package com.kulkkeok.service.beer;

import java.util.List;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.StarAvgDto;

public interface BeerService {
	
	public List<BeerDto> AllBeerList();
	
	public List<BeerDto> TypeOfBeerListType(String typeCode);
	
	public List<BeerDto> TypeOfBeerListOrigin(String originCode);
	
	public List<BeerDto> TypeOfBeerListName(String beerName);
	
	public BeerDto selectOne(int beerNo);
	
	public StarAvgDto updateStarAvg(int beerNo);
	
	public List<BeerDto> otherOriginBeerList();
	
	public List<BeerDto> otherTypeBeerList();

}
