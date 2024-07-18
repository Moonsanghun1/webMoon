package com.web.message.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.web.main.dao.DAO;
import com.web.message.vo.MessageVO;
import com.web.util.db.DB;
import com.webjjang.util.page.PageObject;

public class MessageDAO extends DAO {

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메소드만 이용

	// 1-1. 리스트
	// MessageController - (Execute) - MessageListService - [MessageDAO.list()]
	public List<MessageVO> list(PageObject pageObject) throws Exception {

		List<MessageVO> list = null;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST - 콘솔 확인하고 여기에 쿼리에 해당되는 
			System.out.println(getListSQL(pageObject));
			// 4. 실행 객체 & 데이터 세팅
//			pstmt = con.prepareStatement(LIST);
			pstmt = con.prepareStatement(getListSQL(pageObject));
			
			// 검색에 대한 데이터 세팅 - list()만 사용 
			int idx = 0; // pstmt의 순서번호로 사용. 먼저 1 증가하고 사용한다.
			// 메세지 본인 정보 세팅 - 모드 데이터 세팅
			pstmt.setString(++idx, pageObject.getAccepter());
			if (pageObject.getAcceptMode() == 3) {
				pstmt.setString(++idx, pageObject.getAccepter());
			};
			// 검색 데이터 세팅
			idx = setSearchData(pageObject, pstmt, idx);
			// 페이지 정보 세팅
			pstmt.setLong(++idx, pageObject.getStartRow()); // 기본 값 = 1
			pstmt.setLong(++idx, pageObject.getEndRow());// 기본 값 = 10
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if (rs != null) {
				while (rs.next()) {
					// rs - > vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if (list == null) list = new ArrayList<>();
					// rs -> vo
					MessageVO vo = new MessageVO();
					vo.setNo(rs.getLong("no"));
					vo.setAccepterId(rs.getString("accepterId"));
					vo.setAccepterName(rs.getString("accepterName"));
					vo.setAcceptDate(rs.getString("acceptDate"));
					vo.setAccepterPhoto(rs.getString("accepterPhoto"));
					vo.setSenderId(rs.getString("senderId"));
					vo.setSenderName(rs.getString("senderName"));
					vo.setSendDate(rs.getString("sendDate"));
					vo.setSenderPhoto(rs.getString("senderPhoto"));

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

	// 1-2 . 전체 데이터 개수 처리
	// MessageController - (Execute) - MessageListService - [MessageDAO.getTotalRow()]
	public Long getTotalRow(PageObject pageObject) throws Exception {

		Long totalRow = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			System.out.println("MessageDAO.getTotalRow().sql = " + TOTALROW + getModeSql(pageObject) + getSearch(pageObject) );
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(TOTALROW + getModeSql(pageObject) + getSearch(pageObject));
			int idx= 0;
			pstmt.setString(++idx, pageObject.getAccepter());
			if (pageObject.getAcceptMode() == 3) {
				pstmt.setString(++idx, pageObject.getAccepter());
			};
			idx = setSearchData(pageObject, pstmt, idx);
			// 5. 실행
			rs = pstmt.executeQuery();
			
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				// rs -> rs
				totalRow = rs.getLong(1);

			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		return totalRow;

	}// end of view()



	// 2-1. 받은 날짜가 null인 데이터를 현재 날짜로 세팅해 준다.
	// MessageController - (Execute) - MessageSetReadedService - [MessageDAO.setReaded()]
	public int setReaded(Long no) throws Exception {
		// 결과를 저장할 수 있는 변수 선언. - 1: 수정 성공 -> 새로운 메세지 개수 -1 처리 , 0 : 수정 안됨.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
				// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(READED);
			pstmt.setLong(1, no);
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println("MessageDAO.setReaded() - 메세지 읽기 성공 표시");
			
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 메세지 읽기 DB 처리 중 예외가 발생했습니다.");
			
		} finally {
				// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()


	
	// 2-2. 메세지 보기 상세보기
	// MessageController - (Execute) - MessageViewService - [MessageDAO.view()]
	public MessageVO view(Long no) throws Exception {

		MessageVO vo = null;

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
				vo = new MessageVO();
				vo.setNo(rs.getLong("no"));
				vo.setContent(rs.getString("Content"));
				vo.setSenderId(rs.getString("senderId"));
				vo.setSenderName(rs.getString("senderName"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setSenderPhoto(rs.getString("senderPhoto"));
				vo.setAccepterId(rs.getString("accepterId"));
				vo.setAccepterName(rs.getString("accepterName"));
				vo.setAcceptDate(rs.getString("acceptDate"));
				vo.setAccepterPhoto(rs.getString("accepterPhoto"));

			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("예외 발생 : 일반 게시판 글보기 DB처리 중 오류 발생");
		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		return vo;

	}// end of view()


	// 2-3. 받은 날짜가 변경되면 회원의 새로운 메세지 개수 항목을 -1해준다.
	// MessageController - (Execute) - MessageDecreaseNewMsgCntService - [MessageDAO.decreaseNewMsgCnt()]
	// 2-1의 결과값이 1일때 실행
	public int decreaseNewMsgCnt(String id) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
				// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(DECREASENEWMSGCNT);
			pstmt.setString(1, id);
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println("MessageDAO.decreaseNewMsgCnt() - 새로운 메세지 카운트 1 감소");
			
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 새로운 메세지 1감소 DB 처리 중 예외가 발생했습니다.");
			
		} finally {
				// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	
	
	// 3 . 메세지 전송 처리
	// MessageController - (Execute) - MessagewriteService - [MessageDAO.write(vo)]
	public int write(MessageVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(WRITE);
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getAccepterId());
			pstmt.setString(3, vo.getSenderId());
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println();
			System.out.println("*** 글등록이 완료 되었습니다. ***");

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(" 예외 발생: 메세지 보내기 DB처리 중 예외가 발생했습니다. ");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 3-1. 새로운 메세지가 전달된 회원 테이블의 새로운 메세지 개수를 1 증가시킨다.
	// MessageController - (Execute) - MessageListService - [MessageDAO.increaseNewMsgCnt()]
	public int increaseNewMsgCnt(String id) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
				// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(INCREASENEWMSGCNT);
			pstmt.setString(1, id);
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			System.out.println("MessageDAO.increaseNewMsgCnt() - 새로운 메세지 카운트 1증가");
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 새로운 메세지 1증가 DB처리중 예외가 발생했습니다.");

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


	
	// 4 . 글 수정 처리
	// MessageController - (Execute) - MessageUpdateService - [MessageDAO.update()]
	public int update(MessageVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(UPDATE);
//			pstmt.setString(1, vo.getTitle());
//			pstmt.setString(2, vo.getContent());
//			pstmt.setString(3, vo.getWriter());
//			pstmt.setLong(4, vo.getNo());
//			pstmt.setString(5, vo.getPw());
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
	// MessageController - (Execute) - MessageListService - [MessageDAO.list()]
	public int delete(MessageVO vo) throws Exception {
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
//			pstmt.setString(2, vo.getPw());
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
	
	// 리스트의 페이지 처리 절차 - 원본 -> 순서 번호 -> 해당 페이지 데이터만 가져온다.
	final String LIST = "" 
			+ " select no, senderId, senderName, sendDate, senderPhoto, "
			+ " accepterId, accepterName, acceptDate, accepterPhoto "
			+ " from ( "
				+ " select rownum rnum, no, senderId, senderName, sendDate, senderPhoto, "
				+ " accepterId, accepterName, acceptDate, accepterPhoto "
					+ " from ( "
						+ " select m.no, m.senderId, sm.name senderName, sm.photo senderPhoto, " 
						+ " to_char(m.sendDate, 'yyyy-mm-dd') sendDate,  "
						+ " m.accepterId , am.name accepterName, am.photo accepterPhoto,"
						+ " to_char(m.acceptDate, 'yyyy-mm-dd') acceptDate "
						+ " from Message m, member sm , member am"; 
						// 여기에 검색이 있어야 한다.
						// mode 조건 처리 + 검색 조건 처리
	
	// 검색이 있는 경우 TOTALROW + search문 
	final String TOTALROW = " select count(*) from Message ";
	
	// 리스트의 검색만 처리하는 쿼리 - where 
	private String getListSQL(PageObject pageObject) {
		String sql = LIST;
		
		// mode 조건 처리. 1. 받은 메세지, 2. 보낸 메세지, 3. 모든 메세지
		sql += getModeSql(pageObject);
		// 검색 조건 처리
		sql += getSearch(pageObject);
		// 조인 조건 처리
		sql += getJoin();
		
		sql +=  " order by no desc " 
					+ " ) "
					+ " ) where rnum between ? and ? ";
		
		
		return sql;
	}
	// 가져온 메세지 모드에 대한 조건 처리
	private String getModeSql(PageObject pageObject) {
		String sql = " where ( 1=0 ";
		
		int mode = pageObject.getAcceptMode();
		
		if (mode == 1 || mode == 3) 
			sql += " or accepterId = ? ";
		if (mode == 2 || mode == 3)
			sql += " or senderId = ? ";
		
		sql += " ) ";
		
		return sql;
	}
	
	// join 조건
	private String getJoin() {
		System.out.println("MessageDAO.getJoin() ----------------");
		String sql = "";
		sql += " and (";
		sql += " (m.accepterId = am.id) and (m.senderId = sm.id) ";
		sql += " ) ";
		return sql;
	}
	
	// LIST에 검색을 처리해서 만들어지는 sql문 작성 메소
	private String getSearch(PageObject pageObject) {
		
		String sql = "";
		String key = pageObject.getKey();
		String word = pageObject.getWord();
		if(word != null && !word.equals("")) {
			sql += " and 1 = 0 ";
			// key 안에 t가 포함 되어있으면 title로 검색을 한다.
		if(key.indexOf("t" ) >= 0) sql += " or title like ? ";
		if(key.indexOf("c" ) >= 0) sql += " or content like ? ";
		if(key.indexOf("w" ) >= 0) sql += " or writer like ? ";	
		sql += " ) ";
		}
		return sql;
	}
	
	// 검색 쿼리의 ? 데이터를 세팅하는 메소드
	private int setSearchData(PageObject pageObject, PreparedStatement pstmt , int idx) throws SQLException {
		
					
					String key = pageObject.getKey();
					String word = pageObject.getWord();
					if(word != null && !word.equals("")) {
					// key 안에 t가 포함 되어있으면 title로 검색을 한다.
					if(key.indexOf("t") >= 0) pstmt.setString(++idx, "%" + word + "%");
					if(key.indexOf("c") >= 0) pstmt.setString(++idx, "%" + word + "%");
					if(key.indexOf("w") >= 0) pstmt.setString(++idx, "%" + word + "%");
					}
					return idx;
	}
	
	final String INCREASENEWMSGCNT = "update member set newMsgCnt = newMsgCnt + 1 " + " where id = ? ";
	
	final String READED = "update message set acceptDate = sysDate " + " where (no = ? ) and acceptDate is null ";

	final String VIEW = "select no, content, "
			+ " m.senderId, sm.name senderName, sm.photo senderPhoto, " 
			+ " to_char(m.sendDate, 'yyyy-mm-dd') sendDate,  "
			+ " m.accepterId , am.name accepterName, am.photo accepterPhoto,"
			+ " to_char(m.acceptDate, 'yyyy-mm-dd') acceptDate "
			+ " from Message m, member sm , member am"
			+ " where (no = ?)"
			+ " and ( "
			+ " m.accepterId = am.id and m.senderId = sm.id"
			+ " ) "; 
	final String DECREASENEWMSGCNT = "update member set newMsgCnt = newMsgCnt - 1 " + " where id = ? ";
	
	final String WRITE = " insert into Message( no, content, accepterId, senderId ) "
			+ " values(Message_seq.nextval, ?,?,?)";

	final String UPDATE = "update Message set " + " title = ?, content = ? ,writer = ? " + " where no = ? and pw = ? ";
	final String DELETE = "delete from Message " + " where no = ? and pw = ?";

}
