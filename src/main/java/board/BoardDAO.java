package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

public class BoardDAO {
	// DAO란 데이터 접근 객체로 데이터에 접근해서 데이터 빼오는 것임. 
	private Connection conn; 
	private ResultSet rs;

	
		public BoardDAO() {
			try {
				String DBurl = "jdbc:mariadb://localhost/nssiwl";
				String DBid = "nssiwl";
				String DBpass = "dmswls1130";
				Class.forName("org.mariadb.jdbc.Driver"); // �젒�냽�븯�뒗 �씪�씠釉뚮윭由�
				conn = DriverManager.getConnection(DBurl, DBid, DBpass);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 글쓰기를 위해선 3개의 함수 필요.
		
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
		
		// 일정작성
		public int write(String userID, String startDate, String endDate, String content) {
			String SQL = "INSERT INTO luda_calendar VALUES (?, ?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, userID);
				pstmt.setString(3, getDate());
				pstmt.setString(4, startDate);
				pstmt.setString(5, endDate);
				pstmt.setString(6, content);
				pstmt.setInt(7, 1);
				
				return pstmt.executeUpdate();

			}	catch (Exception e) {
					e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		// 글목록 가져오기
		public ArrayList<Board> getList(int pageNumber) {
			String SQL = "SELECT * FROM luda_calendar WHERE `index` < ? AND conAvailable = 1 ORDER BY `index` DESC LIMIT 10";
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Board board = new Board();
					board.setIndex(rs.getInt(1));
					board.setUserID(rs.getString(2));
					board.setWriteDate(rs.getString(3));
					board.setStartDate(rs.getString(4));
					board.setEndDate(rs.getString(5));
					board.setContent(rs.getString(6)); 
					board.setConAvailable(rs.getInt(7));
					list.add(board);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list; //데이터베이스 오류
		}
		
		// 게시글이 딱 10개면 다음 페이지 버튼이 없어야 함.
		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM luda_calendar WHERE `index` < ? AND conAvailable = 1 ORDER BY `index` DESC LIMIT 10";
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;

				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return false; //데이터베이스 오류
		}
		
		// 뷰 페이지
		public Board getBoard(int index) {
			String SQL = "SELECT * FROM luda_calendar WHERE `index` = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, index);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Board board = new Board();
					board.setIndex(rs.getInt(1));
					board.setUserID(rs.getString(2));
					board.setWriteDate(rs.getString(3));
					board.setStartDate(rs.getString(4));
					board.setEndDate(rs.getString(5));
					board.setContent(rs.getString(6)); 
					board.setConAvailable(rs.getInt(7));
					return board;

				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null; //데이터베이스 오류
		}
		
		
		// 자기가 쓴거 조회ㅇㅅㅇ..
		public ArrayList<Board> find(String userID) {
			  String SQL = "SELECT * FROM  luda_calendar WHERE userID = ? ORDER BY `INDEX` DESC LIMIT 10";
			  ArrayList<Board> list = new ArrayList<Board>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, userID);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Board board = new Board();
						board.setIndex(rs.getInt(1));
						board.setUserID(rs.getString(2));
						board.setWriteDate(rs.getString(3));
						board.setStartDate(rs.getString(4));
						board.setEndDate(rs.getString(5));
						board.setContent(rs.getString(6)); 
						board.setConAvailable(rs.getInt(7));
						list.add(board);
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				return list; //데이터베이스 오류
		}
}


