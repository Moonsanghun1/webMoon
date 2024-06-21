package com.web.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.main.dao.DAO;
import com.web.util.db.DB;
import com.webjjang.util.page.PageObject;

import oracle.net.aso.r;


public class BoardDAO extends DAO {

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메소드만 이용

	// 1. 리스트
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public List<BoardVO> list(PageObject pageObject) throws Exception {

		List<BoardVO> list = null;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(LIST);
			pstmt.setLong(1, pageObject.getStartRow());
			pstmt.setLong(2, pageObject.getEndRow());
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if (rs != null) {
				while (rs.next()) {
					// rs - > vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if (list == null)
						list = new ArrayList<BoardVO>();
					// rs -> vo
					BoardVO vo = new BoardVO();
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("writer"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setHit(rs.getLong("hit"));

					// vo -> list
					list.add(vo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return list;
	}

	// 1-1. 글 전체 개수
		// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
		public Long getTotalRow(PageObject pageObject) throws Exception {
			// 결과를 저장할 수 있는 변수 선언.

			Long totalRow= null; 

			try {
				// 1. 드라이버 확인 - DB
				// 2. 연결
				con = DB.getConnection();
				// 3. sql - 아래 LIST
				// 4. 실행 객체 & 데이터 세팅
				pstmt = con.prepareStatement(TOTALROW);

				// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
				rs = pstmt.executeQuery();
				// 6. 표시 또는 담기
				if (rs != null && rs.next()) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
					totalRow  = rs.getLong(1);

				}

			} catch (Exception e) {
				e.printStackTrace();
				// 특별한 예외는 그냥 전달한다.
				
					throw e;
				// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
				

			} finally {
				// 7. 닫기
				DB.close(con, pstmt);
			}

			// 결과 데이터를 리턴해준다.
			return totalRow;
		} // end of delete()


	
	// 2-1 . 글보기 조회수 1증가 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public int increase(Long no) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(INCREASE);
			pstmt.setLong(1, no);
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호가 존재하지 않습니다. 글번호를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 게시판 글보기 조회수 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 2-2 . 글보기 상세보기
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public BoardVO view(Long no) throws Exception {

		BoardVO vo = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			// 4. 실행 객체 & 데이터 세팅

			pstmt = con.prepareStatement(VIEW);
			pstmt.setLong(1, no);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				// rs -> rs
				vo = new BoardVO();
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("Content"));
				vo.setWriter(rs.getString("Writer"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setHit(rs.getLong("hit"));

			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		return vo;

	}// end of view()

	// 3 . 글등록 처리
	// BoardController - (Execute) - BoardwriteService - [BoardDAO.write(vo)]
	public int write(BoardVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(WRITE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getPw());
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println();
			System.out.println("*** 글등록이 완료 되었습니다. ***");

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(" 예외 발생: 게시판 글등록 DB처리 중 예외가 발생했습니다. ");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 4 . 글 수정 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public int update(BoardVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setLong(4, vo.getNo());
			pstmt.setString(5, vo.getPw());
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 게시판 글수정 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 5 . 글 수정 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public int delete(BoardVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(DELETE);

			pstmt.setLong(1, vo.getNo());
			pstmt.setString(2, vo.getPw());
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 게시판 글삭제 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of delete()

	// 실행항 쿼리를 정의해 놓은 변수 선언.
	final String LIST = 
			"select rownum rnum, no, title,writer, writeDate, hit "
			+ "from ( "+
					"select rownum rnum, no, title,writer, writeDate, hit "
						+ "	from ( "+
							"select no, title,writer, " + " to_char(writeDate, 'yyyy-mm-dd') writeDate, hit "
							+ " from board " + " order by no desc"
							+ ") " +
				") where rnum between ? and ? ";
	final String TOTALROW = "select count(*) from board";
	final String INCREASE = "update board set hit = hit + 1 " + " where no = ? ";

	final String VIEW = "select no, title, content, writer, " + " to_char(writeDate, 'yyyy-mm-dd') writeDate, hit "
			+ " from board " + " where no = ? ";
	final String WRITE = " insert into board( " + " no, title, content, writer, pw) "
			+ " values(board_seq.nextval, ?,?,?,?)";

	final String UPDATE = "update board set " + " title = ?, content = ? ,writer = ? " + " where no = ? and pw = ? ";
	final String DELETE = "delete from board " + " where no = ? and pw = ?";

}
