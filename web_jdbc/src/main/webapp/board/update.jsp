<%@page import="com.web.board.vo.BoardVO"%>
<%@page import="com.web.board.service.BoardUpdateService"%>
<%@page import="com.web.util.exe.Execute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바 코드 입니다.
System.out.println("일반 게시판 글수정 처리 : update.jsp");
// 한글처리
request.setCharacterEncoding("utf-8");
// 글 수정 처리한다.
// 데이터 수집
String noStr = request.getParameter("no");
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");

System.out.println("no = " + noStr);
System.out.println("title = " + title);
System.out.println("content = " + content);
System.out.println("writer = " + writer);
System.out.println("pw = " + pw);

BoardVO updateVO = new BoardVO();
updateVO.setNo(Long.parseLong(noStr));
updateVO.setTitle(title);
updateVO.setContent(content);
updateVO.setWriter(writer);
updateVO.setPw(pw);

// DB 글수정 처리한다.
Execute.execute(new BoardUpdateService(), updateVO);
// 자동으로 글보기로 이동시킨다.
response.sendRedirect("view.jsp?no=" + noStr + "&inc=0");
%>