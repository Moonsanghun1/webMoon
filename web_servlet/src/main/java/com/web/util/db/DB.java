package com.web.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	
	// DB 연결 관련된 정보
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String ID ="java";
	private static final String PW ="java";

	static {
		try {
			// 1. 확인 - 딱 한 번만 한다.
			Class.forName(DRIVER);
			System.out.println("1. 드라이버 확인 성공");

		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("** 드라이버가 없음으로 프로그램을 종료합니다.**");
			//System.exit(1);
		}
	}	
	
	// DB.getConnection()
	public static final Connection getConnection() throws SQLException{
		return DriverManager.getConnection(URL,ID,PW);
		
	}
	
	// 사용한 객체 닫기 (자원 반환) -- 둘로 나눈 이유는 rs를 안쓰는 곳이 있기 때문이다.
	public static final void close(Connection con, PreparedStatement pstmt) throws SQLException {
		// 7. 닫기 - DB클래스 
		if(con != null) con.close();
		if(pstmt != null) pstmt.close();
	}
	
	public static final void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		close(con,pstmt);
		if(rs != null) rs.close();
	}

}
