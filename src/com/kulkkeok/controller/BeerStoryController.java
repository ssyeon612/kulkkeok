package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kulkkeok.model.dto.BeerStoryDto;
import com.kulkkeok.service.beerStory.BeerStoryService;
import com.kulkkeok.service.beerStory.BeerStoryServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//@WebServlet("/BeerStoryController")
public class BeerStoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BeerStoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		BeerStoryService service = new BeerStoryServiceImpl();
		
		if(command.equals("beerStory")) {
			List<BeerStoryDto> list = service.getAllList();
			request.setAttribute("list", list);
			dispatch("beerstory.jsp", request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("beerstory_write.jsp");
		
			
		}else if(command.equals("updateform")) {
			int storyNo = Integer.parseInt(request.getParameter("storyNo"));
			System.out.println(storyNo);
			
			request.setAttribute("dto", service.selectOne(storyNo));
			dispatch("beerstory_edit.jsp", request, response);
			
		}else if(command.equals("delete")) {
			int storyNo = Integer.parseInt(request.getParameter("storyNo"));
			
			int res = service.deleteOne(storyNo);
			
			if(res>0) {
				jsResponse("글 삭제 성공", "beerStory.do?command=beerStory", response);
			}else {
				response.sendRedirect("beerStory.do?command=beerStory");
			}
			
		} else if(command.equals("beerStory_write")) {
			doPost(request, response);
		
		} else if(command.equals("update")) {
			int storyNo = Integer.parseInt(request.getParameter("storyNo"));
			String storyName = request.getParameter("storyName");
			String storyLink = request.getParameter("storyLink");
					
			int updateres = service.updateOne(storyNo, storyName, storyLink);
					
			if(updateres>0) {
				jsResponse("글 수정 성공", "beerStory.do?command=beerStory", response);
			}else {
				jsResponse("글 수정 실패", "beerStory.do?command=updateform&storyNo="+storyNo, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MultipartRequest multi = null;

		int writeres = 0;
		int maxsize = 10 * 1024 * 1024;
		String encoding = "UTF-8"; 
	
		ServletContext context = getServletContext();
		String saveDir = context.getRealPath("/img/beer_story");
		System.out.println(saveDir);
		
		multi = new MultipartRequest(request, saveDir, maxsize, encoding, new DefaultFileRenamePolicy());
		
		BeerStoryService service = new BeerStoryServiceImpl();
		
		String command = multi.getParameter("command");
		System.out.println("["+command+"]");
		
		
		if(command.equals("beerStory_write")) {
		
			boolean isMulti = ServletFileUpload.isMultipartContent(request);
		
			if(isMulti) {
			
				String storyName = multi.getParameter("storyName");
				String storyLink = multi.getParameter("storyLink");
				String storyImg = multi.getFilesystemName("storyImg");

				System.out.println(storyName + ", " + storyLink + ", " + storyImg);
		
				try {
					writeres = service.insertOne(storyName, storyLink, storyImg);
		
					if(writeres>0) {
						jsResponse("글 작성 성공", "beerStory.do?command=beerStory", response);
					}else {
						jsResponse("글 작성 실패", "beerStory.do?command=writeform", response);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}	
		}
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
