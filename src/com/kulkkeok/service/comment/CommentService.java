package com.kulkkeok.service.comment;

public interface CommentService {
	String commentList(String boardCode, int postNo);
	boolean writeComment(String boardCode, int postNo, String userId,String commentContent);
	boolean deleteComment(String boardCode, int postNo, int commentNo);
	boolean updateComment(String boardCode, int postNo, int commentNo, String commentContent);
	boolean replyComment(String boardCode, int postNo, int commentNo, String commentContent,String userId);
}
