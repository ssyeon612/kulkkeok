package com.kulkkeok.service.beerStory;

import java.util.List;

import com.kulkkeok.model.dto.BeerStoryDto;

public interface BeerStoryService {

	public int insertOne(String storyName, String storyLink, String storyImg);
	public int updateOne(int storyNo, String storyName, String storyLink);
	public int deleteOne(int seq);
	public List<BeerStoryDto> getAllList();
	public BeerStoryDto selectOne(int storyNo); //수정할 때 selectOne

}
