package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kulkkeok.model.dto.NaverDto;
import com.kulkkeok.model.dto.UserDto;
import com.kulkkeok.service.login.LoginService;
import com.kulkkeok.service.login.LoginServiceImpl;
import com.kulkkeok.service.register.RegisterService;
import com.kulkkeok.service.register.RegisterServiceImpl;

//@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
   public LoginController() {}
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      String command = request.getParameter("command");
      System.out.println("[" + command + "]");
      
      LoginService service = new LoginServiceImpl();
      RegisterService service_r = new RegisterServiceImpl();
      HttpSession session = request.getSession();
      
      if(command.equals("home")) {
         response.sendRedirect("main.do?command=main");
      }
      else if(command.equals("findIdPage")) {
         dispatch("findId.jsp", request, response);
      }
      else if(command.equals("findPwPage")) {
         dispatch("findPwd.jsp", request, response);
      }
      else if(command.equals("loginPage")) {
         dispatch("login.jsp", request, response);
      }
      else if(command.equals("login")) {
         //Login
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");

         
         UserDto dto = service.login(id,pw);
         
         // Login success
         if(dto != null) {
            // 이름 dto->user 로 변경 
            session.setAttribute("user", dto);
            session.setMaxInactiveInterval(-1); 
            
            // System.out.println("session = " + session);
            
            jsResponse(id+"님 환영합니다.","main.do?command=main" ,response);
            
         }
         else {
            //jsResponse("로그인 실패","login.jsp" ,response);
            jsResponse("아이디나 비밀번호를 잘못 입력하셨습니다.","login.do?command=loginPage" ,response);
         }
      }
      else if(command.equals("logout")){
         //세션을 삭제하고 인덱스로 보낼 것이다.
         session.invalidate(); // 세션 삭제
         jsResponse("로그아웃 되었습니다.", "main.do?command=main", response);
      }
      else if(command.equals("findId")) {
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         //System.out.println("name : " + name + ", email : " + email);
         
         String id = service.findId(name, email);
         //System.out.println(id);
         
         if(id != null)
            jsResponse(name+"님의 아이디는 "+id+"입니다.", "login.do?command=loginPage", response);
         else
            jsResponse("입력하신 정보가 틀렸거나, 아이디가 존재하지 않습니다.", "findId.jsp", response);
      }
      else if(command.equals("findPw")) {
         String name = request.getParameter("name");
         String id = request.getParameter("id");
         String email = request.getParameter("email");
         //System.out.println("name : " + name + ", id : " + id + ", email : " + email);
         
         String pw = service.findPw(name, id, email);
         //System.out.println(pw);
         
         if(pw != null) {
            String returnPw = "";
            for(int i=0; i<pw.length(); i++) {
               if(i<(pw.length()/2))
                  returnPw += pw.substring(i, i+1);
               else
                  returnPw += "*";
            }
            //System.out.println(returnPw);
            
            jsResponse(name+"님의 비밀번호는 "+returnPw+"입니다.", "login.do?command=loginPage", response);            
         }
         else
            jsResponse("입력하신 정보가 틀렸습니다.", "findPwd.jsp", response);
         
      }else if(command.equals("nlogin")) {
    	  
    	  String nid = request.getParameter("nid");
          String nemail = request.getParameter("nemail");
          String nname = request.getParameter("nname");
          String realId = nemail.substring(0, nemail.indexOf("@")); //진짜 아이디
          String password = realId;
          String phoneNumber = "01000000000";
          
          UserDto user = new UserDto(realId,password,nname,nemail,phoneNumber,"",null);
          
          session.setAttribute("user", user);
          
          session.setMaxInactiveInterval(-1); 
          
         if(service.findId(user.getUserName(), user.getUserEmail())!=null) {
        	 
        	 System.out.println("이미 존재하는 정보 입니다.");
        	 jsResponse(realId+"님 환영합니다.","main.do?command=main" ,response);
        	 
         } else {
        	 
        	 System.out.println("존재하지 않는 정보 입니다. 새로 유저테이블에 저장합니다.");
        	 service_r.insert(user);
        	 jsResponse(realId+"님 환영합니다.","main.do?command=main" ,response);
         } 
    	  
      }else if(command.equals("klogin")) {
    	  
    	  String id = request.getParameter("kid");
    	  String name = request.getParameter("kname");
    	  
    	  String realEmail = id.concat("@kakaotalk.com");
    	  String phoneNumber = "01000000000";
    	  
    	  UserDto user = new UserDto (id, "1234", name, realEmail, phoneNumber, "", null);
    	  
    	  session.setAttribute("user", user);
    	  
    	  session.setMaxInactiveInterval(-1); 
    	  
    	  if(service.findId(user.getUserName(), user.getUserEmail())!=null) {
         	 
         	 System.out.println("이미 존재하는 정보 입니다.");
         	 jsResponse(name+"님 환영합니다.","main.do?command=main" ,response);
         	 
          } else {
         	 
         	 System.out.println("존재하지 않는 정보 입니다. 새로 유저테이블에 저장합니다.");
         	 service_r.insert(user);
         	 jsResponse(name+"님 환영합니다.","main.do?command=main" ,response);
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