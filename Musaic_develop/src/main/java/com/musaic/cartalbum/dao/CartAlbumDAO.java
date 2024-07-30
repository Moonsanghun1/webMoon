package com.musaic.cartalbum.dao;

import java.util.ArrayList;
import java.util.List;
import com.musaic.cartalbum.vo.CartAlbumVO;
import com.musaic.main.dao.DAO;
import com.musaic.util.db.DB;

public class CartAlbumDAO extends DAO {

    // list() - 장바구니에 있는 앨범 목록을 가져오는 메서드
    public List<CartAlbumVO> list(CartAlbumVO vo) throws Exception {
        // 결과를 담을 리스트 생성
        List<CartAlbumVO> list = new ArrayList<>();

        try {
            // 데이터베이스에 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(LIST);
            pstmt.setString(1, vo.getMemberid());
            System.out.println("List Query: " + LIST);

            // 쿼리 실행 및 결과 집합(ResultSet) 얻기
            rs = pstmt.executeQuery();

            // 결과 집합을 순회하며 리스트에 담기
            while (rs != null && rs.next()) {
                // CartAlbumVO 객체 생성 및 데이터 설정
            	vo = new CartAlbumVO();
                vo.setCartNo(rs.getLong("cartNo"));
                vo.setImage(rs.getString("image"));
                vo.setTitle(rs.getString("title"));
                vo.setPrice(rs.getLong("price"));
                vo.setAlbumCnt(rs.getLong("albumCnt"));

                // 리스트에 객체 추가
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 리스트를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt, rs);
        }

        // 결과 리스트 반환
        return list;
    } // end of list()
    

    // write() - 새로운 앨범 장바구니 항목을 추가하는 메서드
    public int write(CartAlbumVO vo) throws Exception {
        int result = 0;

        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(WRITE);
            
            // 쿼리 파라미터 설정
            pstmt.setLong(1, vo.getAlbumNo());
            pstmt.setLong(2, vo.getAlbumCnt());
            pstmt.setString(3, vo.getMemberid());
            // 쿼리 실행 및 결과 얻기
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 담기를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt);
        }

        // 결과 반환
        return result;
    } // end of write()

   // update() - 기존 앨범 장바구니 항목을 수정하는 메서드
    public int update(CartAlbumVO vo) throws Exception {
        int result = 0;
        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(UPDATE);
            // 쿼리 파라미터 설정
           pstmt.setLong(1, vo.getAlbumNo());
           pstmt.setLong(2, vo.getNewalbumCnt());
            pstmt.setLong(3, vo.getAlbumCnt());
           // pstmt.setString(3, vo.getTitle());
            //pstmt.setLong(2, vo.getCartNo());
            //pstmt.setLong(2, vo.getPrice());
            
            // 쿼리 실행 및 결과 얻기
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 수정을 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt);
        }

        // 결과 반환
        return result;
    } // end of update()
    

    // delete() - 특정 앨범 장바구니 항목을 삭제하는 메서드
    public int delete(String no) throws Exception {
        int result = 0;

        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(DELETE);
            System.out.println("@@@@@@@@@ no=" + no);
            // 쿼리 파라미터 설정
            pstmt.setString(1, no);
            // 쿼리 실행 및 결과 얻기
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 삭제를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt);
        }

        // 결과 반환
        return result;
    } // end of delete()
    
    
    
    // minus() - 특정 앨범 장바구니 항목을 삭제하는 메서드
    public int minus(Long no) throws Exception {
        int result = 0;

        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(MINUS);
            System.out.println("@@@@@@@@@ no=" + no);
            // 쿼리 파라미터 설정
            pstmt.setLong(1, no);
            // 쿼리 실행 및 결과 얻기
            result = pstmt.executeUpdate();
            
          //rs = pstmt.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 삭제를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt);
        }

        // 결과 반환
        return result;
    } // end of delete()
    
    
    
    
 // add() - 특정 앨범 장바구니 항목을 삭제하는 메서드
    public int add(Long no) throws Exception {
        int result = 0;

        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(ADD);
            System.out.println("@@@@@@@@@ no=" + no);
            // 쿼리 파라미터 설정
            pstmt.setLong(1, no);
         // 쿼리 실행 및 결과 얻기
            result = pstmt.executeUpdate();
            
          //rs = pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 삭제를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt);
        }

        // 결과 반환
        return result;
    } // end of delete()
    
    
    
    
    
 
    public CartAlbumVO payClick() throws Exception {
        CartAlbumVO vo = null;

        try {
            // 데이터베이스 연결
            con = DB.getConnection();
            // SQL 쿼리 준비
            pstmt = con.prepareStatement(PAYCLICK);
            // 쿼리 파라미터 설정
 
            // 쿼리 실행 및 결과 집합 얻기
            rs = pstmt.executeQuery();

            // 결과 집합이 존재하면 객체 생성 및 데이터 설정
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("앨범 장바구니 보기를 가져오는 중 오류가 발생했습니다.");
        } finally {
            // 사용한 자원 정리
            DB.close(con, pstmt, rs);
        }

        // 결과 객체 반환
        return vo;
    } // end of view()


    // SQL 쿼리 상수 정의

    final String LIST = 
        " select ca.cartNo, a.image, a.title, a.price, ca.albumCnt " + 
        " from album a, cartAlbum ca " +
        " where (ca.albumNo = a.albumNo) and (memberid =  ?) " + 
        " order by ca.cartNo asc ";


    final String WRITE = 
        " insert into cartAlbum (cartNo, albumNo, albumCnt, memberid) values (cartAlbum_seq.nextval, ?, ?, ?) ";

    final String UPDATE = 
//        "update cartAlbum set albumNo = ?, albumCnt = ?, title = ? where cartNo = ?";	
    
    " update cartAlbum set albumCnt = ? where  = ? ";
//    		" update cartAlbum "
//    		+ " set albumCnt = albumCnt + :newAlbumCnt "
//    		+ " where albumNo = :albumNo ";

    
    final String DELETE = 
        " delete from cartAlbum where cartNo in ( ? ) ";
    
    
    
    
    final String MINUS = 
    		" UPDATE cartalbum set albumcnt = albumcnt - 1 WHERE cartNo = ? " ;
    
    final String ADD = 
    		" UPDATE cartalbum set albumcnt = albumcnt + 1 WHERE cartNo = ? " ;
    
    
    final String PAYCLICK ="INSERT INTO cartAlbumData(cartAlbumDataNo, totalPrice, goodsNo, cnt,userId) "
            + " SELECT cartNo, price, AlbumNo, albumcnt,memberid "
            + "FROM cartAlbum";
    
}
