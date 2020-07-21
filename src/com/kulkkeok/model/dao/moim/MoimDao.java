package com.kulkkeok.model.dao.moim;

import java.util.List;

import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.UserDto;

public interface MoimDao {
	
	String namespace ="mybatis.mapper.moim.";

   String getAllMoimListSql = "SELECT MOIM_NO, MOIM_TITLE, MOIM_CONTENT, MOIM_WRITEDATE, MOIM_DATE, " + 
         "MOIM_PLACENAME, MOIM_PLACEADD, CATEGORY_NAME, USER_ID FROM " + 
         "(SELECT A.*, ROWNUM RNUM FROM (SELECT * FROM MOIM_BOARD JOIN CATEGORY " + 
         "USING (CATEGORY_CODE) ORDER BY MOIM_NO DESC)A) WHERE RNUM>=? AND RNUM<=?";
   
   //전체 모임 개수
   String totalMoimSql = "SELECT COUNT(*) FROM MOIM_BOARD";
   
   //종료되지 않은 모임 보기
   String getMoimListNotClosedSql = "SELECT * FROM(" + 
         "                SELECT MOIM_NO, MOIM_TITLE, MOIM_CONTENT, MOIM_WRITEDATE, MOIM_DATE, MOIM_PLACENAME, MOIM_PLACEADD, CATEGORY_NAME, USER_ID, ROW_NUMBER() OVER(ORDER BY MOIM_DATE ASC) RR" + 
         "                FROM MOIM_BOARD" + 
         "                 JOIN CATEGORY USING (CATEGORY_CODE) WHERE (TRUNC(SYSDATE) - MOIM_DATE) <= 0" + 
         "         ) WHERE RR<6"; 

   
   //글 보기
   String getMoimDetailSql = "SELECT MOIM_NO, MOIM_TITLE, MOIM_CONTENT, MOIM_WRITEDATE, MOIM_DATE, "
         + "MOIM_PLACENAME, MOIM_PLACEADD, CATEGORY_NAME, USER_ID FROM MOIM_BOARD "
         + "JOIN CATEGORY USING (CATEGORY_CODE) WHERE MOIM_NO = ?";
   
   //내 모임 보기
   String getMyMoimListSql = "SELECT * FROM MOIM_BOARD WHERE USER_ID = ?";
   
   String insertOneSql = "INSERT INTO MOIM_BOARD VALUES (MOIMSQ.NEXTVAL, ?,?,SYSDATE,?,?,?,?,?)";
   
   String updateSql = "UPDATE MOIM_BOARD SET MOIM_TITLE=?,"
         + "CATEGORY_CODE=?,"
         + "MOIM_CONTENT=?,"
         + "MOIM_DATE=?,"
         + "MOIM_PLACENAME=?,"
         + "MOIM_PLACEADD=?"
         + "WHERE MOIM_NO=?";
   
   String deleteSql = "DELETE FROM MOIM_BOARD WHERE MOIM_NO=?";

   //글쓴이 이메일 가져오기
   String getWriterEmailSql = "SELECT USER_EMAIL FROM MOIM_BOARD "
         + "JOIN USER_TB USING(USER_ID) WHERE MOIM_NO = ?";
   
   
   public List<MoimDto> getAllMoimList(int startRow, int endRow);
   public int totalMoim();
   public List<MoimDto> getMoimListNotClosed();
   public MoimDto getMoimDetail(int moimNo);
   public List<MoimDto> getMyMoimList(String userId);
   public int insertOne(MoimDto dto);
   public int update(MoimDto dto);
   public int delete(int moimNo);
   public UserDto getWriterEmail(int moimNo);
   

   

}