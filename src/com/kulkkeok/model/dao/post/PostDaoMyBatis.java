package com.kulkkeok.model.dao.post;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.PostDto;

import mybatis.SqlMapConfig;

public class PostDaoMyBatis extends SqlMapConfig implements PostDao{

	@Override
	public int getTotalPost(String boardCode) {
		System.out.println("MyBatis : [ getTotalPost ] 실행");
		int totalPost = 0;
		
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			totalPost = session.selectOne(namespace+"getTotalPostSql",boardCode);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}finally{
		session.close();
		}
		
		return totalPost;
	}

	@Override
	public List<PostDto> getPostList(String boardCode, int startRow, int endRow) {
		
		System.out.println("MyBatis : [ getPostList ] 실행");
		List<PostDto> list = new ArrayList<PostDto>();
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("boardCode", boardCode);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getPostListSql",param);
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
		session.close();
		}
		
		return list;

	}

	@Override
	public boolean writePost(String boardCode, PostDto post) {
		
		System.out.println("MyBatis : [ writePost ] 실행");
		
		SqlSession session = null;
		
		int res = 0;
		String insertType = (boardCode.equals("FREE")==true)?"writeFreePostSql":"writeNoticePostSql";
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			res = session.insert(namespace+insertType,post);
			
			
			if(res>0) {session.commit();}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	
	
	@Override
	public PostDto detailPost(String boardCode, int postNo) {
		// TODO Auto-generated method stub
		System.out.println("MyBatis : [ detailPost ] 실행");
		
		SqlSession session = null;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardCode", boardCode);
		param.put("postNo", postNo);
		
		PostDto post = null;
			
		try {
			session = getSqlSessionFactory().openSession(true);		
			post = session.selectOne(namespace+"detailPostSql",param);
				
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
			
		return post;
	}
	
	

	@Override
	public boolean updateAnswer(String boardCode, int parentgroupno, int parentgroupsq) {
		// TODO Auto-generated method stub
		System.out.println("MyBatis : [ updateAnswer ] 실행");
		SqlSession session = null;
		int res = 0;
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardCode", boardCode);
		param.put("parentgroupno", (parentgroupno));
		param.put("parentgroupsq", (parentgroupsq));
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateAnswerSql",param);
			
			if(res>0) {session.commit();}
	
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean writeAnswer(String boardCode, PostDto post) {
		System.out.println("MyBatis : [ writeAnswer ] 실행");
		String writeAnswerSql = (boardCode.equals("FREE")==true)?"writeFreeAnswerSql":"writeNoticeAnswerSql";
		SqlSession session = null;
		
		int res = 0;
		
		post.setGroupSq(post.getGroupSq()+1);
		post.setTitleTab(post.getTitleTab()+1);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+writeAnswerSql,post);
			
			if(res>0) {session.commit();}
	
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean deletePost(String boardCode, int postNo) {
		System.out.println("MyBatis : [ deletePost ] 실행");
		
		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("boardCode", boardCode);
		param.put("postNo", postNo);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deletePostSql",param);
			
			if(res>0) {session.commit();}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean updatePost(String boardCode, PostDto post) {
		System.out.println("MyBatis : [ updatePost ] 실행");
		
		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("boardCode", boardCode);
		param.put("postTitle", post.getPostTitle());
		param.put("postContent",post.getPostContent());
		param.put("postNo", post.getPostNo());
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"updatePostSql",param);
			
			if(res>0) {session.commit();}

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean countViews(String boardCode, int postNo) {
		System.out.println("MyBatis : [ countViews ] 실행");
		
		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("boardCode", boardCode);
		param.put("postNo", postNo);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"countViewsSql",param);
			
			if(res>0) {session.commit();}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public List<PostDto> getBestPostList(String boardCode) {
		System.out.println("MyBatis : [ getBestPostList ] 실행");
		SqlSession session = null;
		List<PostDto> list = new ArrayList<PostDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"getbestPostListSql",boardCode);
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
		session.close();
		}
		
		return list;
	}

}
