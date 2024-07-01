package com.saeyan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploardServlet
 */
// upload.do로 uri 패턴을 작성하면 JSPServlet과 충돌해 오류가 난다.
@WebServlet("/upload")
public class UploardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 설정
		
		// 1. 입력 텍스트 한글처리
		request.setCharacterEncoding("UTF-8");
		// 2. 출력되는 한글 설정
		response.setContentType("text/html; charset=UTF-8");
		// 3. 출력 객체 - JSP에서는 기본 객체 : server -> client 데이터 전송
		// - HTML 태그를 문자열로 만들어서 보낸다.
		PrintWriter out = response.getWriter();
		
		// 여기를 바꿔주면 다운받는 경로가 바뀜
		String savePath = "upload";
		// - 실제적으로 저장되어 지는 위치(절대 위치) - 드라이브:/폴더/.../파일명
		// - upload -서버 기준으로한 위치 - 현재 위치에 upload라는 폴더 - 없으면 오류
		// 최대 업로드 파일 크기 5MB로 제한
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		// File 객체 - 파일과 폴더를 조작하는 객체
		File saveFolder = new File(uploadFilePath);
		System.out.println("폴더 존재 여부 출력 = " + saveFolder.exists());
		if(!saveFolder.exists()) {
			saveFolder.mkdir(); // 없는 폴더 생성
			System.out.println("----- 폴더를 생성하였습니다. -----");
		}
		
		System.out.println("서버상의 실제 디렉토리 :");
		System.out.println(uploadFilePath);
		
		// 5. 파일의 최대 크기 100MB -> 100 * 1024 * 1024
		int uploadFileSizeLimit = 100 * 1024 * 1024;
		// 6. Httprequest -> MultipartRequest : 데이터 이동 - 한글 처리 필요
		String encType = "UTF-8";
		
		
		try {
			// new MultipartRequest(request, 저장위치, 사이즈제한, encoding, 중복 처리)
			// 1. request의 데이터는 사라진다. ->  multi.getParameter() 사용
			// 2. 중복처리 -> 파일명1.확장명 -> 파일명2.확장명
			// 3. 저장위치에 파일이 업로드 된 상태가 된다.
			// 	- multi.getFilesystemName("name"); // 서버에 올라간 파일 이름 
			// 	- multi.getOriginalFileName("name"); // 클라이언트의 파일 이름
			MultipartRequest multi = new MultipartRequest(
					request, // request 객체
					uploadFilePath, // 서버상의 실제 디렉토리
					uploadFileSizeLimit, // 최대 업로드 파일 크기
					encType, // 인코딩 방법
					new DefaultFileRenamePolicy() // 동일한 이름이 존재하면 새로운 이름이 부여됨
					);
			
			String fileName = multi.getFilesystemName("uploadFile");
			String originalFileName = multi.getOriginalFileName("uploadFile");
			System.out.println("fileName(서버에 올라간 파일명): " + fileName);
			System.out.println("originalFileName(사용자가 올린 파일명): " + originalFileName);
			//response.setHeader("content-Disposition", "attachment; filename=" + fileName + ";"); // 사용자가 다운로드시 이름 변경
			//(서버에 올라간 파일명과, 사용자가 올린 파일명을 둘다 DB에 저장해서 사용자가 올린 파일명으로)
			if (fileName == null) { // 파일이 업로드 되지 않았을때
				System.out.println("파일이 업로드 되지 않았을때");
			} else {  // 파일이 업로드 되었을때
				out.println("<html>");
				out.println("<head>");
				out.println("</head>");
				out.println("<body>");
				out.println("<br> 글쓴이 :" + multi.getParameter("name"));
				out.println("<br> 제 목 :" + multi.getParameter("title"));
				out.println("<br> 파일명 :" + fileName);
				out.println("<br>"+"<a href= '/" + savePath + "/" + fileName + "' " + "download >"+ fileName + "</a>" + "<br>");
				out.println("<br>"+"<image src= '/" + savePath + "/" + fileName + "' " + "download >"+"<br>");
				out.println("</body>");
				out.println("</html>");
			} // end of else
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외 발생 : " + e);
		} // end of catch
	}

}
