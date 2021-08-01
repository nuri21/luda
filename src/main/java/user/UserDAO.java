package user;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class UserDAO {
	
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			String DBurl = "jdbc:mariadb://localhost/nssiwl";
			String DBid = "nssiwl";
			String DBpass = "dmswls1130";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(DBurl, DBid, DBpass);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public int login(String userID, String userPassword) {
		  String SQL = "SELECT userPassword FROM luda_user WHERE userID = ?";
		  try {
		   pstmt = conn.prepareStatement(SQL);
		   pstmt.setString(1, userID);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
		    if(rs.getString(1).equals(userPassword))
		     return 1; 
		    else
		     return 0;  
		   }
		   return -1;  
		   
		  } catch(Exception e) {
		   e.printStackTrace();
		  }
		  return -2; 
		 }
	
	
	public int join(User user) {
		String SQL = "INSERT INTO luda_user (userID, userPassword, userName) VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());  
			pstmt.setString(2, user.getUserPassword()); 
			pstmt.setString(3, user.getUserName()); 
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	
	public int con_save(String userID,String start_date, String end_date , String contents1) {
		String SQL = "INSERT INTO luda_cal(userID,start_date, end_date, contents1) values(?,?, ?, ?)";	
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			pstmt.setString(4, contents1);
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			return -1;			
		}finally {try {if (rs != null) {rs.close();}
			} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) {pstmt.close();}
			} catch (Exception e) {e.printStackTrace();}
			try {if (conn != null) {conn.close();}
			} catch (Exception e) {e.printStackTrace();}
		}
		
	}
}
