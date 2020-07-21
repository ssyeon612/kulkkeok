package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapConfig;
import chat.ChatDto;

public class ChatDaoMyBatis extends SqlMapConfig{
	String namespace = "mybatis.mapper.chat.";
	
	public List<ChatDto> getChatList(String nowTime){
		System.out.println("MyBatis : [ getChatList ] 실행");
		SqlSession session = null;
		List<ChatDto> chatList = new ArrayList<ChatDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			chatList = session.selectList(namespace+"getChatListSql",nowTime);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(ChatDto dto : chatList) {
			dto.setChatContent(dto.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
		
			int chatTime = Integer.parseInt(dto.getChatTime().substring(11, 13));
			
			String timeType = "오전";
			
			if(Integer.parseInt(dto.getChatTime().substring(11, 13)) >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			
			dto.setChatTime(dto.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + dto.getChatTime().substring(14, 16) + "");
		}

		
		return chatList;
	}
	
	public List<ChatDto> getChatListByRecent(int number){
		System.out.println("MyBatis : [  getChatListByRecent ] 실행");
		SqlSession session = null;
		
		List<ChatDto> chatList = new ArrayList<ChatDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			chatList = session.selectList(namespace+"getChatListByRecentSql",number);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(ChatDto dto : chatList) {
			dto.setChatContent(dto.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
		
			int chatTime = Integer.parseInt(dto.getChatTime().substring(11, 13));
			
			String timeType = "오전";
			
			if(Integer.parseInt(dto.getChatTime().substring(11, 13)) >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			
			dto.setChatTime(dto.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + dto.getChatTime().substring(14, 16) + "");
		}
		
		return chatList;
	}
	
	public List<ChatDto> getChatListByRecent(String chatNo){
		System.out.println("MyBatis : [  getChatListByRecent ] 실행");
		SqlSession session = null;
		
		List<ChatDto> chatList = new ArrayList<ChatDto>();

		try {
			session = getSqlSessionFactory().openSession(false);
			chatList = session.selectList(namespace+"getChatListByRecentStringSql",chatNo);
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(ChatDto dto : chatList) {
			dto.setChatContent(dto.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
		
			int chatTime = Integer.parseInt(dto.getChatTime().substring(11, 13));
			
			String timeType = "오전";
			
			if(Integer.parseInt(dto.getChatTime().substring(11, 13)) >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			
			dto.setChatTime(dto.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + dto.getChatTime().substring(14, 16) + "");
		}
		
		
		return chatList;
	}
	
	
	public int submit(String chatName, String chatContent) {
		System.out.println("MyBatis : [  submit ] 실행");
		SqlSession session = null;
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("chatName", chatName);
		param.put("chatContent", chatContent);
		
		try {
			session = getSqlSessionFactory().openSession();
			int res = session.insert(namespace+"submitSql",param);
			
			if(res>0) {session.commit();return res;}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
	
		return -1;
	}
}
