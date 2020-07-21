package com.kulkkeok.service.bookmark;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.BookMarkDto;

public interface BookMarkService {

	public int countBookMark(int beerNo);
	
	public boolean confirmBookmarkBeer(int beerNo,String userId);
	
	public boolean addBookMarkBeer(BookMarkDto dto);
	
	public boolean removeBookmarkBeer(BookMarkDto dto);
	
}
