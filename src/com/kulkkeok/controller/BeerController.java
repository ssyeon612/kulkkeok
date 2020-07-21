package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpRetryException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.BookMarkDto;
import com.kulkkeok.model.dto.ReviewDto;
import com.kulkkeok.model.dto.StarAvgDto;
import com.kulkkeok.service.beer.BeerService;
import com.kulkkeok.service.beer.BeerServiceImpl;
import com.kulkkeok.service.bookmark.BookMarkService;
import com.kulkkeok.service.bookmark.BookMarkServiceImpl;
import com.kulkkeok.service.review.ReviewService;
import com.kulkkeok.service.review.ReviewServiceImpl;

@WebServlet("/BeerController")
public class BeerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BeerController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		BeerService service = new BeerServiceImpl();
		ReviewService service_r = new ReviewServiceImpl();
		BookMarkService service_b = new BookMarkServiceImpl();
		
		PrintWriter out = response.getWriter();
		
		
		//맥주 전체 리스트 가져오기
		if(command.equals("beerinfo")) {
			List<BeerDto> list = service.AllBeerList();
			request.setAttribute("list", list);
			
			dispatch("beerinfo.jsp", request, response);
			
		//맥주 이름 클릭시 해당 맥주 정보 가져오기	
		} else if(command.equals("beerdetail")) {

			HttpSession session = request.getSession();
			
			int beerNo = Integer.parseInt(request.getParameter("beerno"));
			
			
			//이미 북마크 했는지 안했는지 확인 (했을경우 하트가 채워져있음)
			boolean is = false;
			if(session.getAttribute("user") != null) {
				String userId = ((UserDto) session.getAttribute("user")).getUserId();
				is = service_b.confirmBookmarkBeer(beerNo, userId);
			}
			//맥주정보
			BeerDto dto = service.selectOne(beerNo);
			request.setAttribute("dto", dto);
			
						
			request.setAttribute("is", is);
			
			//좋아요 갯수
			int bkCnt = service_b.countBookMark(beerNo);
			request.setAttribute("bkCnt", bkCnt);
			
			
			//별점 평균
			StarAvgDto starAvg = service.updateStarAvg(beerNo);
			request.setAttribute("star", starAvg);
			
			//해당 맥주의 리뷰
			List<ReviewDto> list = service_r.getBeerReviewList(beerNo);
			request.setAttribute("list", list);
			
			dispatch("beerdetail.jsp", request, response);
			
			
			//나라별 맥주 정보 가져오기
		} else if(command.equals("beerorigin")) {
			
			String origin = request.getParameter("beerorigin");
			
			if(origin.equals("OTHERS")) {
				List<BeerDto> ori_list_others = service.otherOriginBeerList();
				request.setAttribute("list", ori_list_others);
				
			} else {
			
			List<BeerDto> ori_list = service.TypeOfBeerListOrigin(origin);
			request.setAttribute("list", ori_list);
			}
			
			dispatch("beerinfo.jsp", request, response);
			
			
			//종류별 맥주 정보 가져오기
		} else if(command.equals("beertype")) {
			
			String type = request.getParameter("beertype");
			//System.out.println("type: "+type);
			
			if(type.equals("OTHERS")) {
				List<BeerDto> type_list_others = service.otherTypeBeerList();
				request.setAttribute("list", type_list_others);
				
			} else {
				
			List<BeerDto> type_list = service.TypeOfBeerListType(type);
			request.setAttribute("list", type_list);
			}
			
			dispatch("beerinfo.jsp", request, response);
			
			//이름 검색시 해당 맥주 정보 가져오기
		} else if(command.equals("searchbeername")) {
			
			String name = request.getParameter("beername");
			List<BeerDto> name_list = service.TypeOfBeerListName(name);
			request.setAttribute("list", name_list);
			dispatch("beerinfo.jsp", request, response);
			
			
			//북마크 추가하기
		} else if(command.equals("bookmarkbeer")) {
			
			String bookmarkbeer = request.getParameter("bookMarkBeer");
			String userid = request.getParameter("userId");
			int beerno = Integer.parseInt(request.getParameter("beerNo"));
			
			BookMarkDto dto = new BookMarkDto(beerno, userid, bookmarkbeer);
			boolean res = service_b.addBookMarkBeer(dto);
			
			if(res) {
				jsResponse("북마크 성공!","beer.do?command=beerdetail&beerno="+beerno,response);
			} else {
				dispatch("beer.do?command=beerinfo",request,response);
			}
			
			
			//북마크 취소하기
		} else if(command.equals("removebookmarkbeer")) {
			
			int beerNo = Integer.parseInt(request.getParameter("beerNo"));
			String userid = request.getParameter("userId");
			String bookmarkbeer = request.getParameter("bookMarkBeer");
			
			BookMarkDto dto = new BookMarkDto(beerNo, userid, bookmarkbeer);
			boolean res = service_b.removeBookmarkBeer(dto);
			
			if(res) {
				jsResponse("북마크 제거!","beer.do?command=beerdetail&beerno="+beerNo,response);
			}else {
				dispatch("beer.do?command=beerinfo",request,response);
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
