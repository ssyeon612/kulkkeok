package chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatListController")
public class ChatListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals(""))
			response.getWriter().write("");
		else if(listType.equals("today"))
			response.getWriter().write(getToday());
		else if(listType.equals("ten"))
			response.getWriter().write(getTen());
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getNo(listType));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public String getToday() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDaoMyBatis chatDao = new ChatDaoMyBatis();
		List<ChatDto> chatList = chatDao.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
		for(int i=0; i<chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1) 
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() +"\"}");
		return result.toString();
	}
	public String getTen() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDaoMyBatis chatDao = new ChatDaoMyBatis();
		List<ChatDto> chatList = chatDao.getChatListByRecent(10);
		
		for(int i=0; i<chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1) 
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() +"\"}");
		return result.toString();
	}
	public String getNo(String chatNo) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDaoMyBatis chatDao = new ChatDaoMyBatis();
		List<ChatDto> chatList = chatDao.getChatListByRecent(chatNo);
		
		for(int i=0; i<chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1) 
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() +"\"}");
		return result.toString();
	}
}