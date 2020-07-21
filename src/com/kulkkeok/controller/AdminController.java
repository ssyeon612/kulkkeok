package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kulkkeok.model.dto.CommentDto;
import com.kulkkeok.model.dto.MoimCommentDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.service.admin.AdminService;
import com.kulkkeok.service.admin.AdminServiceImpl;

@WebServlet("/admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminService ac = null;

    public AdminController() {
        super();
        ac = new AdminServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		HttpSession session = request.getSession();
		String admin = ((UserDto) session.getAttribute("user")).getUserId();
		System.out.println("Are you a user?"+!admin.equals("ADMIN"));
		
		if(!admin.equals("ADMIN")) {
			System.out.println("check");
			dispatch("main.do?command=main", request, response);
		
		}
		
		String command = request.getParameter("command");
		System.out.println("command : [ "+command+" ]");
		
		if(command.equals("userMng")) {
			
			List<UserDto> list = ac.getAllUserInfo();
			
			request.setAttribute("list", list);
			dispatch("admin_userMng.jsp", request, response);
			
		}else if(command.equals("muldel")) {
			String action = request.getParameter("action");
			String id = request.getParameter("userId");
			System.out.println("action : [ "+action+" ]");
			
			if(action.equals("userdel")) {
				String[] userId = request.getParameterValues("chk");
				
				if(userId==null||userId.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.userDelete(userId);
				
				if(is) {
					jsResponse("탈퇴되었습니다.", "admin.do?command=userMng", response);
				}else {
					jsResponse("탈퇴오류.", "admin.do?command=userMng", response);
				}
				
			}else if(action.equals("reviewdel")) {
				String[] reviewNo = request.getParameterValues("chk");
				for(String str:reviewNo) {
					System.out.println(str);
				}
				
				if(reviewNo==null||reviewNo.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.reviewDelete(reviewNo);
				
				if(is) {
					jsResponse("삭제되었습니다.", "admin.do?command=activity&userId="+id, response);
				}else {
					jsResponse("삭제오류.", "admin.do?command=activity&userId="+id, response);
				}
				
				
				
			}else if(action.equals("postdel")) {
				String[] postNo = request.getParameterValues("chk");
				for(String str:postNo) {
					System.out.println(str);
				}
				

				if(postNo==null||postNo.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.postDelete(postNo);
				
				if(is) {
					jsResponse("삭제되었습니다.", "admin.do?command=activity&userId="+id, response);
				}else {
					jsResponse("삭제오류.", "admin.do?command=activity&userId="+id, response);
				}
				
				
			}else if(action.equals("commentdel")) {
				String[] commentNo = request.getParameterValues("chk");
				
				for(String str:commentNo) {
					System.out.println(str);
				}
						

				if(commentNo==null||commentNo.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.commentDelete(commentNo);
				
				if(is) {
					jsResponse("삭제되었습니다.","admin.do?command=activity&userId="+id, response);
				}else {
					jsResponse("삭제오류.","admin.do?command=activity&userId="+id, response);
				}
				
				
				
			}else if(action.equals("moimdel")) {
				String[] moimNo = request.getParameterValues("chk");
				for(String str:moimNo) {
					System.out.println(str);
				}

				if(moimNo==null|| moimNo.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.moimDelete(moimNo);
				
				if(is) {
					jsResponse("삭제되었습니다.", "admin.do?command=activity&userId="+id, response);
				}else {
					jsResponse("삭제오류.", "admin.do?command=activity&userId="+id, response);
				}
				
				
				
			}else if(action.equals("moimcommentdel")) {
				String[] mmNo = request.getParameterValues("chk");
				for(String str:mmNo) {
					System.out.println(str);
				}
				
				if(mmNo==null|| mmNo.length==0){
					jsResponse("하나 이상 선택해주세요.", "admin.do?command=userMng", response);
				}
				
				boolean is = ac.moimCommentDelete(mmNo);
				
				if(is) {
					jsResponse("삭제되었습니다.", "admin.do?command=activity&userId="+id, response);
				}else {
					jsResponse("삭제오류.", "admin.do?command=activity&userId="+id, response);
				}
			}
			
			
			
			
			
		}else if(command.equals("activity")) {
			String userId = request.getParameter("userId");
			
			List<ReviewDto> reviewList = ac.getUserReviewList(userId);
			List<PostDto> postList = ac.getUserPostList(userId);
			List<CommentDto> commentList = ac.getUserCommentList(userId);
			List<MoimDto> moimList = ac.getUserMoimList(userId);
			List<MoimCommentDto> moimCommentList = ac.getUserMoimCommentList(userId);
			
			request.setAttribute("userId", userId);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("postList", postList);
			request.setAttribute("commentList", commentList);
			request.setAttribute("moimList", moimList);
			request.setAttribute("moimCommentList", moimCommentList);
			
			dispatch("admin_activity.jsp", request, response);
		}else if(command.equals("beerinsert")) {
			dispatch("beerinfo_write.jsp", request, response);
			
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
