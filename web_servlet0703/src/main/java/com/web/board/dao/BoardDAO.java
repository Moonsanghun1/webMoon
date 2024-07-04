package com.web.board.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.util.db.DB;
import com.webjjang.util.page.PageObject;

public class BoardDAO extends DAO {
	
	int result = 0;
	
	public List<BoardVO> list() throws Exception {
	
		List<BoardVO> list = null;
		
		try {
			// 1. 드라이브 확인 
			// 2. DB 연결 
			con = DB.getConnection();
			
			pstmt = con.prepareStatement(LIST);
			
			rs = pstmt.executeQuery();
			
				if(rs != null) {
					list = new ArrayList<BoardVO>();
					
					while (rs.next()) {
					
						
						BoardVO vo = new BoardVO();
						vo.setNo(rs.getLong("no"));
						vo.setTitle(rs.getString("title"));
						vo.setWriter(rs.getString("Writer"));
						vo.setWriteDate(rs.getString("WriteDate"));
						vo.setHit(rs.getLong("hit"));
						
						list.add(vo);
					}	
				}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	return list;
	}
	
	// 일반게시판 상세보기
	public BoardVO view(Long no) throws Exception{
		
		BoardVO vo = null;
		
		try {
			
			con = DB.getConnection();
			
			pstmt = con.prepareStatement(VIEW);
			pstmt.setLong(1, no);
			// 5.실행
			rs = pstmt.executeQuery();
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				
				vo = new BoardVO();
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setHit(rs.getLong("hit"));
				
			
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
		return vo;
	}
	
	// 일반게시판 상세보기 조회수 증가
	public int increase(Long no) throws Exception{
		
			try {
				
				con = DB.getConnection();
				
				pstmt = con.prepareStatement(INCREASE);
				pstmt.setLong(1, no);
				// 5.실행
				result = pstmt.executeUpdate();
				// 6. 표시 및 담기
				
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				DB.close(con, pstmt);
			}
			
			return result;
		}
	
	// 일반게시판 글쓰기 
	public int write(BoardVO vo) throws Exception {

		try {

			con = DB.getConnection();

			pstmt = con.prepareStatement(WRITE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getPw());
			// 5.실행
			result = pstmt.executeUpdate();
			// 6. 표시 및 담기

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception(" 예외 발생: 게시판 글등록 DB처리 중 예외가 발생했습니다. ");
		} finally {
			DB.close(con, pstmt);
		}

		return result;
	}
		
	// 일반게시판 글 수정
	public int update(BoardVO vo) throws Exception {

		try {

			con = DB.getConnection();

			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setLong(4, vo.getNo());
			pstmt.setString(5, vo.getPw());
			// 5.실행
			result = pstmt.executeUpdate();
			// 6. 표시 및 담기

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt);
		}

		return result;
	}
	
	// 일반게시판 글 수정
	public int delete(BoardVO vo) throws Exception {

		try {

			con = DB.getConnection();

			pstmt = con.prepareStatement(DELETE);

			pstmt.setLong(1, vo.getNo());
			pstmt.setString(2, vo.getPw());
			// 5.실행
			result = pstmt.executeUpdate();
			// 6. 표시 및 담기

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt);
		}

		return result;
	}

	final String LIST = "select no, title, writer, writeDate, hit from board order by no desc";
	final String TOTALROW = "select count(*) from board";
	final String VIEW = "select no, title, content, writer, writeDate, hit from board where no = ? ";
	final String INCREASE = "Update board set hit = hit + 1 where no = ? ";
	final String WRITE = "insert into board(no, title, content, writer, pw) "
			+ " values(board_seq.nextval, ?,?,?,?)";
	final String UPDATE = "Update board set title = ? , content = ?, writer = ? where no = ? and pw = ? ";
	final String DELETE = "DELETE from board where no = ? and pw = ? ";
	
}
