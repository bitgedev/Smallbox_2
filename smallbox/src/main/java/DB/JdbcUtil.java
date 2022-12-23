package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 데이터베이스 작업 준비 및 해제(자원반환) 작업을 공통으로 수행할 JdbcUtil 클래스 정의
public class JdbcUtil { // ClassNotFoundException 예외처리, SQLException(DB연결실패) 예외처리

	// 1. 데이터베이스 접근(공통 작업)을 통해 Connection 객체를 생성하여 외부로 리턴하는
	// 	  getConnection() 메서드 정의	
	// => 파라미터 : 없음 리턴타입 : java.sql.Connection(con)
	// => 단, JdbcUtil 클래스의 인스턴스 생성 없이도 메서드 호출이 가능하도록
	// 	  static 메서드로 정의
	public static Connection getConnection() {
		// 데이터베이스 연결 객체를 저장할 Connection 타입 변수 선언
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/MySQL");
			con = ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 데이터베이스 연결 객체가 저장된 Connection 타입 변수값 리턴
		return con;
	}
	
	// 데이터베이스 자원 반환을 공통으로 수행할 close() 메서드 정의
	// => 파라미터 : Connection 타입(con) 또는 PreparedStatement 타입(pstmt) 또는
	//				 ResultSet 타입(rs)
	// => 각각의 파라미터를 따로 전달받아 각각 close() 작업을 수행하도록 메서드 따로 정의
	//    단, 각각의 메서드 이름은 모두 close()로 정의하고 파라미터만 다르게 지정
	//	  (= 메서드 오버로딩)
	// => 인스턴스 생성 없이도 메서드 호출이 가능하도록 static 메서드로 정의
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
