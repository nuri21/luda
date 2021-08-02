package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FileDAO {
	
	private Connection conn; 
	private ResultSet rs;

		public FileDAO() {
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
		
//		로컬DB
//		public BoardDAO() {
//			try {
//				String DBurl = "jdbc:mariadb://localhost:3306/local_table";
//				String DBid = "root";
//				String DBpass = "1234";
//				Class.forName("org.mariadb.jdbc.Driver");
//				conn = DriverManager.getConnection(DBurl, DBid, DBpass);			
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		// 현재 시간을 가져오는 함수
		public String getDate() {
			String SQL = "SELECT NOW()"; // 현재의 시간을 가져옴
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}	catch (Exception e) {
					e.printStackTrace();
			}
			return ""; // 데이터베이스 오류
		}
		
		// 게시글 번호 가지고 오는 것
		public int getNext() {
			String SQL = "SELECT `index` FROM luda_calendar ORDER BY `index` DESC"; // 정렬
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		public int upload(String userID, String writeDate, String fileName, String fileRealName, String fileContents) {
			String SQL = "INSERT INTO luda_file (userID, writeDate, fileName, fileRealName, fileContents, fileAvailable) VALUES (?, ?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, userID);
				pstmt.setString(3, writeDate);
				pstmt.setString(4, getDate());
				pstmt.setString(5, fileName);
				pstmt.setString(6, fileRealName);
				pstmt.setString(7, fileContents);
				pstmt.setInt(8, 1);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

}
