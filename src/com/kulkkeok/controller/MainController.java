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

import com.kulkkeok.model.dto.BestbeerDto;
import com.kulkkeok.model.dto.RecentReviewDto;
import com.kulkkeok.service.beer.BeerService;
import com.kulkkeok.service.beer.BeerServiceImpl;
import com.kulkkeok.service.main.MainService;
import com.kulkkeok.service.main.MainServiceImpl;


@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");

		MainService service = new MainServiceImpl();
		BeerService bs = new BeerServiceImpl();
		
		if(command.equals("main")) {
			//response.sendRedirect("home.jsp");

			List<RecentReviewDto> review = service.getRecentReviewList();
			List<BestbeerDto> bestStar = service.bestStar();
			List<BestbeerDto> countReview = service.countReview();
			
			
			request.setAttribute("review", review);
			request.setAttribute("bestStar", bestStar);
			request.setAttribute("countReviews", countReview);
			
			System.out.println(review);
			dispatch("home.jsp", request, response);
		
		}else if(command.equals("failed")) {
			response.sendRedirect("index_failed.html");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	//requestDispatcher를 여러번 사용해야 하기 때문에 메소드를 따로 만든다
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	//자바스크립트 실행 메소드
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
						+ "alert('"+msg+"');"
						+ "location.href='"+url+"';"
				+ "</script>";
					
		PrintWriter out = response.getWriter();
		out.print(s);
	}


}
