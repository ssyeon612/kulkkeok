package com.kulkkeok.model.dao.bookmark;

import com.kulkkeok.model.dto.BookMarkDto;

public interface BookMarkDao {
		
	String namespace ="mybatis.mapper.bookmark.";
	String countBookMarkSql = "SELECT COUNT(*) FROM BOOKMARK WHERE BOOKMARK_STATUS='Y'AND BEER_NO=?";	
	String confirmBookmarkBeerSql = "SELECT * FROM BOOKMARK WHERE BOOKMARK_STATUS='Y' AND BEER_NO =? AND USER_ID=?";
	String addBookMarkBeerSql = "INSERT INTO BOOKMARK VALUES(?,?,?)";
	String removeBookmarkBeerSql = "DELETE FROM BOOKMARK WHERE BEER_NO=? AND USER_ID=?";
	
	
	//맥주 좋아요 갯수
	public int countBookMark (int beerNo);

	//북마크가 이미 되었지 확인 (이미 되어있으면 하트가 채워져있음)
	public boolean confirmBookmarkBeer(int beerNo,String userId);
	
	//북마크 추가
	public boolean addBookMarkBeer(BookMarkDto dto);
	
	//북마크 취소
	public boolean removeBookmarkBeer(BookMarkDto dto);

}
