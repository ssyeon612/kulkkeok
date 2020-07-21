package com.kulkkeok.service.mypage;

import java.util.List;

import com.kulkkeok.model.dao.mypage.MypageDao;
import com.kulkkeok.model.dao.mypage.MypageDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

public class MypageServiceImpl implements MypageService{
	private MypageDao dao = null;
	
	
	public MypageServiceImpl() {
		super();
		dao = new MypageDaoMyBatis();
	}




	@Override
	public boolean updateUser(String id, String name, String password, String tel, String email) {
		
		UserDto user = new UserDto();
		user.setUserId(id);
		user.setUserName(name);
		user.setUserPw(password);
		user.setUserPhone(tel);
		user.setUserEmail(email);
		
		boolean res = dao.update(user);
		
		return res;
	}




	@Override
	public List<ReviewDto> getMyReviewList(String userId) {

		return dao.getMyReviewList(userId);
	}




	@Override
	public List<BeerDto> getBeerList(List<ReviewDto> reviewList) {
		int[] beerNo = new int[reviewList.size()];
		int i=0;
		
		for(ReviewDto list:reviewList) {
			beerNo[i] = list.getBeerNo();
			i++;
		}
		
		return dao.getBeerList(beerNo);
	}


	@Override
	public boolean deleteUser(String userId, String userPw) {
		
		return dao.delete(userId, userPw);
	}




	@Override
	public List<BeerDto> getMyBookmarkList(String userId) {
		
		return dao.getMyBeerList(userId);
	}




	@Override
	public List<MoimDto> getMyMoimList(String userId) {
		// TODO Auto-generated method stub
		return dao.getMyMoimList(userId);
	}


}
