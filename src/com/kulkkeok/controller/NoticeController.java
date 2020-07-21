package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.model.dto.Paging;
import com.kulkkeok.model.dto.PostDto;
import com.kulkkeok.service.post.PostService;
import com.kulkkeok.service.post.PostServiceImpl;


//@WebServlet("/NoticeController")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService ps = null;

    public NoticeController() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	ps = new PostServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command : [ "+command+" ]");
		
		if(command.equals("list")) {
			/************** free Board List ***************/
			
			int page = 1; // default page is 1.
			
			
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			Paging paging = ps.getPostList("NOTICE", page);
			System.out.println(paging.getPostList().size());
			
			request.setAttribute("list", paging.getPostList());
			request.setAttribute("number", paging.getNumber());
			request.setAttribute("startPage", paging.getStartPage());
			request.setAttribute("endPage", paging.getEndPage());
			request.setAttribute("blockSize", paging.getBlocksize());
			request.setAttribute("totalPage", paging.getTotalPage());
			request.setAttribute("page", page);
			
			request.setAttribute("cmtCnt", paging.getCommentCountMap());
			request.setAttribute("bestList", paging.getBestPostList());
			
			dispatch("notice.jsp", request, response);
		}else if(command.equals("detail")){
			/************** detail Form ***************/
			
			int postNo = Integer.parseInt(request.getParameter("no"));
			
			if(ps.countViews("NOTICE", postNo)) {
				
				PostDto post = ps.detailPost("NOTICE",postNo);
				
				request.setAttribute("post", post);
				dispatch("notice_view.jsp", request, response);				
				
			}else {
				System.out.println(" ERROR : 조회수 count 실패 ");
				jsResponse("ERROR : view count error", "notice.do?command=list", response);
			}

		}else if(command.equals("updateform")) {
			/************** update Form ***************/
			
						int postNo = Integer.parseInt(request.getParameter("postNo"));
						String postTitle = request.getParameter("title");
						String postContent = request.getParameter("content");
						
						PostDto post = new PostDto();
						
						post.setPostNo(postNo);
						post.setPostTitle(postTitle);
						post.setPostContent(postContent);
						
						request.setAttribute("post", post);
						
						dispatch("notice_edit.jsp", request, response);
						
						
		}else if(command.equals("update")) {
			/************** UPDATE ***************/
			
			int postNo = Integer.parseInt(request.getParameter("postNo"));
			String postTitle = request.getParameter("title");
			String postContent = request.getParameter("content");
			
			boolean res = ps.updatePost("NOTICE", postNo,postTitle,postContent);
			
			if(res) {
				jsResponse("수정 성공", "notice.do?command=detail&no="+postNo, response);
			}
			else {
				jsResponse("수정 실패", "notice.do?command=detail&no="+postNo, response);
			}
			
		}else if(command.equals("delete")) {
			/************** DELETE ***************/
			
			int postNo = Integer.parseInt(request.getParameter("no"));
			boolean res = ps.deletePost("NOTICE", postNo);
			
			if(res) {
				jsResponse("삭제 성공", "notice.do?command=list", response);
			}
			else {
				jsResponse("수정 실패", "notice.do?command=detail&no="+postNo, response);
			}
		}else if(command.equals("writeform")) {
			/************** write Form ***************/
			
			dispatch("notice_write.jsp", request, response);
			
		}else if(command.equals("write")) {
			/************** WRITE ***************/
			
			String userId = request.getParameter("userId");
			String postTitle = request.getParameter("title");
			String postContent = request.getParameter("content");
			
			boolean res = ps.writePost("NOTICE",userId, postTitle, postContent);
			
			if(res) {
				jsResponse("글 작성 성공", "notice.do?command=list", response);
			}
			else {
				jsResponse("글 작성 실패", "notice.do?command=writeform", response);
			}
		}else if(command.equals("answerform")) {
			/************** answer Form ***************/
			
			int parentNo = Integer.parseInt(request.getParameter("parentNo"));
			PostDto parentPost = ps.detailPost("NOTICE", parentNo);
			
			request.setAttribute("parentPost", parentPost);
			dispatch("notice_answer.jsp", request, response);
			
		}else if(command.equals("answer")) {
			/************** ANSWER ***************/
			
			int parentNo = Integer.parseInt(request.getParameter("parentNo"));
			
			String postTitle = request.getParameter("title");
			String postContent = request.getParameter("content");
			String userId = request.getParameter("userId");
			
			PostDto parentPost = ps.detailPost("NOTICE", parentNo);
			
			boolean res = ps.writeAnswer("NOTICE", parentPost, postTitle, postContent, userId);
			
			if(res) {
				jsResponse("답변 성공", "notice.do?command=list", response);
			}
			else {
				jsResponse("답변 실패", "notice.do?command=writeform", response);
			}
			
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
