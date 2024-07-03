package com.web.board.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.util.db.DB;
import com.webjjang.util.page.PageObject;

public class BoardDAO extends DAO {
	
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
	
//	public Long getTotalRow(PageObject pageObject) throws Exception {
//		
//		Long totalRow = null;
//		
//		try {
//			// 1. 드라이브 확인 
//			// 2. DB 연결 
//			con = DB.getConnection();
//			
//			pstmt = con.prepareStatement(TOTALROW);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs != null && rs.next()) {
//				totalRow = rs.getLong("1");
//			}
//			
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			throw e;
//		}finally {
//			DB.close(con, pstmt, rs);
//		}
//		
//		return totalRow;
//	}
	
	final String LIST = "select no, title, writer, writeDate, hit from board order by no desc";
	final String TOTALROW = "select count(*) from board";
	final String VIEW = "select no, title, content, writer, writeDate, hit from board where no = ? ";
	final String INCREASE = "Update board set hit = hit + 1 where no = ? ";
	final String WRITE = "insert into board(no, title, content, writer, pw) "
			+ " value(board_seq.nextval, ?,?,?,?)";
	final String UPDATE = "Update board set title = ? , content = ?, writer = ? where no = ? and pw = ? ";
	final String DELETE = "DELETE from board where no = ? and pw = ? ";
	
}
