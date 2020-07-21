package com.kulkkeok.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kulkkeok.service.admin.AdminService;
import com.kulkkeok.service.admin.AdminServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/beerInsert.do")
public class BeerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminService ac = null;      

    public BeerInsertController() {
        super();
        ac = new AdminServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


			int maxSize = 1024 * 1024 * 10;
			
			if(!ServletFileUpload.isMultipartContent(request)) {
				jsResponse("multipart-data error", "main.do?command=main", response);
			}
			
			String url = request.getSession().getServletContext().getRealPath("/");
			System.out.println("url : " + url);
			String savePath = url+"img"+"\\"+"beer";
			System.out.println("savePath : " + savePath);
			
			MultipartRequest mrequest = new MultipartRequest(
					request, savePath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			
			String beerKorName = mrequest.getParameter("beer_kor").trim();
			String beerEngName = mrequest.getParameter("beer_eng").trim();
			String beerOrigin = mrequest.getParameter("beer_origin").trim();
			String beerType = mrequest.getParameter("beer_type").trim();
			String beerAbv = mrequest.getParameter("beer_abv").trim();
			String beerDetail = mrequest.getParameter("beer_detail").trim();
			String originFileName = mrequest.getFilesystemName("beer_img");
			
			if(originFileName != null) {
				int lastBeerNo = ac.getLastBeerNo()+1;
				
				if(lastBeerNo==1) {
					jsResponse("lastBeerNo error", "main.do?command=main", response);
				}else {
				
				String beerPic = lastBeerNo + ". "+ beerKorName;
				
				String renameFileName = lastBeerNo + ". "+ beerKorName + originFileName.substring(originFileName.lastIndexOf("."));
				
				System.out.println("renameFileName : "+renameFileName);
				
				File originFile = new File(savePath + "\\" + originFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);
				
				if (!originFile.renameTo(renameFile)) {

					int read = -1;

					byte[] buf = new byte[1024];

					// 한번에 읽을 배열 크기 지정

					FileInputStream fin = new FileInputStream(originFile);

					FileOutputStream fout = new FileOutputStream(renameFile);

					while ((read = fin.read(buf, 0, buf.length)) != -1) {

					fout.write(buf, 0, read);

					}

					fin.close();

					fout.close();

					originFile.delete(); // 원본 파일 삭제함

					}
				response.setContentType("text/html; charset=utf-8");
				
				int res = ac.insertBeer(beerKorName,beerEngName,beerOrigin,beerType,beerAbv,beerDetail,beerPic,lastBeerNo);

				if(res>0) {
					jsResponse("맥주 등록 성공!", "beer.do?command=beerdetail&beerno="+lastBeerNo, response);
				}else {
					jsResponse("맥주 등록 실패!", "admin.do?command=beerinsert", response);
				}
				
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
