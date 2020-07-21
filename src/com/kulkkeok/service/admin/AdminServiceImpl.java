package com.kulkkeok.service.admin;

import java.util.List;

import com.kulkkeok.model.dao.admin.AdminDao;
import com.kulkkeok.model.dao.admin.AdminDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.CommentDto;
import com.kulkkeok.model.dto.MoimCommentDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

public class AdminServiceImpl implements AdminService{
	private AdminDao dao = null;
	
	
	public AdminServiceImpl() {
		super();
		dao = new AdminDaoMyBatis();
		
	}

	@Override
	public List<UserDto> getAllUserInfo() {
		
		return dao.getAllUserInfo();
	}

	@Override
	public boolean userDelete(String[] userId) {
		int res = dao.userDelete(userId);
		boolean is = false;
		
		if(res == userId.length) {
			is = true;
		}
		
		return is;
	}

	@Override
	public List<ReviewDto> getUserReviewList(String userId) {
		
		return dao.getUserReviewList(userId);
	}

	@Override
	public List<PostDto> getUserPostList(String userId) {
		
		return dao.getUserPostList(userId);
	}

	@Override
	public List<CommentDto> getUserCommentList(String userId) {
		return dao.getUserCommenctList(userId);
	}

	@Override
	public List<MoimDto> getUserMoimList(String userId) {
		// TODO Auto-generated method stub
		return dao.getUserMoimList(userId);
	}

	@Override
	public List<MoimCommentDto> getUserMoimCommentList(String userId) {
		// TODO Auto-generated method stub
		return dao.getUserMoimCommentList(userId);
	}
	

	@Override
	public boolean reviewDelete(String[] noList) {
		int[] no = new int[noList.length];
		for(int i=0;i<noList.length;i++) {
			no[i] = Integer.parseInt(noList[i]);
			
		}
		
		int res = dao.reviewDelete(no);
		boolean is = false;
		if(res == no.length) {
			is = true;
		}
		return is;
	}

	@Override
	public boolean postDelete(String[] noList) {
		int[] no = new int[noList.length];
		
		for(int i=0;i<noList.length;i++) {
			no[i] = Integer.parseInt(noList[i]);
			
		}
		
		int res = dao.postDelete(no);
		boolean is = false;
		if(res == no.length) {
			is = true;
		}
		return is;
	}

	@Override
	public boolean commentDelete(String[] noList) {
		int[] no = new int[noList.length];
		for(int i=0;i<noList.length;i++) {
			no[i] = Integer.parseInt(noList[i]);
			
		}
		
		int res = dao.commnetDelete(no);
		boolean is = false;
		if(res == no.length) {
			is = true;
		}
		return is;
	}

	@Override
	public boolean moimDelete(String[] noList) {
		int[] no = new int[noList.length];
		for(int i=0;i<noList.length;i++) {
			no[i] = Integer.parseInt(noList[i]);
			
		}
		
		int res = dao.moimDelete(no);
		boolean is = false;
		if(res == no.length) {
			is = true;
		}
		return is;
	}

	@Override
	public boolean moimCommentDelete(String[] noList) {
		int[] no = new int[noList.length];
		for(int i=0;i<noList.length;i++) {
			no[i] = Integer.parseInt(noList[i]);
			
		}
		
		int res = dao.moimCommentDelete(no);
		
		boolean is = false;
		if(res == no.length) {
			is = true;
		}
		return is;
	}

	@Override
	public int getLastBeerNo() {
		
		
		return dao.getLastBeerNo();
	}

	@Override
	public int insertBeer(String beerKorName, String beerEngName, String beerOrigin, String beerType, String beerAbv,
			String beerDetail, String beerPic,int no) {
		
		BeerDto dto = new BeerDto();
		
		dto.setBeerKorName(beerKorName.trim());
		dto.setBeerEngName(beerEngName.trim());
		dto.setOriginCode(beerOrigin.trim());
		dto.setTypeCode(beerType.trim());
		dto.setBeerAbv(beerAbv.trim());
		dto.setBeerDetail(beerDetail.trim());
		dto.setBeerPic(beerPic.trim());
		

		return dao.insertBeer(dto,no);
	}


}
