package com.kulkkeok.model.dao.comment;

import java.util.List;
import java.util.Map;

import com.kulkkeok.model.dto.CommentDto;

public interface CommentDao {

/*
	 CREATE TABLE COMMENT_TB(
	    COMMENT_NO NUMBER,
	    POST_NO NUMBER,
	    BOARD_CODE VARCHAR2(20),
	    GROUP_NO NUMBER NOT NULL,
	    GROUP_SQ NUMBER NOT NULL,
	    REPLY_ID VARCHAR2(20),
	    COMMENT_CONTENT VARCHAR2(300) NOT NULL,
	    COMMENT_DATE DATE NOT NULL,
	    USER_ID VARCHAR2(20),
	    CONSTRAINT PK_COMMENT PRIMARY KEY(COMMENT_NO, POST_NO, BOARD_CODE),
	    CONSTRAINT FK_COMMENT_POST FOREIGN KEY(POST_NO, BOARD_CODE) REFERENCES POST(POST_NO, BOARD_CODE) ON DELETE CASCADE,
	    CONSTRAINT FK_COMMENT_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID) ON DELETE CASCADE
	);
*/
	// namespace
		String namespace = "mybatis.mapper.comment.";
		
	// 자유게시판 or 공지게시판 댓글 쓰기
	String writeFreeCommentSql = " INSERT INTO COMMENT_TB VALUES(CMTFREESEQ.NEXTVAL,?,?,CMTFREEGROUPSEQ.NEXTVAL,1,NULL,?,SYSDATE,?) ";
	String writeNoticeCommentSql = " INSERT INTO COMMENT_TB VALUES(CMTNOTICESEQ.NEXTVAL,?,?,CMTNOTICEGROUPSEQ.NEXTVAL,1,NULL,?,SYSDATE,?) ";
	
	// 댓글 목록
	String commentListSql =" SELECT *FROM COMMENT_TB " + 
			" WHERE BOARD_CODE = ? AND POST_NO=? " + 
			"ORDER BY GROUP_NO, GROUP_SQ ";
	
	// 댓글 수정
	String updateCommentSql = " UPDATE COMMENT_TB SET COMMENT_CONTENT=? WHERE POST_NO=? AND COMMENT_NO=? AND BOARD_CODE=? ";
	
	// 댓글 삭제
	String deleteCommentSql = "  DELETE FROM COMMENT_TB WHERE POST_NO =? AND BOARD_CODE=? AND COMMENT_NO=?  ";
	
	// 부모 댓글 가져오기
	String selectParentCommentSql = " SELECT *FROM COMMENT_TB WHERE BOARD_CODE = ? AND POST_NO =? AND COMMENT_NO =? ";
	
	// 부모댓글 그룹댓글 마지막 순서 가져오기
	String lastGroupsqSql = " SELECT GROUP_SQ " + 
							" FROM ( SELECT ROWNUM RN , TEMP.* " + 
									" FROM ( SELECT * FROM COMMENT_TB WHERE POST_NO = ? AND GROUP_NO = ? AND BOARD_CODE=? ORDER BY  GROUP_SQ DESC ) TEMP ) " + 
							" WHERE RN=1 "; 
	
	// 자유게시판 or 공지게시판 대댓글
	String writeFreereplyCommentSql = " INSERT INTO COMMENT_TB "+
			" VALUES(CMTFREESEQ.NEXTVAL,?,?,?,?,?,?,SYSDATE,?) ";
	
	String writeNoticereplyCommentSql = " INSERT INTO COMMENT_TB "+
			" VALUES(CMTNOTICESEQ.NEXTVAL,?,?,?,?,?,?,SYSDATE,?) ";


	// 댓글 개수
	String getCommentCountSql=	" SELECT POST_NO,COUNT(*) " + 
								" FROM COMMENT_TB " + 
								" WHERE POST_NO IN (SELECT POST_NO " + 
								" FROM (SELECT ROWNUM RN,TEMP.* " + 
								" FROM (SELECT POST.* " + 
								" FROM POST " + 
								" WHERE BOARD_CODE=? "+
								" ORDER BY GROUP_NO DESC,GROUP_SQ) TEMP) " + 
								" WHERE ( RN BETWEEN ? AND ? ) AND BOARD_CODE= ? ) " + 
								" AND BOARD_CODE=? "+
								"GROUP BY POST_NO";
	
	
	
	
	boolean writeComment(String boardCode, CommentDto comment);
	List<CommentDto> commentList(String boardCode, int postNo);
	boolean updateComment(String boardCode,CommentDto comment);
	boolean deleteComment(String boardCode,CommentDto comment);
	CommentDto selectParentComment(String boardCode, int postNo, int commentNo);
	int lastGroupsq(String boardCode, int postNo, int parentgroupNo);
	boolean replyComment(String boardCode, String parentId,int parentgroupno,int lastgroupsq, CommentDto comment);
	Map<Integer,Integer> getCommentCount(String boardCode, int startRow, int endRow);
}
