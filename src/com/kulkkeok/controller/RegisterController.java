package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.service.register.RegisterService;
import com.kulkkeok.service.register.RegisterServiceImpl;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterController() {}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command = [" + command + "]");
		
		RegisterService service = new RegisterServiceImpl();
		if(command.equals("joinPage")) {
			dispatch("join.jsp", request, response);
		}
		else if(command.equals("idChk")){
			String id = request.getParameter("id");
			System.out.println("ID = [" + id + "]");
			String res = service.idChk(id);
			
			boolean idnotused = true;
			
			if(res != null) {
				idnotused = false;
			}
			response.sendRedirect("join_idchk.jsp?idnotused="+idnotused);
		}
		else if(command.equals("join")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			UserDto user = new UserDto();
			user.setUserId(id);
			user.setUserPw(pw);
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPhone(phone);
			
			int res = service.insert(user);
			
			if(res>0) 
				jsResponse("회원가입 성공", "login.do?command=loginPage", response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void dispatch(String url, HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response); 
	} 
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+msg+"' );"
				+ "location.href='"+url+"';"
				+ "</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
}