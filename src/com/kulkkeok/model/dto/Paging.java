package com.kulkkeok.model.dto;

import java.util.List;
import java.util.Map;

public class Paging {
	private int pageNum = 1; //현재 몇 페이지 인지.
	private int pageSize = 10; // 한 페이지에 출력 될 게시글 개수
	private int totalPost = 0; //전체 게시글 수
	private int totalPage = 0; // 전체 페이지 개수
	private int startRow = 0; 
	private int endRow = 0;
	private List<?> postList=null; //게시글을 담을 리스트
	private int number = 0; // 출력페이지에서 게시글이 시작하는 번호를 저장하는 변수.
	private final static int blockSize = 5; // 페이지 블럭
	private int startPage = 0; // 페이지 블럭에 출력 될 시작페이지 번호
	private int endPage = 0; // 페이지 블럭에 출력될 마지막 페이지 번호
	
	private Map<Integer,Integer> commentCountMap = null; //게시글 댓글 수
	private List<PostDto> bestPostList = null;
	
	public Paging() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public int getPageNum() {
		return pageNum;
	}



	public int getPageSize() {
		return pageSize;
	}



	public int getTotalPost() {
		return totalPost;
	}



	public int getTotalPage() {
		return totalPage;
	}



	public int getStartRow() {
		return startRow;
	}



	public int getEndRow() {
		return endRow;
	}



	public List<?> getPostList() {
		return postList;
	}



	public int getNumber() {
		return number;
	}



	public static int getBlocksize() {
		return blockSize;
	}



	public int getStartPage() {
		return startPage;
	}



	public int getEndPage() {
		return endPage;
	}


	public Map<Integer, Integer> getCommentCountMap() {
		return commentCountMap;
	}
	
	


	public List<PostDto> getBestPostList() {
		return bestPostList;
	}



	public void setBestPostList(List<PostDto> bestPostList) {
		this.bestPostList = bestPostList;
	}



	public void setting(int pageNum,int totalPost) {
		this.pageNum = pageNum;
		this.totalPost = totalPost;
		
		this.totalPage = this.totalPost/this.pageSize + (this.totalPost%this.pageSize==0?0:1);
		
		if(this.pageNum <=0 || this.pageNum > totalPage){
			this.pageNum = 1;
		}
	}
	
	public void handleRow() {
		// 출력페이지 번호에 해당하는 게시글의 시작 행 번호를 계산하여 저장할 변수 선언 및 값 입력
		// startRow : 시작 행!!!
		this.startRow = (this.pageNum - 1) * this.pageSize + 1;
					
		// 출력페이지 번호에 출력될 마지막행 번호를 계산하여 저장할 변수 선언 및 값 입력
		// endRow : 마지막 행!!
		this.endRow = pageNum * pageSize;
		
					
		// 끝페이지의 마지막 행 번호에 대한 유효성 검사
		if(endRow > this.totalPost) endRow = this.totalPost;
	}
	
	public void setCommentCountMap(Map<Integer,Integer> commentCountMap) {
		this.commentCountMap=commentCountMap;
	}
	
	public void handleList(List<?> list) {
		this.postList = list;
		this.number = this.totalPost -(this.pageNum-1)*this.pageSize;
	}
	
	public void pageBlock() {
		// 페이지 블럭에 출력 될 시작페이지 번호를 계산하여 저장 할 변수 선언 및 값 입력
		this.startPage = (this.pageNum/this.blockSize-(this.pageNum%this.blockSize!=0?0:1))*this.blockSize+1;
					
		// 페이지 블럭에 출력 될 마지막 페이지 번호를 계산하여 저장할 변수 선언 및 값 입력.
		this.endPage = this.startPage + this.blockSize - 1;
					
		if(this.endPage>this.totalPage) {this.endPage=this.totalPage;}
	}
	
	
	
}