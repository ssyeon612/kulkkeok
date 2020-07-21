package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.service.login.LoginServiceImpl;
import com.kulkkeok.service.mypage.MypageService;
import com.kulkkeok.service.mypage.MypageServiceImpl;

//@WebServlet("/MypageController")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MypageService ms = null; 
    private HttpSession session = null;
	
    public MypageController() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	ms = new MypageServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command : [ "+command+" ]");
		
		if(command.equals("myInfo")) {
			//HttpSession session = request.getSession();
			
			//UserDto userInfo = (UserDto) session.getAttribute("user");
			//request.setAttribute("userInfo", userInfo);
			
			dispatch("mypage_my.jsp", request, response);

		}else if (command.equals("myBookmark")){
			session = request.getSession();
			String userId = ((UserDto)session.getAttribute("user")).getUserId();
			
			//System.out.println("userId : "+userId);
			
			List<BeerDto> BookmarkList = ms.getMyBookmarkList(userId);
			//System.out.println(list.size());
			request.setAttribute("bookmark", BookmarkList);
			dispatch("mypage_mybeer.jsp", request, response);
			
		}else if (command.equals("myReview")){
			
			session = request.getSession();
			
			String userId = ((UserDto)session.getAttribute("user")).getUserId();
			
			List<ReviewDto> reviewList = ms.getMyReviewList(userId);
			
			if(!reviewList.isEmpty()) {
				List<BeerDto> blist = ms.getBeerList(reviewList);
				request.setAttribute("blist", blist);
			}
			
			request.setAttribute("list", reviewList);
			
			dispatch("mypage_myreview.jsp", request, response);
			
		}else if (command.equals("myMoim")){
			
			session = request.getSession();
			String userId = ((UserDto)session.getAttribute("user")).getUserId();
			
			List<MoimDto> moimList = ms.getMyMoimList(userId);
			
			request.setAttribute("moims", moimList);
			
		

			dispatch("mypage_mymoim.jsp", request, response);
			
		}else if (command.equals("unsubscrilbe")){
			
			dispatch("mypage_unsubscrilbe.jsp", request, response);
			
		}else if(command.equals("updateUser")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			
			// test
			//System.out.print("id : "+ id +" , ");
			//System.out.print("name : "+ name +" , ");
			//System.out.print("password : "+ password +" . ");
			//System.out.print("tel : "+ tel +" , ");
			//System.out.print("email : "+ email +" ");
			
			boolean res = ms.updateUser(id, name, password, tel, email);
			
			if(res) {
				UserDto dto = new LoginServiceImpl().login(id,password);
				
				session = request.getSession();
				
				session.removeAttribute("user");
				session.setAttribute("user", dto);
				session.setMaxInactiveInterval(-1); 
				
				jsResponse("정보가 수정되었습니다.", "mypage.do?command=myInfo", response);
				
			}else {
				jsResponse("수정에 실패하였습니다.", "mypage.do?command=myInfo", response);
			}
			
		}else if(command.equals("leave")) {
			session = request.getSession();
			UserDto user = (UserDto) session.getAttribute("user");
			
			String userId = user.getUserId();
			String userPw = user.getUserPw();
			
			boolean res = ms.deleteUser(userId, userPw);
			
			if(res) {
				session.removeAttribute("user");
				session.invalidate();
				jsResponse("탈퇴되었습니다.", "main.do?command=main", response);
				
			}else {
				jsResponse("탈퇴오류.", "mypage.do?command=unsubscrilbe", response);
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
