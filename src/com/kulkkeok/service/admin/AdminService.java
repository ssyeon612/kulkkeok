package com.kulkkeok.service.admin;

import java.util.List;

import com.kulkkeok.model.dto.CommentDto;
import com.kulkkeok.model.dto.MoimCommentDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

public interface AdminService {
	List<UserDto> getAllUserInfo();
	boolean userDelete(String[] userId);
	List<ReviewDto> getUserReviewList(String userId);
	List<PostDto> getUserPostList(String userId);
	List<CommentDto> getUserCommentList(String userId);
	List<MoimDto> getUserMoimList(String userId);
	List<MoimCommentDto> getUserMoimCommentList(String userId);
	boolean reviewDelete(String[] noList);
	boolean postDelete(String[] noList);
	boolean commentDelete(String[] noList);
	boolean moimDelete(String[] noList);
	boolean moimCommentDelete(String[] noList);
	int getLastBeerNo();
	int insertBeer(String beerKorName, String beerEngName, String beerOrigin, String beerType, String beerAbv,
			String beerDetail, String beerPic,int no );
	
}

