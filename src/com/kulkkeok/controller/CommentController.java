package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.service.comment.CommentService;
import com.kulkkeok.service.comment.CommentServiceImpl;



//@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService cs = null;   

    public CommentController() {
        super();
        cs = new CommentServiceImpl();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command : [ "+command+" ]");
		if(command.equals("commentlist")) {
			
			PrintWriter writer = response.getWriter();

			String boardCode = request.getParameter("boardCode");
			int postNo = Integer.parseInt(request.getParameter("postNo"));
	
			System.out.println(boardCode +" " +postNo);
			String jsonInfo = cs.commentList(boardCode, postNo);
			
			writer.print(jsonInfo);
			
		}else if(command.equals("writeComment")) {
			// 새 댓글 생성 부분
			PrintWriter out = response.getWriter();
			
			int postNo = Integer.parseInt(request.getParameter("postNo"));
			
			String boardCode = request.getParameter("boardCode");
			String userId = request.getParameter("userId");
			String commentContent = request.getParameter("comment");
			
			// test
//			System.out.println(postNo);
//			System.out.println(boardCode);
//			System.out.println(userId);
//			System.out.println(commentContent);
			
			
			boolean res = cs.writeComment(boardCode, postNo, userId, commentContent);
			
			out.print(res);
			
		}else if(command.equals("delete")) {
			// 댓글 삭제
			int postNo = Integer.parseInt(request.getParameter("postNo"));
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			String boardCode = request.getParameter("boardCode");
			
			PrintWriter out = response.getWriter();
			
			boolean res = cs.deleteComment(boardCode, postNo, commentNo);
			
			out.print(res);

		}else if(command.equals("update")) {

			int postNo = Integer.parseInt(request.getParameter("postNo"));
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			String boardCode = request.getParameter("boardCode");
			
			String commentContent = request.getParameter("comment");
			
			// test
//			System.out.println(postNo);
//			System.out.println(boardCode);
//			System.out.println(commentNo);
//			System.out.println(commentContent);
			
			PrintWriter out = response.getWriter();
			
			boolean res = cs.updateComment(boardCode,postNo,commentNo,commentContent);
			System.out.println(res);
			out.print(res);
			
		}else if(command.equals("reply")) {
			
			int postNo = Integer.parseInt(request.getParameter("postNo"));
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			String boardCode = request.getParameter("boardCode");
			String commentContent = request.getParameter("comment");
			String userId = request.getParameter("userId");
			// test
//			System.out.println(postNo);
//			System.out.println(boardCode);
//			System.out.println(commentNo);
//			System.out.println(commentContent);
			
			PrintWriter out = response.getWriter();
			
			boolean res = cs.replyComment(boardCode, postNo,commentNo,commentContent,userId);
			
			out.print(res);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	// dispatch
		private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			RequestDispatcher dispatch = request.getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		
		// jsResponse
		private void jsResponse(String msg,String url,HttpServletResponse response) throws IOException {
			
			String s = "<script type='text/javascript'>"+
						"alert('"+msg+"');"+
						"location.href='"+url+"';"+
						"</script>";
			PrintWriter out = response.getWriter();
			out.print(s);
			
		}

}
