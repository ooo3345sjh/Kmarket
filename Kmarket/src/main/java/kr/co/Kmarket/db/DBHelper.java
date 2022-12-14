package kr.co.Kmarket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;


// 좀 더 편리한 DB처리를 위한 헬퍼 클래스
public class DBHelper {
	
	protected Connection con = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_kmarket");
			con = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();			
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}