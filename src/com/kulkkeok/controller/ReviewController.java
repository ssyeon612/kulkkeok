package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.service.beer.BeerService;
import com.kulkkeok.service.beer.BeerServiceImpl;
import com.kulkkeok.service.review.ReviewService;
import com.kulkkeok.service.review.ReviewServiceImpl;

@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		BeerService service = new BeerServiceImpl();
		ReviewService service_r = new ReviewServiceImpl();
		
		PrintWriter out = response.getWriter();
		
		
		//별점이랑 맥주번호를 가지고 리뷰 작성창(팝업창)에 넘겨주기
		if(command.equals("reviewdetail")) {
			
			int beerno = Integer.parseInt(request.getParameter("beerno"));
			int reviewstar = Integer.parseInt(request.getParameter("reviewstar"));
			
			BeerDto dto = service.selectOne(beerno);
			request.setAttribute("dto", dto);
			request.setAttribute("star", reviewstar);
			System.out.println("reviewStar:"+reviewstar);
			
			dispatch("beerdetail_review.jsp", request, response);
			
		
		//리뷰 등록
		} else if(command.equals("beerreview")) {
			
			int beerno = Integer.parseInt(request.getParameter("beerno"));
			System.out.println("beerno: "+beerno);
			int star = Integer.parseInt(request.getParameter("star"));
			
			System.out.println("reviewstar: "+star);
			System.out.println(star);
			String content = request.getParameter("reviewcontent");
			System.out.println("content: "+content);
			String writer = request.getParameter("writer");
			System.out.println("writer: "+writer);
			
			ReviewDto dto = new ReviewDto(content, star, writer, beerno);
			boolean res = service_r.insertReview(dto);
			
			if(res) {
				out.println("<script>alert('리뷰가 등록되었습니다'); window.close(); window.opener.location.reload(); </script>");
			} else {
				dispatch("review.do?command=reviewdetail", request, response);
			}
			
			
		//리뷰 삭제	
		} else if(command.equals("deleteReview")) {
			
			int beerNo = Integer.parseInt(request.getParameter("beerNo"));
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			boolean res = service_r.deleteReview(beerNo, reviewNo);
			
			out.print(res);

			
		//리뷰 수정창(팝업창)으로 값 넘겨주기
		} else if(command.equals("reviewupdate")){
			
			int beerNo = Integer.parseInt(request.getParameter("beerNo"));
			System.out.println("beerno: "+beerNo);
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			System.out.println("reviewNo: "+reviewNo);
			String reviewContent = request.getParameter("reivewContent");
			System.out.println("reviewContent "+reviewContent);
			
			request.setAttribute("beerno", beerNo);
			request.setAttribute("reviewno", reviewNo);
			request.setAttribute("rcontent", reviewContent);
			dispatch("review_edit.jsp", request, response);
			
			
		//리뷰 수정해주기
		} else if(command.equals("updatereview")) {
			
			int beerNo = Integer.parseInt(request.getParameter("beerno"));
			System.out.println("beerno: "+beerNo);
			int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
			System.out.println("reviewNo: "+reviewNo);
			String reviewContent = request.getParameter("rcontent");
			System.out.println("reviewContent: "+reviewContent);
			
			boolean res = service_r.updateReview(reviewNo, reviewContent);
			

			if(res) {
				out.println("<script>alert('리뷰가 수정되었습니다'); window.close(); window.opener.location.reload();  </script>");
			} else {
				dispatch("review.do?command=reviewupdate", request, response);
			}
		
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
