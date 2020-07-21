package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import org.omg.PortableInterceptor.DISCARDING;

import com.kulkkeok.SMTPAuthenticatior;

//@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContactController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("contact")) {
			String category = request.getParameter("category");
			String message = request.getParameter("message");
			String title = request.getParameter("title");
			String email = request.getParameter("email");
			String to = request.getParameter("to");
			String from = request.getParameter("from");
			
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
				
				msg.setSubject(title);
				
				StringBuffer buffer = new StringBuffer();
				buffer.append("["+category+"]<br><br>");
				buffer.append(message+"<br><br>");
				buffer.append("회신 받을 이메일 주소 : " +email);
				
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				
				msg.setContent(buffer.toString(), "text/html; charset=UTF-8");
				Transport.send(msg);
				System.out.println("전송 성공");
				jsResponse("메일 전송 성공", "main.do?command=main", response);
				
			}catch(Exception e) {
				System.out.println("전송 실패");
				jsResponse("메일 전송 실패", "contact.do?command=contact", response);
				e.printStackTrace();
				return;
			}
			
		}else if(command.equals("contactForm")) {
			dispatch("contact.jsp", request, response);
		}

	
	
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
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

	// dispatch
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	


}
