package com.kulkkeok.model.dao.post;

import java.util.List;

import com.kulkkeok.model.dto.PostDto;

public interface PostDao {
	
	// namespace
	String namespace = "mybatis.mapper.post.";
	
	// 게시물 개수
	String getTotalPostSql = " SELECT COUNT(*) FROM POST WHERE BOARD_CODE=? ";  // 게시물 개수 가져오기
	
	// 게시물들 가져오기
	String  getPostListSql = " SELECT *FROM ( SELECT ROWNUM RN, TEMP.* FROM " // 한 페이지에 출력 될 게시글 목록
			+ " ( SELECT *FROM POST WHERE BOARD_CODE= ? ORDER BY GROUP_NO DESC, GROUP_SQ ) " 
			+ " TEMP ) WHERE ( RN BETWEEN ? AND ? )";
	
	// 자유게시판 글쓰기
	String writeFreePostSql = " INSERT INTO POST "+
								" VALUES(FREESQ.NEXTVAL,'FREE',FREEGROUPSQ.NEXTVAL,1,0,?,?,SYSDATE,0,?) ";
	
	// 공지게시판 글쓰기
	String writeNoticePostSql = " INSERT INTO POST "+
			" VALUES(NOTICESQ.NEXTVAL,'NOTICE',NOTICEGROUPSQ.NEXTVAL,1,0,?,?,SYSDATE,0,?) ";
	
	// 해당 게시물 가져오기
	String detailPostSql = " SELECT *FROM POST WHERE POST_NO = ? AND BOARD_CODE= ? "; // 게시글 폼
	
	// 답변쓰기 순서 변경
	String updateAnswerSql = " UPDATE POST SET GROUP_SQ = GROUP_SQ+1 WHERE ( GROUP_NO=? AND GROUP_SQ > ? ) AND BOARD_CODE = ? "; // 답변쓰기 [1]
	
	// 자유게시판 답변
	String writeFreeAnswerSql =  " INSERT INTO POST "+
			" VALUES(FREESQ.NEXTVAL,'FREE',?,?,?,?,?,SYSDATE,0,?) ";  // 답변쓰기 [2] - FREE
	
	// 공지게시판 답변
	String writeNoticeAnswerSql =  " INSERT INTO POST "+
			" VALUES(NOTICESQ.NEXTVAL,'NOTICE',?,?,?,?,?,SYSDATE,0,?) ";  // 답변쓰기 [2] - NOTICE
	
	// 게시물 삭제
	String deletePostSql = " DELETE FROM POST WHERE POST_NO=? AND BOARD_CODE=? "; // 글삭제
	
	// 게시물 수정
	String updatePostSql = "UPDATE POST SET POST_TITLE=? , POST_CONTENT=? WHERE POST_NO =? AND BOARD_CODE=?"; // 글 수정
	
	// 게시물 조회수 카운트
	String countViewsSql = " UPDATE POST SET POST_VIEWS = POST_VIEWS+1 WHERE POST_NO=? AND BOARD_CODE = ? "; // 조회수
	
	// 인기글 가져오기
	String getbestPostListSql = " SELECT P.* " + 
			" FROM POST P " + 
			" WHERE ( P.POST_NO IN ( SELECT TEMP.POST_NO " + 
			" FROM (SELECT POST_NO,COUNT(*) CNT " + 
			" FROM COMMENT_TB " + 
			" WHERE BOARD_CODE=? "+
			" GROUP BY POST_NO) TEMP " + 
			" WHERE CNT>5 ) OR P.POST_VIEWS>20 ) AND P.BOARD_CODE = ? ";
	
	int getTotalPost(String boardCode);
	List<PostDto> getPostList(String boardCode, int startRow, int endRow);
	boolean writePost(String boardCode, PostDto post);
	PostDto detailPost(String boardCode, int postNo);
	boolean updateAnswer(String boardCode, int parentgroupno, int parentgroupsq);
	boolean writeAnswer(String boardCode, PostDto post);
	boolean deletePost(String boardCode, int postNo);
	boolean updatePost(String boardCode, PostDto post);
	boolean countViews(String boardCode, int postNo);
	List<PostDto> getBestPostList(String boardCode);
	
}
