package com.kulkkeok.service.mypage;

import java.util.List;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.ReviewDto;

public interface MypageService {
	boolean updateUser(String id,String name,String password, String tel,String email);
	List<ReviewDto> getMyReviewList(String userId);
	List<BeerDto> getBeerList(List<ReviewDto> reviewList);
	List<BeerDto> getMyBookmarkList(String userId);
	boolean deleteUser(String userId,String userPw);
	List<MoimDto> getMyMoimList(String userId);
}
