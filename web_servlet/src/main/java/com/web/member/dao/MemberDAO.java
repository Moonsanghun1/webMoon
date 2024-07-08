package com.web.member.dao;

import java.util.ArrayList;
import java.util.List;

import com.web.member.vo.LoginVO;
import com.web.member.vo.MemberVO;
import com.web.main.dao.DAO;
import com.web.util.db.DB;
import com.web.util.io.In;

public class MemberDAO extends DAO {

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메소드만 이용

	// 1. 회원 리스트
	// MemberController - (Execute) - MemberListService - [MemberDAO.list()]
	public List<MemberVO> list() throws Exception {

		List<MemberVO> list = null;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(LIST);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if (rs != null) {
				while (rs.next()) {
					// rs - > vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if (list == null)
						list = new ArrayList<MemberVO>();
					// rs -> vo
					MemberVO vo = new MemberVO();
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setBirth(rs.getString("birth"));
					vo.setTel(rs.getString("tel"));
					vo.setGradeNo(rs.getInt("gradeNo"));
					vo.setGradeName(rs.getString("gradeName"));
					vo.setStatus(rs.getString("Status"));

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

	// 2 . 회원정보 상세보기
	// LoginController - (Execute) - LoginListService - [LoginDAO.list()]
	public MemberVO view(String id) throws Exception {

		MemberVO vo = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			// 4. 실행 객체 & 데이터 세팅

			pstmt = con.prepareStatement(VIEW);
			pstmt.setString(1, id);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				// rs -> rs
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirth(rs.getString("birth"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setRegDate(rs.getString("regDate"));
				vo.setConDate(rs.getString("conDate"));
				vo.setPhoto(rs.getString("photo"));
				vo.setGradeNo(rs.getInt("gradeNO"));
				vo.setGradeName(rs.getString("gradeName"));

			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		return vo;

	}// end of view()

	// 3 . 회원가입 처리
	// MemberController - (Execute) - MemberwriteService - [MemberDAO.write(vo)]
	public int write(MemberVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅

			pstmt = con.prepareStatement(WRITE);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getPhoto());

			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println();
			System.out.println("*** 회원가입이 완료 되었습니다. ***");

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(" 예외 발생: 회원가입 DB처리 중 예외가 발생했습니다. ");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 3-1 . 아이디 중복 확인 
	// MemberController - (Execute) - MemberCheckIdService - [MemberDAO.checkId()]
	public String checkId(String id) throws Exception {
		// 결과(id)룰 저장할 수 있는 변수 선언
		String result = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			// 4. 실행 객체 & 데이터 세팅

			pstmt = con.prepareStatement(CHECKID);
			pstmt.setString(1, id);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				
				result = rs.getString("id");

			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		// 결과 데이터(id)를 리턴 해준다.
		return result;

	}// end of view()
	
	// 4 . 회원정보 수정 처리
	// MemberController - (Execute) - MemberListService - [MemberDAO.list()]
	public int update(MemberVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getGender());
			pstmt.setString(3, vo.getBirth());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPhoto());
			pstmt.setString(7, vo.getId());
			pstmt.setString(8, vo.getPw());
	


			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 아이디나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 회원정보 수정 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 5 . 회원탈퇴 처리 : 상태 - 탈퇴로 변경
	// MemberController - (Execute) - MemberDeleteService - [MemberDAO.list()]
	public int delete(MemberVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());

			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 아이디나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 회원탈퇴 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of delete()

	// 6. 로그인 처리
	// 6 . 로그인 처리
	// MemberController - (Execute) - MemberLoginService - [MemberDAO.login()]
	public LoginVO login(LoginVO loginvo) throws Exception {

		LoginVO vo = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			// 4. 실행 객체 & 데이터 세팅

			pstmt = con.prepareStatement(LOGIN);
			pstmt.setString(1, loginvo.getId());
			pstmt.setString(2, loginvo.getPw());
			System.out.println(LOGIN);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 및 담기
			if (rs != null && rs.next()) {
				// rs -> rs
				vo = new LoginVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setGradeNo(rs.getInt("gradeNO"));
				vo.setGradeName(rs.getString("gradeName"));
				vo.setPhoto(rs.getString("gradeName"));
				vo.setNewMsgCnt(rs.getLong("NewMsgCnt"));


			} // end of if
			if (vo == null) { // 아이디와 비밀번로가 맞지 않는 경우
				throw new Exception("예외 발생 : 아이디나 비밀번로가 맞지 않습니다. 정보를 확인해주세요");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 로그인 DB 처리 중 예외가 발생했습니다.");

		} finally {
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		return vo;

	}// end of login()
	
	// 7. 최근접속일 처리
	// 7 . 접속일
	// MemberController - (Execute) - MemberListService - [MemberDAO.list()]
	public int condateupdate(String id) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(CONDATE_UPDATE);
			pstmt.setString(1, id);

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
				throw new Exception("예외 발생 : 공지사항 수정 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 실행항 쿼리를 정의해 놓은 변수 선언.
	final String LIST = "select m.id, m.name, to_char(m.birth, 'yyyy-mm-dd') birth, m.tel , g.gradeName, g.gradeNo, m.Status "
			+ " from member m , grade g " + " where " + " g.gradeNo = m.gradeNo order by id asc";
	final String VIEW = "select m.id, m.name, m.gender, to_char(m.birth, 'yyyy-mm-dd') birth, m.email, m.tel,m.photo, m.email, m.regDate, m.conDate , m.gradeNo, g.gradeName "
			+ " from member m , grade g " + " where id = ? and (g.gradeNo = m.gradeNo) ";

	final String WRITE = " insert into member( id, pw, name, gender, birth, tel, email, photo) "
			+ " values(?,?,?,?,?,?,?,?)";
	
	final String CHECKID = " select id from member where id = ? ";

	final String UPDATE = "update member set " + " name = ?, gender = ? , birth = ?, tel = ? , email = ? , photo = ? "
			+ " where id = ? and pw = ?";

	final String DELETE = "update member set status = '탈퇴' " + " where id = ? and pw = ?";

	final String LOGIN = "select m.id, m.name, m.gradeNo, g.gradeName , m.photo, m.newMsgCnt "
			+ " from member m , grade g " + " where (id = ? and pw = ? and status = '정상') "
			+ " and (g.gradeNo = m.gradeNo) ";

	final String CONDATE_UPDATE = "update member set " + " conDate = sysdate where id = ? ";
}
