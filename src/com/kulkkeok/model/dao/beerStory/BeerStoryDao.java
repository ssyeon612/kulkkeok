package com.kulkkeok.model.dao.beerStory;

import java.util.List;

import com.kulkkeok.model.dto.BeerStoryDto;

public interface BeerStoryDao {
	String namespace = "mybatis.mapper.beerstory.";
	
	String InsertOneSql = "INSERT INTO BEER_STORY VALUES (STORYSQ.NEXTVAL, ?,?,?)";
	String UpdateOneSql = "UPDATE BEER_STORY SET STORY_NAME=?, STORY_LINK=? WHERE STORY_NO=?";
	String DeleteOneSql = "DELETE FROM BEER_STORY WHERE STORY_NO = ?";
	String GetAllListSql = "SELECT * FROM BEER_STORY ORDER BY STORY_NO DESC";
	String SelectOneSql = "SELECT * FROM BEER_STORY WHERE STORY_NO=?";
	
	public int insertOne(BeerStoryDto dto);
	public int updateOne(BeerStoryDto dto);
	public int deleteOne(int storyNo);
	public List<BeerStoryDto> getAllList();
	public BeerStoryDto selectOne(int storyNo); //수정할 때 selectOne
	
}
