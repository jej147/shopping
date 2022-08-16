package board;

	import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


	public class BoardDAO {
	private Connection conn;
	private ResultSet rs;

	public BoardDAO() {
	try{
	String dbURL = "jdbc:mysql://localhost:3306/JSPBookDB";
	String dbId = "root";
	String dbPassword = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL,dbId,dbPassword);
	}catch(Exception e) {
	e.printStackTrace();
	}
  }
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db 오류
	}
	public int getNext() {
		String SQL = "SELECT tId FROM BOARD ORDER BY tId DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int write(String tTitle, String userId, String tContent) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, tTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, tContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	
	public ArrayList<Board> getList(int pageNumber){
		String SQL = "SELECT * FROM BOARD WHERE tId < ? AND tAvailable = 1 ORDER BY tId DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.settId(rs.getInt(1));
				board.settTitle(rs.getString(2));
				board.setUserId(rs.getString(3));
				board.settDate(rs.getString(4));
				board.settContent(rs.getString(5));
				board.settAvailable(rs.getInt(6));
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE tId < ? AND tAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Board getBoard(int tId) {
		String SQL = "SELECT * FROM BOARD WHERE tId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.settId(rs.getInt(1));
				board.settTitle(rs.getString(2));
				board.setUserId(rs.getString(3));
				board.settDate(rs.getString(4));
				board.settContent(rs.getString(5));
				board.settAvailable(rs.getInt(6));
				return board;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int tId, String tTitle, String tContent) {
		String SQL = "UPDATE BOARD SET tTitle = ?, tContent = ? WHERE tId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, tTitle);
			pstmt.setString(2, tContent);
			pstmt.setInt(3, tId);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int delete(int tId) {
		String SQL = "delete from board where tId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tId);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
