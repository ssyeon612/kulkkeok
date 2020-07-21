package com.kulkkeok.model.dto;


import java.util.Date;

public class CommentDto {
	private int commentNo;
	private int postNo;
	private int groupNo;
	private int groupSq;
	private String replyId;
	private String commentContent;
	private Date commentDate;
	private String userId;
	
	
	
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CommentDto(int commentNo, int postNo, int groupNo, int groupSq, String replyId, String commentContent,
			Date commentDate, String userId) {
		super();
		this.commentNo = commentNo;
		this.postNo = postNo;
		this.groupNo = groupNo;
		this.groupSq = groupSq;
		this.replyId = replyId;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.userId = userId;
	}



	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupSq() {
		return groupSq;
	}
	public void setGroupSq(int groupSq) {
		this.groupSq = groupSq;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}