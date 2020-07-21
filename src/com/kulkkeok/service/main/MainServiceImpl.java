package com.kulkkeok.service.main;

import java.util.List;

import com.kulkkeok.model.dao.main.MainDao;
import com.kulkkeok.model.dao.main.MainDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.BestbeerDto;
import com.kulkkeok.model.dto.RecentReviewDto;

public class MainServiceImpl implements MainService{
	MainDao dao = new MainDaoMyBatis();


	@Override
	public List<RecentReviewDto> getRecentReviewList() {
		return dao.getRecentReviewList();
	}


	@Override
	public List<BestbeerDto> bestStar() {
		return dao.bestStar();
	}


	@Override
	public List<BestbeerDto> countReview() {
		return dao.countReview();
	}

}
