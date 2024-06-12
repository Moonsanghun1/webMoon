<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바 코드 입니다.
// 글 삭제처리한다.
System.out.println("일반 게시판 글삭제 처리 : delete.jsp");
// 자동으로 리스트로 이동시킨다.
response.sendRedirect("list.jsp");
%>