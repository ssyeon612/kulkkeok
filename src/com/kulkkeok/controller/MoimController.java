package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.SMTPAuthenticatior;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.service.moim.MoimService;
import com.kulkkeok.service.moim.MoimServiceImpl;
import com.kulkkeok.service.moimComment.MoimCommentService;
import com.kulkkeok.service.moimComment.MoimCommentServiceImpl;

@WebServlet("/MoimController")
public class MoimController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static int pageSize = 5;

       
    public MoimController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");

		MoimService service = new MoimServiceImpl();
		
		if(command.equals("moim")) {
			//날짜 지나지 않은 모임만 보이게
			List<MoimDto> list = service.getMoimListNotClosed();
			request.setAttribute("list", list);
			
			System.out.println(list);
			
			dispatch("moim.jsp", request, response);
		
		}else if(command.equals("moim_more")) {
			//모든 모임 리스트 보이게
			//페이징 필요
			
			int totalMoim = service.totalMoim(); //전체 게시글 수(DB에서 불러옴)
//			int pageSize = 5; //화면에 보여질 게시글 개수
			
			if(request.getParameter("pageSize") != null) {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}else {
				pageSize = 5;
			}

			int pageNum = 1;
			
			if(request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			
			//총 페이지 개수
			int totalPage = totalMoim/pageSize + (totalMoim%pageSize==0? 0 : 1);
			
			//유효성 검사
			if(pageNum <= 0 || pageNum > totalPage) {
				pageNum = 1;
			}
			
			
			//현재 페이지에 보여줄 시작 번호, 끝 번호(DB에서 불러옴)
			int startRow = (pageNum-1)*pageSize+1;
			int endRow = pageNum*pageSize;
			if(endRow>totalMoim) {
				endRow = totalMoim;
			}
			
			//최신글 3개를 기준으로 게시글 리턴
			List<MoimDto> list = service.getAllMoimList(startRow, endRow);

			//출력할 페이지의 맨 위 글번호
			int number = totalMoim - (pageNum-1) * pageSize;
			
			int blockSize = 5;
			
			int startPage = (pageNum/blockSize-(pageNum%blockSize!=0?0:1)) *blockSize+1;
			int endPage = startPage + blockSize - 1;
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			MoimCommentService ms = new MoimCommentServiceImpl();
			Map<Integer, Integer> cmtCnt = ms.getCommentCount(startRow, endRow);
			
			System.out.println("in Controller : "+cmtCnt);
			
			request.setAttribute("list", list);
			request.setAttribute("number", number);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("cmtCnt", cmtCnt);
			
			//System.out.println(cmtCnt);
			
			
			dispatch("moim_more.jsp", request, response);

		}else if(command.equals("view")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			MoimDto dto = service.getMoimDetail(moimNo);
			request.setAttribute("dto", dto);
			dispatch("moim_view.jsp", request, response);
			
		}else if(command.equals("moim_edit")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			MoimDto dto = service.getMoimDetail(moimNo);
			request.setAttribute("dto", dto);
			dispatch("moim_edit.jsp", request, response);
			
		}else if(command.equals("update")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			String categoryNo = request.getParameter("categoryNo");
			String moimTitle = request.getParameter("moimTitle");
			java.sql.Date moimDate = java.sql.Date.valueOf(request.getParameter("moimDate"));
			String moimPlaceName = request.getParameter("moimPlaceName");
			String moimPlaceAdd = request.getParameter("moimPlaceAdd");
			String moimContent = request.getParameter("moimContent");
		
			int res = service.update(moimNo, categoryNo, moimTitle, moimDate, moimPlaceName, moimPlaceAdd, moimContent);

			if(res>0) {
				jsResponse("글 수정 성공", "moim.do?command=view&moimNo="+moimNo, response);
			}else {
				jsResponse("글 수정 실패", "moim.do?command=moim_edit&moimNo="+moimNo, response);
			}
			

		}else if(command.equals("delete")) {
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			int res = service.delete(moimNo);
			
			if(res>0) {
				jsResponse("글 삭제 성공", "moim.do?command=moim_more", response);
			}else {
				jsResponse("글 삭제 실패", "moim.do?command=view&moimNo="+moimNo, response);
			}
			
		}else if(command.equals("write")) {
			response.sendRedirect("moim_write.jsp");
		
		}else if(command.equals("moim_write")) {
			String categoryNo = request.getParameter("categoryNo");
			String moimTitle = request.getParameter("moimTitle");
			java.sql.Date moimDate = java.sql.Date.valueOf(request.getParameter("moimDate"));
			String moimPlaceName = request.getParameter("moimPlaceName");
			String moimPlaceAdd = request.getParameter("moimPlaceAdd");
			String moimContent = request.getParameter("moimContent");
			String userId = request.getParameter("userId");
			Date today = new Date(System.currentTimeMillis());
			
			if(today.after(moimDate)) {
				jsResponse("모임 일자가 잘못되었습니다.", "moim.do?command=write", response);
			} else {
			
				int res = service.insertOne(categoryNo, moimTitle, userId, moimDate, moimPlaceName, moimPlaceAdd, moimContent);
			
				if(res>0) {
					jsResponse("글 작성 성공", "moim.do?command=moim_more", response);
				}else {
					jsResponse("글 작성 실패", "moim.do?command=write", response);
				}
			}
			
		}else if(command.equals("applyform")) {
			//글쓴이의 이메일을 가져와야한다.
			int moimNo = Integer.parseInt(request.getParameter("moimNo"));
			String moimTitle = request.getParameter("moimTitle");
			UserDto userDto = service.getWriterEmail(moimNo);
			
			request.setAttribute("userDto", userDto);
			request.setAttribute("moimTitle", moimTitle);
			
			dispatch("moim_apply.jsp", request, response);
		
		}else if(command.equals("moim_apply")) {
			
			String moimTitle = request.getParameter("moimTitle");
			String userEmail = request.getParameter("userEmail");
			String emailContent = request.getParameter("emailContent");
			emailContent = emailContent.replace("\r\n","<br>");
				
	        Properties props = new Properties();
	        props.put("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.socketFactory.port", "465");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.socketFactory.fallback", "false");
	        props.put("mail.smtp.auth", "true");

	        try {
				Authenticator auth = new SMTPAuthenticatior();
				Session ses = Session.getInstance(props, auth);
					
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
					
				msg.setSubject(moimTitle);
					
				StringBuffer buffer = new StringBuffer();
				buffer.append(emailContent);
					
				Address fromAddr = new InternetAddress("kulkkeok@gmail.com");
				msg.setFrom(fromAddr);
					
				Address toAddr = new InternetAddress(userEmail);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
					
				msg.setContent(buffer.toString(), "text/html; charset=UTF-8");
				Transport.send(msg);
				System.out.println("전송 성공");
				//jsResponse("메일 전송 성공", "main.do?command=main", response);
					
				String s = "<script type='text/javascript'>"
							+ "alert('메일 전송 성공');"
							+ "window.close();"
							+ "</script>";
					
				PrintWriter out = response.getWriter();
				out.print(s);
					
			}catch(Exception e) {
				System.out.println("전송 실패");
				jsResponse("메일 전송 실패", "contact.do?command=contact", response);
				e.printStackTrace();
				return;
			}
			
	      //주소 검색
		}else if(command.equals("selectPlaceWindow")) {
			response.sendRedirect("moim_selectPlace.jsp");
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
