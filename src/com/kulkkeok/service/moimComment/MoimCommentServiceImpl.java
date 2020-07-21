package com.kulkkeok.service.moimComment;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kulkkeok.model.dao.moimComment.MoimCommentDao;
import com.kulkkeok.model.dao.moimComment.MoimCommentDaoMyBatis;
import com.kulkkeok.model.dto.MoimCommentDto;


public class MoimCommentServiceImpl implements MoimCommentService{

	MoimCommentDao dao = new MoimCommentDaoMyBatis();

	@Override
	public boolean writeMoimComment(int moimNo, String userId, String mmContent) {
		MoimCommentDto comment = new MoimCommentDto();
		
		comment.setMoimNo(moimNo);
		comment.setMmContent(mmContent);
		comment.setUserId(userId);
		
		boolean res = dao.writeMoimComment(comment);
		
		return res;
	}

	@Override
	public String commentList(int moimNo) {
		//배열 저장
		//객체(주로 String)을 Json객체로 바꿔주거나 Json객체를 새로 만드는 역할을 합니다.
		JSONObject totalObject = new JSONObject(); // 배열을 저장할 totalObject
		
		//commentInfo JSON 객체 저장
		//json들이 들어있는 Array(json 이외의 다른 데이터도 들어갈 수 있음)
		JSONArray commentArray = new JSONArray(); // commentInfo JSON 객체를 저장할 commentArray
		
		List<MoimCommentDto> list = dao.commentList(moimNo);
		
		
		try {
			for(MoimCommentDto dto : list) {
				//댓글 하나가 저장될 JSON 객체
				JSONObject commentInfo = new JSONObject();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String toStringDate = transFormat.format(dto.getMmDate());
				
				commentInfo.put("mmNo", Integer.toString(dto.getMmNo()));
				commentInfo.put("moimNo", Integer.toString(dto.getMoimNo()));
				commentInfo.put("groupNo", Integer.toString(dto.getGroupNo()));
				commentInfo.put("groupSq", Integer.toString(dto.getGroupSq()));
				commentInfo.put("replyId", dto.getReplyId());
				commentInfo.put("mmDate", toStringDate);
				commentInfo.put("mmContent", dto.getMmContent());
				commentInfo.put("userId", dto.getUserId());
				
				commentArray.add(commentInfo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		totalObject.put("comments", commentArray);
		
		String jsonInfo = totalObject.toJSONString();
		
		System.out.println(jsonInfo);
		return jsonInfo;
	}

	@Override
	public boolean updateComment(int moimNo, int mmNo, String mmContent) {
		MoimCommentDto comment = new MoimCommentDto();
		
		comment.setMoimNo(moimNo);
		comment.setMmNo(mmNo);
		comment.setMmContent(mmContent);
		
		return dao.updateComment(comment);
	}

	@Override
	public boolean deleteComment(int moimNo, int mmNo, String mmContent) {
		MoimCommentDto comment = new MoimCommentDto();
		
		comment.setMoimNo(moimNo);
		comment.setMmNo(mmNo);
		
		return dao.deleteComment(comment);
	}

	@Override
	public MoimCommentDto selectParentCommect(int moimNo, int mmNo) {
		return dao.selectParentCommect(moimNo, mmNo);
	}

	@Override
	public int lastGroupsq(int moimNo, int parentgroupNo) {
		return dao.lastGroupsq(moimNo, parentgroupNo);
	}

	@Override
	public boolean replyComment(int moimNo, int mmNo, String mmContent, String userId) {
		MoimCommentDto parentComment = dao.selectParentCommect(moimNo, mmNo);
		
		int lastgroupsq = dao.lastGroupsq(moimNo, parentComment.getGroupNo());
		
		MoimCommentDto comment = new MoimCommentDto();
		comment.setUserId(userId);
		comment.setMoimNo(moimNo);
		comment.setMmContent(mmContent);
		
		System.out.println(comment.getMmContent());
		
		boolean res = dao.replyComment(parentComment.getUserId(), parentComment.getGroupNo(), lastgroupsq, comment);
		return res;
		
	}

	@Override
	public Map<Integer, Integer> getCommentCount(int startRow, int endRow) {
		return dao.getCommentCount(startRow, endRow);
	}
	


}
