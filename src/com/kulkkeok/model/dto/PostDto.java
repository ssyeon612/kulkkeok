package com.kulkkeok.model.dto;


import java.util.Date;

public class PostDto {
	private int postNo;
	private int groupNo;
	private int groupSq;
	private int titleTab;
	private String postTitle;
	private String postContent;
	private Date postDate;
	private int postViews;
	private String userId;
	
	public PostDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostDto(int postNo, int groupNo, int groupSq, int titleTab, String postTitle, String postContent, Date postDate,
			int postViews, String userId) {
		super();
		this.postNo = postNo;
		this.groupNo = groupNo;
		this.groupSq = groupSq;
		this.titleTab = titleTab;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postDate = postDate;
		this.postViews = postViews;
		this.userId = userId;
	}
	
	public PostDto(String title, String content, String writer) {
		// TODO Auto-generated constructor stub
		this.postTitle = title;
		this.postContent = content;
		this.userId = writer;
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
	public int getTitleTab() {
		return titleTab;
	}
	public void setTitleTab(int titleTab) {
		this.titleTab = titleTab;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getPostViews() {
		return postViews;
	}
	public void setPostViews(int postViews) {
		this.postViews = postViews;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}