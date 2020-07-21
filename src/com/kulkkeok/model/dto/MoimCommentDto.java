package com.kulkkeok.model.dto;

import java.util.Date;

public class MoimCommentDto {

	private int mmNo;
	private String mmContent;
	private Date mmDate;
	private int groupNo;
	private int groupSq;
	private String replyId;
	private String userId;
	private int moimNo;
	
	public MoimCommentDto() {}

	public MoimCommentDto(int mmNo, String mmContent, Date mmDate, int groupNo, int groupSq, String replyId, String userId,
			int moimNo) {
		super();
		this.mmNo = mmNo;
		this.mmContent = mmContent;
		this.mmDate = mmDate;
		this.groupNo = groupNo;
		this.groupSq = groupSq;
		this.replyId = replyId;
		this.userId = userId;
		this.moimNo = moimNo;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public String getMmContent() {
		return mmContent;
	}

	public void setMmContent(String mmContent) {
		this.mmContent = mmContent;
	}

	public Date getMmDate() {
		return mmDate;
	}

	public void setMmDate(Date mmDate) {
		this.mmDate = mmDate;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMoimNo() {
		return moimNo;
	}

	public void setMoimNo(int moimNo) {
		this.moimNo = moimNo;
	}
	
	

}
