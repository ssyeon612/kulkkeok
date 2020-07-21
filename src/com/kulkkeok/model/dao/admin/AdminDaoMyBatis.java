package com.kulkkeok.model.dao.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.CommentDto;
import com.kulkkeok.model.dto.MoimCommentDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;

import mybatis.SqlMapConfig;

public class AdminDaoMyBatis extends SqlMapConfig implements AdminDao{

	@Override
	public List<UserDto> getAllUserInfo() {
		System.out.println("MyBatis : [ getAllUserInfo ] 실행");
		SqlSession session = null;
		
		List<UserDto> list = new ArrayList<UserDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"getAllUserInfoSql");
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int userDelete(String[] userId) {
		System.out.println("MyBatis : [ userDelete ] 실행");
		int count = 0;
		Map<String,String[]> list = new HashMap<String, String[]>();
		SqlSession session = null;
		
		list.put("idList", userId);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"userDeleteSql",list);
			if(count==userId.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public List<ReviewDto> getUserReviewList(String userId) {
		System.out.println("MyBatis : [ getUserReviewList ] 실행");
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getUserReviewListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<PostDto> getUserPostList(String userId) {
		System.out.println("MyBatis : [ getUserPostList ] 실행");
		List<PostDto> list = new ArrayList<PostDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getUserPostListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<CommentDto> getUserCommenctList(String userId) {
		System.out.println("MyBatis : [ getUserCommenctList ] 실행");
		List<CommentDto> list = new ArrayList<CommentDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getUserCommentListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<MoimDto> getUserMoimList(String userId) {
		System.out.println("MyBatis : [ getUserMoimList ] 실행");
		List<MoimDto> list = new ArrayList<MoimDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getUserMoimListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<MoimCommentDto> getUserMoimCommentList(String userId) {
		System.out.println("MyBatis : [ getUserMoimCommentList ] 실행");
		List<MoimCommentDto> list = new ArrayList<MoimCommentDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getUserMoimCommentListSql",userId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int reviewDelete(int[] noList) {
		System.out.println("MyBatis : [ reviewDelete ] 실행");
		int count = 0;
		Map<String,int[]> list = new HashMap<String, int[]>();
		SqlSession session = null;
		
		list.put("noList", noList);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"deleteUserReviewSql",list);
			if(count==noList.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int postDelete(int[] noList) {
		System.out.println("MyBatis : [ postDelete ] 실행");
		int count = 0;
		Map<String,int[]> list = new HashMap<String, int[]>();
		SqlSession session = null;
		
		list.put("noList", noList);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"deleteUserPostSql",list);
			if(count==noList.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int commnetDelete(int[] noList) {
		System.out.println("MyBatis : [ commnetDelete ] 실행");
		int count = 0;
		Map<String,int[]> list = new HashMap<String, int[]>();
		SqlSession session = null;
		
		list.put("noList", noList);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"deleteUserCommentSql",list);
			if(count==noList.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int moimDelete(int[] noList) {
		System.out.println("MyBatis : [ moimDelete ] 실행");
		int count = 0;
		Map<String,int[]> list = new HashMap<String, int[]>();
		SqlSession session = null;
		
		list.put("noList", noList);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"deleteUserMoimSql",list);
			if(count==noList.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int moimCommentDelete(int[] noList) {
		System.out.println("MyBatis : [ moimCommentDelete ] 실행");
		int count = 0;
		Map<String,int[]> list = new HashMap<String, int[]>();
		SqlSession session = null;
		
		list.put("noList", noList);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"deleteUserMoimCommentSql",list);
			if(count==noList.length) {
				session.commit();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int getLastBeerNo() {
		System.out.println("MyBatis : [ getLastBeerNo ] 실행");
		int lastNo = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			lastNo = session.selectOne(namespace+"getLastBeerNoSql");
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}

		return lastNo;
	}

	@Override
	public int insertBeer(BeerDto dto, int no) {
		System.out.println("MyBatis : [ insertBeer ] 실행");
		
		int res = 0;
		
		SqlSession session = null;
		
		dto.setBeerNo(no);
		
//		dto.setBeerKorName(dto.getBeerKorName().trim());
//		dto.setBeerEngName(dto.getBeerEngName().trim());
//		dto.setOriginCode(dto.getOriginCode().trim());
//		dto.setTypeCode(dto.getTypeCode().trim());
//		dto.setBeerAbv(dto.getBeerAbv().trim());
//		dto.setBeerPic(dto.getBeerPic().trim());
//		dto.setBeerDetail(dto.getBeerDetail().trim());

		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertBeerSql",dto);
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

}
