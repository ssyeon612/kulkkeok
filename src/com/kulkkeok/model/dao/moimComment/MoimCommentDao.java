package com.kulkkeok.model.dao.moimComment;

import java.util.List;
import java.util.Map;

import com.kulkkeok.model.dto.MoimCommentDto;

public interface MoimCommentDao {
	/*
	 MM_NO (시퀀스)
	MM_CONTENT
	MM_DATE
	GROUP_NO 부모댓글의 번호(시퀀스)
	GROUP_SQ 부모댓글 내에서의 번호
	REPLY_ID
	USER_ID
	MOIM_NO 모임글번호
시퀀스	
MMSQ(모임 댓글), MMGROUPSQ(모임 댓글 그룹)
	 * */
	
	String namespace = "mybatis.mapper.moimcomment.";
	
	//댓글 작성
	String writeMoimCommentSql = "INSERT INTO MOIM_COMMENT VALUES(MMSQ.NEXTVAL,?,SYSDATE, MMGROUPSQ.NEXTVAL, 1, NULL, ?,?)";
	
	//댓글 목록
	String commentListSql = "SELECT * FROM MOIM_COMMENT "
			+ "WHERE MOIM_NO=? ORDER BY GROUP_NO, GROUP_SQ";
	
	//댓글 수정
	String updateCommentSql = "UPDATE MOIM_COMMENT SET MM_CONTENT=? "
			+ "WHERE MOIM_NO=? AND MM_NO=?";
	
	//댓글 삭제
	String deleteCommentSql = "DELETE FROM MOIM_COMMENT WHERE MOIM_NO=? AND MM_NO=?";
	
	//부모 댓글 가져오기
	String selectParentCommentSql = "SELECT * FROM MOIM_COMMENT "
			+ "WHERE MOIM_NO = ? AND MM_NO=?";
	
	//부모 댓글 그룹댓글 마지막 순서 가져오기--?
	String lastGroupsqSql = 
	"SELECT GROUP_SQ "
  + "FROM (SELECT ROWNUM RN, TEMP.* "
		+ "FROM (SELECT * FROM MOIM_COMMENT "
				+ "WHERE MOIM_NO=? AND GROUP_NO=? "
				+ "ORDER BY GROUP_SQ DESC)TEMP) "
  +	"WHERE RN=1";
	
	//대댓글 작성
	String writeMoimReplyCommentSql = "INSERT INTO MOIM_COMMENT "
			+ "VALUES(MMSQ.NEXTVAL,?,SYSDATE,?,?,?,?,?)";
	
	//댓글 개수
	/*
	String getCommentCountSql = 
					" SELECT MOIM_NO,COUNT(*) " + 
					" FROM MOIM_COMMENT " + 
					" WHERE MOIM_NO IN (SELECT MOIM_NO " + 
					" FROM (SELECT ROWNUM RN,TEMP.* " + 
					" FROM (SELECT MOIM_BOARD.* " + 
					" FROM MOIM_BOARD ) TEMP) " + 
					" WHERE ( RN BETWEEN ? AND ? ) ) " + 
					" GROUP BY MOIM_NO";
	*/
	
	String getCommentCountSql = 
			"SELECT MOIM_NO,COUNT(*) " + 
			"FROM MOIM_COMMENT WHERE MOIM_NO IN (SELECT MOIM_NO " + 
			"    FROM (SELECT ROWNUM RN,TEMP.*  FROM (SELECT MOIM_BOARD.* FROM MOIM_BOARD) TEMP) " + 
			"    WHERE (RN BETWEEN ? AND ?) " + 
			"  ) " + 
			"GROUP BY MOIM_NO " + 
			"ORDER BY MOIM_NO DESC ";
	
	
	String newGetCommenctCountSql = " SELECT MC.MOIM_NO, COUNT (*) " + 
			" FROM MOIM_COMMENT MC " + 
			" WHERE MC.MOIM_NO IN (SELECT MOIM_NO  FROM  " + 
			" (SELECT A.*, ROWNUM RNUM FROM (SELECT * FROM MOIM_BOARD JOIN CATEGORY " + 
			" USING (CATEGORY_CODE) ORDER BY MOIM_NO DESC)A) WHERE RNUM>=? AND RNUM<=?) " + 
			" GROUP BY MC.MOIM_NO ";
	
	public boolean writeMoimComment(MoimCommentDto dto);
	public List<MoimCommentDto> commentList(int moimNo);
	public boolean updateComment(MoimCommentDto comment);
	public boolean deleteComment(MoimCommentDto comment);
	public MoimCommentDto selectParentCommect(int moimNo, int mmNo);
	public int lastGroupsq(int moimNo, int parentgroupNo);
	public boolean replyComment(String parentId, int parentgroupno, int lastgroupsq, MoimCommentDto comment);
	public Map<Integer, Integer> getCommentCount(int startRow, int endRow);
}
