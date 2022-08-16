package news;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


	public class NewsDAO {
	private Connection conn;
	private ResultSet rs;

	public NewsDAO() {
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
		String SQL = "SELECT nId FROM NEWS ORDER BY nId DESC";
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
	public int write(String nTitle, String userId, String nContent) {
		String SQL = "INSERT INTO NEWS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, nTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, nContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	
	public ArrayList<News> getList(int pageNumber){
		String SQL = "SELECT * FROM NEWS WHERE nId < ? AND nAvailable = 1 ORDER BY nId DESC LIMIT 10";
		ArrayList<News> list = new ArrayList<News>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News news = new News();
				news.setnId(rs.getInt(1));
				news.setnTitle(rs.getString(2));
				news.setUserId(rs.getString(3));
				news.setnDate(rs.getString(4));
				news.setnContent(rs.getString(5));
				news.setnAvailable(rs.getInt(6));
				list.add(news);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM NEWS WHERE nId < ? AND nAvailable = 1";
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
	public News getNews(int nId) {
		String SQL = "SELECT * FROM NEWS WHERE nId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, nId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				News news = new News();
				news.setnId(rs.getInt(1));
				news.setnTitle(rs.getString(2));
				news.setUserId(rs.getString(3));
				news.setnDate(rs.getString(4));
				news.setnContent(rs.getString(5));
				news.setnAvailable(rs.getInt(6));
				return news;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int nId, String nTitle, String nContent) {
		String SQL = "UPDATE NEWS SET nTitle = ?, nContent = ? WHERE nId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nTitle);
			pstmt.setString(2, nContent);
			pstmt.setInt(3, nId);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int delete(int nId) {
		String SQL = "delete from news where nId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, nId);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
