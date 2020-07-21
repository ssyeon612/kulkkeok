package com.kulkkeok.model.dao.admin;

import java.util.List;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.CommentDto;
import com.kulkkeok.model.dto.MoimCommentDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

public interface AdminDao {
	
	String namespace = "mybatis.mapper.admin.";
	//모든 유저 정보
	String getAllUserInfoSql = " SELECT *FROM USER_TB WHERE GRADE_CODE='USER' ";
	//내 리뷰
	String getUserReviewListSql = "SELECT * FROM REVIEW WHERE USER_ID=?";
	//내 게시글
	String getUserPostListSql = " SELECT *FROM POST WHERE BOARD_CODE='FREE' AND USER_ID=? ";
	//내 댓글
	String getUserCommentListSql = "SELECT *FROM COMMENT_TB WHERE BOARD_CODE='FREE' AND USER_ID =?";
	//내 모임
	String getUserMoimListSql = " SELECT *FROM MOIM_BOARD JOIN CATEGORY USING (CATEGORY_CODE) WHERE USER_ID=? ";
	//내 모임댓글
	String getUserMoimCommentListSql = "SELECT * FROM MOIM_COMMENT WHERE USER_ID=?";
	
	// 유저 탈퇴
	String userDeleteSql=" DELETE FROM USER_TB WHERE USER_ID=?";
	//리뷰삭제
	String deleteUserReviewSql=" DELETE FROM REVIEW WHERE REVIEW_NO=? ";
	
	//게시글 삭제
	String deleteUserPostSql=" DELETE FROM POST WHERE POST_NO=? AND BOARD_CODE='FREE' ";
	//댓글 삭제
	String deleteUserCommentSql=" DELETE FROM COMMENT_TB WHERE COMMENT_NO=? AND BOARD_CODE='FREE' ";
	
	// 모임 삭제
	String deleteUserMoimSql=" DELETE FROM MOIM_BOARD WHERE MOIM_NO=? ";
	
	// 모임댓글 삭제
	String deleteUserMoimCommentSql = " DELETE FROM MOIM_COMMENT WHERE MM_NO=? ";
	
	//맥주 추가
	// [1] 가장 마지막 맥주번호
	String getLastBeerNoSql = " SELECT BEER_NO " + 
			" FROM (SELECT RANK() OVER(ORDER BY BEER_NO DESC) RN, BEER_NO FROM BEER) " + 
			" WHERE RN = 1 ";
	
	// [2] 맥주 추가
	String insertBeerSql = " INSERT INTO BEER VALUES(?,?,?,?,?,?,?,?) ";

	List<UserDto> getAllUserInfo();	
	int userDelete(String[] userId);
	List<ReviewDto> getUserReviewList(String userId);
	List<PostDto> getUserPostList(String userId);
	List<CommentDto> getUserCommenctList(String userId);
	List<MoimDto> getUserMoimList(String userId);
	List<MoimCommentDto> getUserMoimCommentList(String userId);
	int reviewDelete(int[] noList);
	int postDelete(int[] noList);
	int commnetDelete(int[] noList);
	int moimDelete(int[] noList);
	int moimCommentDelete(int[] noList);
	int getLastBeerNo();
	int insertBeer(BeerDto dto,int no);
	
}
