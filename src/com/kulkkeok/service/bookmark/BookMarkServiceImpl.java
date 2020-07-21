package com.kulkkeok.service.bookmark;

import com.kulkkeok.model.dao.bookmark.BookMarkDao;
import com.kulkkeok.model.dao.bookmark.BookMarkDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.BookMarkDto;

public class BookMarkServiceImpl implements BookMarkService{

	BookMarkDao dao = new BookMarkDaoMyBatis();

	@Override
	public int countBookMark(int beerNo) {
		return dao.countBookMark(beerNo);
	}

	@Override
	public boolean confirmBookmarkBeer(int beerNo, String userId) {
		return dao.confirmBookmarkBeer(beerNo, userId);
	}

	@Override
	public boolean addBookMarkBeer(BookMarkDto dto) {
		return dao.addBookMarkBeer(dto);
	}
	
	@Override
	public boolean removeBookmarkBeer(BookMarkDto dto) {
		return dao.removeBookmarkBeer(dto);
	}


}
