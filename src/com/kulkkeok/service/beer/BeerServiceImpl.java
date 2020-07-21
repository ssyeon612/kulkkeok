package com.kulkkeok.service.beer;

import java.util.List;

import com.kulkkeok.model.dao.beer.BeerDao;
import com.kulkkeok.model.dao.beer.BeerDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.StarAvgDto;

public class BeerServiceImpl implements BeerService {
	
	private BeerDao dao = new BeerDaoMyBatis();
	//private StarAvgDao dao_s = new StarAvgDao();

	@Override
	public List<BeerDto> AllBeerList() {
		return dao.AllBeerList();
	}

	@Override
	public List<BeerDto> TypeOfBeerListType(String typeCode) {
		return dao.TypeOfBeerListType(typeCode);
	}

	@Override
	public List<BeerDto> TypeOfBeerListOrigin(String originCode) {
		return dao.TypeOfBeerListOrigin(originCode);
	}

	@Override
	public BeerDto selectOne(int beerNo) {
		return dao.selectOne(beerNo);
	}

	@Override
	public List<BeerDto> TypeOfBeerListName(String beerName) {
		return dao.TypeOfBeerListName(beerName);
	}

	@Override
	public StarAvgDto updateStarAvg(int beerNo) {
		return dao.updateStarAvg(beerNo);
	}

	@Override
	public List<BeerDto> otherOriginBeerList() {
		return dao.otherOriginBeerList();
	}

	@Override
	public List<BeerDto> otherTypeBeerList() {
		return dao.otherTypeBeerList();
	}


}
