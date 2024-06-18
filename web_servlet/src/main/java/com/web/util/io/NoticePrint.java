package com.web.util.io;

import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.notice.vo.NoticeVO;

public class NoticePrint {
		
	// 공지사항 리스트 출력 메소드
	public void print(List<NoticeVO> result ) {
		System.out.println();
		System.out.println("<<<----- 공지사항 리스트 ----->>>");
		System.out.println("+---------------------------------------------+");
		System.out.println(" 글번호 /        제목        / 시작일 / 종료일 / 수정일 ");
		System.out.println("+---------------------------------------------+");
		
		if(result == null ) { // 데이터가 없으면 null이 된다.
			System.out.println("*** 데이터가 존재하지 않습니다. ***");
		}else {
			for(NoticeVO vo : result) {
				System.out.print(" " + vo.getNo());
				System.out.print(" / " + vo.getTitle());
				System.out.print(" / " + vo.getStartDate());
				System.out.print(" / " + vo.getEndDate());
				System.out.print(" / " + vo.getUpdateDate());

				System.out.println();
			}
		}
		System.out.println("+---------------------------------------------+");
	}
	// 공지사항 글보기 출력 메소드
	public void print(NoticeVO vo) {
		System.out.println();
		System.out.println("<<<----- 공지사항 글보기 ----->>>");
		System.out.println("+---------------------------------------------+");
		System.out.println("+ 글번호 : " + vo.getNo());
		System.out.println("+ 제목 : " + vo.getTitle());
		System.out.println("+ 내용 : " + vo.getContent());
		System.out.println("+ 시작일  : " + vo.getStartDate());
		System.out.println("+ 종료일  : " + vo.getEndDate());
		System.out.println("+ 수정일  : " + vo.getUpdateDate());
		System.out.println("+ 작성일  : " + vo.getWriteDate());

		System.out.println("+---------------------------------------------+");
	}
	
}
