package com.musaic.playlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.musaic.main.controller.Init;
import com.musaic.member.db.LoginVO;
import com.musaic.music.vo.MusicVO;
import com.musaic.playlist.vo.PlaylistVO;
import com.musaic.util.exe.Execute;

public class PlaylistController {
	public String execute(HttpServletRequest request) {
		System.out.println("PlaylistController.execute()--------------");
		// 로그인 처리르 session으로 한다.
		HttpSession session = request.getSession();
		String jsp = null;
		Object result = null;
		String uri = request.getRequestURI();
		Long musicNo = 0L;
		
		// login된 정보 중에서 id를 많이 사용한다.
		String id = null;
		LoginVO login = (LoginVO) session.getAttribute("login");
		// login이 되어 있는 경우만 idfmf 꺼내 온다.
		if(login != null) id =login.getId();
		
		session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		id = null;
		if(loginVO != null) id = loginVO.getId();
		
		try {
			
			switch (uri) {
			case "/playlist/list.do":
				// [BoardController] - (Execute) - BoardListService - BoardDAO.list()
				System.out.println("1. 플레이 리스트 리스트");
				// 페이지 처리를 위한 객체
				// getInstance - 기본 값이 있고 넘어오는 페이지와 검색를 세팅 처리
				// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
				result = Execute.execute(Init.get(uri), id);
				// pageObect 데이터 확인
				// 가져온 데이터 request에 저장 -> jsp까지 전달한다.
				request.setAttribute("list", result);
				// pageObject 담기
				// WEB-INF/views/ + board/list+ .jsp
				jsp = "playlist/list";
				break;
				
				
			case "/playlist/write.do":
				System.out.println("3-2. 플레이 리스트 음원 추가 처리 : write");
				
				List<MusicVO> newList = (List<MusicVO>) Execute.execute(Init.get(uri), musicNo);
				request.setAttribute("newList", newList);
				
//				String musicNo = request.getParameter("musictitle");
				
				PlaylistVO vo = new PlaylistVO();
				
				
				result = Execute.execute(Init.get(uri), vo);
				
				jsp = "redirect:list.do";
				
				break;
			
			case "/playlist/delete.do":
				System.out.println("4. 플레이 리스트 곡 지우기 ");
				musicNo = Long.parseLong(request.getParameter("musicno"));
				
				PlaylistVO deleteVO = new PlaylistVO();
				deleteVO.setMusicNo(musicNo);
				
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("********************************************************************");
				System.out.println("****" + deleteVO.getMusicNo() + " 곡이 삭제되었습니다. ****");
				System.out.println("********************************************************************");
				
				jsp ="redirect:list.do";
				session.setAttribute("msg", "곡 지우기가 되었습니다");
				
				break;
			
			default:
				jsp = "error/404";
				break;
			}// end of switch
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("e", e);
			jsp = "error/500";
		} // end of try~catch
		return jsp;
	}// end of execute()
} // end of class()
