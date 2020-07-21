package com.kulkkeok.service.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kulkkeok.model.dao.comment.CommentDao;
import com.kulkkeok.model.dao.comment.CommentDaoMyBatis;
import com.kulkkeok.model.dto.CommentDto;

public class CommentServiceImpl implements CommentService{
	private CommentDao dao = null;
	
	public CommentServiceImpl() {
		super();
		dao = new CommentDaoMyBatis();
				
	}

	@Override
	public String commentList(String boardCode, int postNo) {
		JSONObject totalObject = new JSONObject(); // 배열을 저장할 totalObject
		JSONArray commentArray = new JSONArray(); // commentInfo JSON 객체를 저장할 commentArray

		// https://mainia.tistory.com/5673

		List<CommentDto> cList = dao.commentList(boardCode, postNo);
		
		//System.out.println("service : cList = "+cList);
		
		try {		
			
			for(CommentDto dto : cList) {				
				JSONObject commentInfo = new JSONObject(); // 댓글 하나가 저장 될 JSON 객체.
				
				commentInfo.put("commentNo", Integer.toString(dto.getCommentNo()));
				//System.out.println("service: "+ dto.getCommentNo());
				commentInfo.put("postNo", Integer.toString(dto.getPostNo()));				
				commentInfo.put("groupNo",Integer.toString(dto.getGroupNo()));
				commentInfo.put("groupSq",Integer.toString((dto.getGroupSq())));
				commentInfo.put("replyId", dto.getReplyId());
	
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String toStringDate = transFormat.format(dto.getCommentDate());
				
				commentInfo.put("commentDate",toStringDate);
				commentInfo.put("commentContent", dto.getCommentContent());
				commentInfo.put("userId", dto.getUserId());
				
				commentArray.add(commentInfo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		totalObject.put("comments", commentArray);
	
		
		String jsoninfo = totalObject.toJSONString(); // JSONObject를 문자열로 변환.
		
		return jsoninfo;
	}

	@Override
	public boolean writeComment(String boardCode, int postNo, String userId, String commentContent) {
		// TODO Auto-generated method stub
		CommentDto comment = new CommentDto();
		
		comment.setPostNo(postNo);
		comment.setCommentContent(commentContent);
		comment.setUserId(userId);
		
		boolean res = dao.writeComment(boardCode, comment);
		//System.out.println("dao : "+res);
		
		return res;
	}

	@Override
	public boolean deleteComment(String boardCode, int postNo, int commentNo) {
		// TODO Auto-generated method stub
		CommentDto comment = new CommentDto();
		
		comment.setPostNo(postNo);
		comment.setCommentNo(commentNo);
		
		return dao.deleteComment(boardCode, comment);
	}

	@Override
	public boolean updateComment(String boardCode, int postNo, int commentNo, String commentContent) {
		// TODO Auto-generated method stub
		CommentDto comment = new CommentDto();
		
		comment.setPostNo(postNo);
		comment.setCommentNo(commentNo);
		comment.setCommentContent(commentContent);
		
		
		return dao.updateComment(boardCode, comment);
	}

	@Override
	public boolean replyComment(String boardCode, int postNo, int commentNo, String commentContent, String userId) {
		// TODO Auto-generated method stub
		
		CommentDto parentComment = new CommentDaoMyBatis().selectParentComment(boardCode, postNo, commentNo);
		
		int lastgroupsq = new CommentDaoMyBatis().lastGroupsq(boardCode, postNo, parentComment.getGroupNo());
		
		CommentDto comment = new CommentDto();
		
		comment.setUserId(userId);
		comment.setPostNo(postNo);
		comment.setCommentContent(commentContent);
		
		boolean res =  dao.replyComment(boardCode, parentComment.getUserId(), parentComment.getGroupNo(), lastgroupsq, comment);
		
		
		return res;
	}
	

}
