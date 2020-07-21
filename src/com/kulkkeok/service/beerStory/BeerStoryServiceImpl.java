package com.kulkkeok.service.beerStory;

import java.util.List;

import com.kulkkeok.model.dao.beerStory.BeerStoryDao;
import com.kulkkeok.model.dao.beerStory.BeerStoryDaoMyBatis;
import com.kulkkeok.model.dto.BeerStoryDto;

public class BeerStoryServiceImpl implements BeerStoryService{

	BeerStoryDao dao = new BeerStoryDaoMyBatis();
	
	@Override
	public int insertOne(String storyName, String storyLink, String storyImg) {
		BeerStoryDto dto = new BeerStoryDto();
		
		dto.setStoryName(storyName);
		dto.setStoryLink(storyLink);
		dto.setStoryImg(storyImg);
		
//		System.out.println(dto.getStoryName() + ", " + dto.getStoryLink() + ", " + dto.getStoryImg());
		//sdf, sdf, story22.jpg
		
		return dao.insertOne(dto);
	}
	
	@Override
	public int updateOne(int storyNo, String storyName, String storyLink) {
		BeerStoryDto dto = new BeerStoryDto(storyNo, storyName, storyLink);
		int res = dao.updateOne(dto);
		
		return res;
	}


	@Override
	public int deleteOne(int seq) {
		return dao.deleteOne(seq);
	}

	@Override
	public List<BeerStoryDto> getAllList() {
		return dao.getAllList();
	}

	@Override
	public BeerStoryDto selectOne(int storyNo) {
		return dao.selectOne(storyNo);
	}

}
