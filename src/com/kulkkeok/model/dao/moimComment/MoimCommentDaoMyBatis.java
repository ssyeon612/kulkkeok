package com.kulkkeok.model.dao.moimComment;



import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.MoimCommentDto;

import mybatis.SqlMapConfig;

public class MoimCommentDaoMyBatis extends SqlMapConfig implements MoimCommentDao{

	@Override
	public boolean writeMoimComment(MoimCommentDto dto) {
		System.out.println("MyBatis : [ writeMoimComment ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"writeMoimCommentSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)? true:false;
	}

	//댓글 가져오기
	@Override
	public List<MoimCommentDto> commentList(int moimNo) {
		System.out.println("MyBatis : [ commentList ] 실행");
		SqlSession session = null;
		
		List<MoimCommentDto> list = new ArrayList<MoimCommentDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"commentListSql",moimNo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public boolean updateComment(MoimCommentDto dto) {
		System.out.println("MyBatis : [ updateComment ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateCommentSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return (res>0)?true:false;
	}

	@Override
	public boolean deleteComment(MoimCommentDto dto) {
		System.out.println("MyBatis : [ deleteComment ] 실행");
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteCommentSql",dto);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return (res>0)?true:false;
	}

	@Override
	public MoimCommentDto selectParentCommect(int moimNo, int mmNo) {
		System.out.println("MyBatis : [ selectParentCommect ] 실행");
		SqlSession session = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("moimNo", moimNo);
		param.put("mmNo", mmNo);
		
		MoimCommentDto parentComment = new MoimCommentDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			parentComment = session.selectOne(namespace+"selectParentCommentSql",param);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
	
		return parentComment;
	}

	@Override
	public int lastGroupsq(int moimNo, int parentgroupNo) {
		System.out.println("MyBatis : [ lastGroupsq ] 실행");
		SqlSession session = null;
		int res = 0;
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("moimNo", moimNo);
		param.put("parentgroupNo", parentgroupNo);

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"lastGroupsqSql",param);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public boolean replyComment(String parentId, int parentgroupno, int lastgroupsq, MoimCommentDto comment) {
		System.out.println("MyBatis : [ replyComment ] 실행");
		SqlSession session = null;
		int res = 0;
	
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("mmComment", comment.getMmContent());
		param.put("parentgroupNo", parentgroupno);
		param.put("lastGroupSq", (lastgroupsq+1));
		param.put("parentId", parentId);
		param.put("userId", comment.getUserId());
		param.put("moimNo", comment.getMoimNo());
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"writeMoimReplyCommentSql",param);
			if(res>0) {session.commit();}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}

		return (res>0)?true:false;
	}

	@Override
	public Map<Integer, Integer> getCommentCount(int startRow, int endRow) {
		System.out.println("MyBatis : [ getCommentCount ] 실행");
		SqlSession session = null;
		//System.out.println(startRow + ", " + endRow);
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
		List<HashMap<String, Object>> resultCountMap = new ArrayList<HashMap<String,Object>>();
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			resultCountMap = session.selectList(namespace+"getCommentCountSql",param);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(HashMap<String, Object> map : resultCountMap) {
			int moimNo = ((BigDecimal)map.get("MOIM_NO")).intValue();
			int count = ((BigDecimal)map.get("COUNT")).intValue();
			countMap.put(moimNo, count);
		}
		
		
		return countMap;
	}
}
