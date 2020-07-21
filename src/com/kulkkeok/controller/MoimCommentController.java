package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.service.moimComment.MoimCommentService;
import com.kulkkeok.service.moimComment.MoimCommentServiceImpl;

//@WebServlet("/MoimCommentController")
public class MoimCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MoimCommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		MoimCommentService service = new MoimCommentServiceImpl();
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		
		if(command.equals("commentlist")) {
			PrintWriter writer = response.getWriter();
			
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			String jsonInfo = service.commentList(moimNo);
			
			writer.print(jsonInfo);
		
		}else if(command.equals("writeComment")) {
			PrintWriter out = response.getWriter();
			
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			
			String userId = request.getParameter("userId");
			String mmContent = request.getParameter("mmContent");

			boolean res = service.writeMoimComment(moimNo, userId, mmContent);
		
			out.print(res);
		
		}else if(command.equals("commentlist")) {
			
			PrintWriter writer = response.getWriter();
			
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			
			String jsonInfo = service.commentList(moimNo);
			
			writer.print(jsonInfo);
		
		}else if(command.equals("delete")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			int mmNo = Integer.parseInt(request.getParameter("mmNo"));
			String mmContent = request.getParameter("mmContent");
			
			PrintWriter out = response.getWriter();
			
			boolean res = service.deleteComment(moimNo, mmNo, mmContent);
			
			out.print(res);
		
		}else if(command.equals("update")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			int mmNo = Integer.parseInt(request.getParameter("mmNo"));
			String mmContent = request.getParameter("mmContent");
			
			PrintWriter out = response.getWriter();
			
			boolean res = service.updateComment(moimNo, mmNo, mmContent);
			
			out.print(res);
		
		}else if(command.equals("reply")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			int mmNo = Integer.parseInt(request.getParameter("mmNo"));
			String mmContent = request.getParameter("mmContent");
			String userId = request.getParameter("userId");
			
			PrintWriter out = response.getWriter();
			
			boolean res = service.replyComment(moimNo, mmNo, mmContent, userId);
			out.print(res);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
