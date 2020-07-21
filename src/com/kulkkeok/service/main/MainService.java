package com.kulkkeok.service.main;

import java.util.List;

import com.kulkkeok.model.dto.BestbeerDto;
import com.kulkkeok.model.dto.RecentReviewDto;

public interface MainService {
	public List<BestbeerDto> bestStar();
	public List<BestbeerDto> countReview();
	public List<RecentReviewDto> getRecentReviewList();


}
