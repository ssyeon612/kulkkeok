package com.kulkkeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.WorldCup;
import com.kulkkeok.service.worldcup.WorldCupService;
import com.kulkkeok.service.worldcup.WorldCupServiceImpl;

//@WebServlet("/WorldCupController")
public class WorldCupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WorldCupService wcs = null; 
    
    public WorldCupController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	wcs = new WorldCupServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command : [ "+command+" ]");
		int round = 0;
		int vsBeerNo1=0,vsBeerNo2 =0;
		WorldCup game = null;
		
		if(command.equals("start")) {
			
			dispatch("worldcup_start.jsp", request, response);
			
		}else if(command.equals("play")) {
			// 첫 게임 시작!
			
			int gang = Integer.parseInt(request.getParameter("gang")); // 몇 강인지.
			
				//System.out.println("check");
			
				wcs.getWorldCupGame(gang);
				wcs.getBeerList();
				
				vsBeerNo1 = 0;
				vsBeerNo2 = 1;				
	
			System.out.println("<<월드컵 시작! gang: " + gang+" >>");
			
			
			request.setAttribute("beer1", wcs.getBeerDto(vsBeerNo1));
			request.setAttribute("beer2", wcs.getBeerDto(vsBeerNo2));
			
			request.setAttribute("gang",wcs.getGang());
			
			System.out.println("<< beer1 : "+wcs.getBeerDto(vsBeerNo1).getBeerKorName() + " : "+wcs.getBeerDto(vsBeerNo1).getBeerNo()+">>");
			System.out.println("<< beer2 : "+wcs.getBeerDto(vsBeerNo2).getBeerKorName() + " : "+wcs.getBeerDto(vsBeerNo2).getBeerNo()+">>");
			
			dispatch("worldcup_play.jsp", request, response);
			
		}else if(command.equals("vs")) {
			PrintWriter out = response.getWriter();
			
			int index = Integer.parseInt(request.getParameter("index"));
			
			String jsoninfo = wcs.getBeerVs(index);
			
			out.write(jsoninfo);
			
		}else if(command.equals("nextRound")) {
			
			int gang = Integer.parseInt(request.getParameter("gang"));
			String winList = request.getParameter("winList");
			
			System.out.println("<< nextRound : "+gang+"강 시작! >>");
			wcs.setWinList(winList,gang);
			wcs.getBeerList();
			
			vsBeerNo1 = 0;
			vsBeerNo2 = 1;	
			
			request.setAttribute("beer1", wcs.getBeerDto(vsBeerNo1));
			request.setAttribute("beer2", wcs.getBeerDto(vsBeerNo2));
			
			System.out.println("<< beer1 : "+wcs.getBeerDto(vsBeerNo1).getBeerKorName() + " : "+wcs.getBeerDto(vsBeerNo1).getBeerNo()+">>");
			System.out.println("<< beer2 : "+wcs.getBeerDto(vsBeerNo2).getBeerKorName() + " : "+wcs.getBeerDto(vsBeerNo2).getBeerNo()+">>");
			
			request.setAttribute("gang", wcs.getGang());
			
			System.out.println("gang : "+wcs.getGang());
			dispatch("worldcup_play.jsp", request, response);
			
			//System.out.println(winList);
			
			
		}else if(command.equals("winBeer")) {
			String win = request.getParameter("win");
			BeerDto winBeer = wcs.getWinBeer(Integer.parseInt(win));
			request.setAttribute("winBeer", winBeer);
			
			dispatch("wordcup_win.jsp", request, response);
		}else if(command.equals("ranking")) {
			Map<BeerDto,Integer> map = wcs.getRanking();
			
			
			List<Map.Entry<BeerDto,Integer>> list = new LinkedList<>(map.entrySet());
	        
	        Collections.sort(list, new Comparator<Map.Entry<BeerDto,Integer>>() {
	            @Override
	            public int compare(Map.Entry<BeerDto,Integer> o1, Map.Entry<BeerDto,Integer> o2) {
	                int comparision = (o1.getValue() - o2.getValue()) * -1;
	                return comparision == 0 ? (o1.getKey().compareTo(o2.getKey())==true)?1:0 : comparision;
	            }
	        });
	        
	        // 순서유지를 위해 LinkedHashMap을 사용
	        Map<BeerDto,Integer> sortedMap = new LinkedHashMap<>(); 
	        
	        for(Iterator<Map.Entry<BeerDto,Integer>> iter = list.iterator(); iter.hasNext();){
	            Map.Entry<BeerDto,Integer> entry = iter.next();
	            sortedMap.put(entry.getKey(), entry.getValue());
	        }
	        
	        System.out.println(sortedMap);
			
			
			request.setAttribute("ranking", sortedMap);
			
			dispatch("confirm_ranking.jsp", request, response);
			
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
