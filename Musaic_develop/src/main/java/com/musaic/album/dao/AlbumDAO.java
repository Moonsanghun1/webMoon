package com.musaic.album.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.musaic.album.vo.AlbumVO;
import com.musaic.main.dao.DAO;
import com.musaic.util.db.DB;
import com.webjjang.util.page.PageObject;

public class AlbumDAO extends DAO {

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메소드만 이용

	// 1-1. 리스트
	// AlbumController - (Execute) - AlbumListService - [AlbumDAO.list()]
	public List<AlbumVO> list(PageObject pageObject) throws Exception {

		List<AlbumVO> list = null;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST - 콘솔 확인하고 여기에 쿼리에 해당되는 
			System.out.println(getListSQL(pageObject));
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(getListSQL(pageObject));
			
			// 검색에 대한 데이터 세팅 - list()만 사용 
			int idx = 0; // pstmt의 순서번호로 사용. 먼저 1 증가하고 사용한다.
			idx = setSearchData(pageObject, pstmt, idx);
			pstmt.setLong(++idx, pageObject.getStartRow()); // 기본 값 = 1
			pstmt.setLong(++idx, pageObject.getEndRow());// 기본 값 = 10
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if (rs != null) {
				while (rs.next()) {
					// rs - > vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if (list == null)
						list = new ArrayList<AlbumVO>();
					// rs -> vo
					AlbumVO vo = new AlbumVO();
					vo.setAlbumNo(rs.getLong("albumNo"));
					vo.setTitle(rs.getString("title"));
					vo.setRelease_date(rs.getString("release_date"));
					vo.setImage(rs.getString("image"));
					vo.setArtist(rs.getString("artist"));

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
	// AlbumController - (Execute) - AlbumListService - [AlbumDAO.getTotalRow()]
	public Long getTotalRow(PageObject pageObject) throws Exception {

		Long totalRow = null;

		try {
			// 1. 드라이버 확인
			// 2. DB 연결
			con = DB.getConnection();

			// 3. sql 아래에 미리 써놓음
			System.out.println("AlbumDAO.getTotalRow().sql = "+ TOTALROW + getSearch(pageObject, true));
			// 4. 실행 객체 & 데이터 세팅

			// 전체 데이터 개수 쿼리인 경우 조건이 있으면 where를 붙여라 : true
			pstmt = con.prepareStatement(TOTALROW + getSearch(pageObject, true));
					
			int idx= 0;
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

	// 2 . 앨범 상세보기 보기 처리
	// AlbumController - (Execute) - AlbumViewService - [AlbumDAO.list()]
	public AlbumVO view(Long no) throws Exception {

		AlbumVO vo = null;

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
				vo = new AlbumVO();
				//albumNo, title, artist, price, genre, image, release_date, info "
				vo.setAlbumNo(rs.getLong("albumNo"));
				vo.setTitle(rs.getString("title"));
				vo.setPrice(rs.getString("price"));
				vo.setArtist(rs.getString("artist"));
				vo.setGenre(rs.getString("genre"));
				vo.setImage(rs.getString("image"));
				vo.setRelease_date(rs.getString("release_date"));
				vo.setInfo(rs.getString("info"));
				vo.setStatus(rs.getString("status"));

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
	// AlbumController - (Execute) - AlbumwriteService - [AlbumDAO.write(vo)]
	public int write(AlbumVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(WRITE);
			//title, release_date, artist, price, genre, info, image
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getRelease_date());
			pstmt.setString(3, vo.getArtist());
			pstmt.setString(4, vo.getPrice());
			pstmt.setString(5, vo.getGenre());
			pstmt.setString(6, vo.getInfo());
			pstmt.setString(7, vo.getImage());
			pstmt.setString(8, vo.getStatus());

			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println();
			System.out.println("*** 앨범 등록이 완료 되었습니다. ***");

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(" 예외 발생: 앨범 등록 DB처리 중 예외가 발생했습니다. ");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 4 . 글 수정 처리
	// AlbumController - (Execute) - AlbumListService - [AlbumDAO.list()]
	public int update(AlbumVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(UPDATE);
			//title, release_date, artist, price, genre, info, image
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getRelease_date());
			pstmt.setString(3, vo.getArtist());
			pstmt.setString(4, vo.getPrice());
			pstmt.setString(5, vo.getGenre());
			pstmt.setString(6, vo.getInfo());
			pstmt.setString(7, vo.getStatus());
			pstmt.setLong(8, vo.getAlbumNo());
			
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 본인글이 아니거나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 이미지 게시판 수정 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of increase()

	// 5 . 글 삭제 처리
	// AlbumController - (Execute) - AlbumListService - [AlbumDAO.list()]
	public int delete(AlbumVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;

		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(DELETE);

			pstmt.setLong(1, vo.getAlbumNo());
			// 5. 실행 - Update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if (result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호가 맞지 않거나 본인 글이 아닙니다. 정보를 확인해 주세요");

			}

		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if (e.getMessage().indexOf("예외 발생") >= 0)
				throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else
				throw new Exception("예외 발생 : 앨범 삭제 DB 처리 중 예외가 발생했습니다.");

		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}

		// 결과 데이터를 리턴해준다.
		return result;
	} // end of delete()
	
	// 6. 앨범 커버 수정 처리
	// AlbumController - (Execute) - AlbumService - [AlbumDAO.changeAlbumCover()]
	public int changeAlbumCover(AlbumVO vo) throws Exception {
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(CHANGEALBUMCOVER);
			
			pstmt.setString(1, vo.getImage());
			pstmt.setLong(2, vo.getAlbumNo());

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
	final String LIST = 
		""  + "select albumNo, title, artist, release_date, image "
			+ " from ( "
				+ " select rownum rnum, albumNo, title, artist, release_date, image "
					+ " from ( "
						+ " select a.albumNo, a.title, a.artist, " 
						+ " to_char(a.release_date, 'yyyy-mm-dd') release_date, a.image "
						+ " from Album a " // 여기에 검색이 있어야 한다.
						// where 1=1 and (일반조건) and (조인조건) 
						+ " where 1 = 1 ";
	
	// 검색이 있는 경우 TOTALROW + search문 
	final String TOTALROW = "select count(*) from Album ";
	
	// 리스트의 검색만 처리하는 쿼리 - where 
	private String getListSQL(PageObject pageObject) {
		String sql = LIST;
		//String word = pageObject.getWord();
				// 검색 쿼리 추가 - where를 추가 안한다. : false
				sql += getSearch(pageObject, false); 
				// sql +=  " and (m.id = a.id ) ";
				sql +=  " order by release_date desc " 
						+ " ) "
						+ " ) where rnum between ? and ?";
			
		
		return sql;
	}
	
	// LIST에 검색을 처리해서 만들어지는 sql문 작성 메소
	// 리스트의 검색만 처리하는 쿼리 - where
	// list(), getTotalRow()에서 사용한다. list는 where 반드시 넣는다. 이미 있다.
	// getTotalRow() where가 없다. 그래서 검색 있는 경우 where 추가 해야한다.
	private String getSearch(PageObject pageObject, boolean isWhere) {
		
		String sql = "";
		String key = pageObject.getKey();
		String word = pageObject.getWord();
		if(word != null && !word.equals("")) {
			// where 붙이기 처리
			if(isWhere) sql += " where 1 = 1 ";
			sql += " and ( 1 = 0 ";
			// key 안에 t가 포함 되어있으면 title로 검색을 한다.
		if(key.indexOf("t" ) >= 0) sql += " or title like ? ";
		if(key.indexOf("c" ) >= 0) sql += " or content like ? ";
		if(key.indexOf("f" ) >= 0) sql += " or fileName like ? ";	
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
					if(key.indexOf("f") >= 0) pstmt.setString(++idx, "%" + word + "%");
					}
					return idx;
	}
	
	final String INCREASE = "update album set hit = hit + 1 " + " where no = ? ";

	final String VIEW = "select a.albumNo, a.title, a.artist, a.price, a.genre, a.image, a.status, " 
			+ " to_char(a.writeDate, 'yyyy-mm-dd') release_date, a.info "
			+ " from album a where albumNo = ? ";
			//+ " from Album a , member m " + " where (a.no = ?) and (m.id = a.id) ";
	final String WRITE = " insert into Album( " + "albumNo, title, release_date, artist, price, genre, info, image, status) "
			+ " values(Album_seq.nextval, ?,?,?,?,?,?,?,?)";

	final String UPDATE = "update Album set " + " title = ?, release_date = ?, artist = ?, price = ?, "
				+ "genre = ?, info = ?, status = ?  " + " where albumNo = ? ";
	final String DELETE = "delete from Album " + " where albumNo = ? ";
	final String CHANGEALBUMCOVER = "update Album set image = ? " + " where albumNo = ? ";

}
