package com.kulkkeok.model.dao.comment;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.CommentDto;

import mybatis.SqlMapConfig;

public class CommentDaoMyBatis extends SqlMapConfig implements CommentDao{

	@Override
	public boolean writeComment(String boardCode, CommentDto comment) {
		// TODO Auto-generated method stub
		System.out.println("MyBatis : [ writeComment ] 실행");
		SqlSession session = null;

		String writeCommentSql = (boardCode.equals("FREE")==true)?"writeFreeCommentSql":"writeNoticeCommentSql";
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("postNo", comment.getPostNo());
		param.put("boardCode", boardCode);
		param.put("commentContent", comment.getCommentContent());
		param.put("userId", comment.getUserId());
		
		int res=0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+writeCommentSql,param);
			
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public List<CommentDto> commentList(String boardCode, int postNo) {
		System.out.println("MyBatis : [ commentList ] 실행");
		
		SqlSession session = null;
		List<CommentDto> clist = new ArrayList<CommentDto>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("boardCode", boardCode);
		param.put("postNo", postNo);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			clist = session.selectList(namespace+"commentListSql",param);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return clist;
	}

	@Override
	public boolean updateComment(String boardCode, CommentDto comment) {
		System.out.println("MyBatis : [ updateComment ] 실행");
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("commentContent", comment.getCommentContent());
		param.put("commentNo", comment.getCommentNo());
		param.put("boardCode", boardCode);
		param.put("postNo", comment.getPostNo());
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateCommentSql",param);
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public boolean deleteComment(String boardCode, CommentDto comment) {
		
		System.out.println("MyBatis : [ deleteComment ] 실행");
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("commentNo", comment.getCommentNo());
		param.put("boardCode", boardCode);
		param.put("postNo", comment.getPostNo());

		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteCommentSql",param);
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public CommentDto selectParentComment(String boardCode, int postNo, int commentNo) {
		System.out.println("MyBatis : [ selectParentComment ] 실행");
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("postNo", postNo);
		param.put("boardCode", boardCode);
		param.put("commentNo", commentNo);
		
		CommentDto parentCommentDto = new CommentDto();
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			parentCommentDto = session.selectOne(namespace+"selectParentCommentSql",param);
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return parentCommentDto;
	}

	@Override
	public int lastGroupsq(String boardCode, int postNo, int parentgroupNo) {
		System.out.println("MyBatis : [ lastGroupsq ] 실행");
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("postNo", postNo);
		param.put("boardCode", boardCode);
		param.put("groupNo", parentgroupNo);
		
		int lastgroupsq = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			lastgroupsq = session.selectOne(namespace+"lastGroupsqSql",param);
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return lastgroupsq;
	}

	@Override
	public boolean replyComment(String boardCode, String parentId, int parentgroupno, int lastgroupsq,
			CommentDto comment) {
		System.out.println("MyBatis : [ replyComment ] 실행");
		String replyCommentSql = (boardCode.equals("FREE")==true)?"writeFreereplyCommentSql":"writeNoticereplyCommentSql";

		SqlSession session = null;
		
		int res = 0;
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("postNo", comment.getPostNo());
		param.put("boardCode", boardCode);
		param.put("groupNo",  parentgroupno);
		param.put("groupSq",  (lastgroupsq+1));
		param.put("replyId",  parentId);
		param.put("commentContent",  comment.getCommentContent());
		param.put("userId", comment.getUserId());
		


		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+replyCommentSql,param);
			
			if(res>0) {session.commit();}
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public Map<Integer, Integer> getCommentCount(String boardCode, int startRow, int endRow) {
		System.out.println("MyBatis : [ getCommentCount ] 실행");
		SqlSession session = null;
		
		List<HashMap<String, Object>> commentCountList = new ArrayList<HashMap<String, Object>>();
		
		HashMap<Integer, Integer> commentCountMap = new HashMap<Integer, Integer>();
		
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		
		
		param.put("boardCode", boardCode);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			commentCountList = session.selectList(namespace+"getCommentCountSql",param);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		//System.out.println(commentCountList);
		if(!commentCountList.isEmpty()) {
			for(HashMap<String, Object> map : commentCountList) {
				
				commentCountMap.put(((BigDecimal) map.get("POST_NO")).intValue(), ((BigDecimal) map.get("COUNT")).intValue());
				
				//System.out.println("map:"+map);
				//System.out.println("key value postno : "+ ((BigDecimal) map.get("POST_NO")).intValue());
				//System.out.println("key value count : "+ ((BigDecimal) map.get("COUNT")).intValue());
				
				//commentCountMap.put((Integer) map.get("POST_NO"), (Integer) map.get("COUNT"));
			}
		}	
		//System.out.println("commentCountMap"+commentCountMap);
		
		return commentCountMap;
	}

}
