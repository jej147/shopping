		package user;
		
		import java.sql.Connection;
		import java.sql.DriverManager;
		import java.sql.PreparedStatement;
		import java.sql.ResultSet;
		import java.sql.SQLException;
		import java.util.ArrayList;

import board.Board;

		
		public class UserDAO {
		User user = new User();
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private String userName;
		
		public UserDAO() {
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
		public int login(String userId, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userId = ?" ;
		try {
			
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userId); 
		rs = pstmt.executeQuery();
		if(rs.next()) {
		if(rs.getString(1).equals(userPassword)){
		return 1; //로그인 성공
		}
		else 
		return 0; //비밀번호 불일치
		}
		return -1; // 아이디가 없음
		} catch (Exception e) {
		e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
		}
		public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		
		try {
		
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserPassword());
		pstmt.setString(3, user.getUserName());
		pstmt.setString(4, user.getUserPhone1());
		pstmt.setString(5, user.getUserPhone2());
		return pstmt.executeUpdate(); 
		
		} catch(Exception e) {
		
		e.printStackTrace();
		
		}
		
		return -1; //데이터베이스 오류
		}
		public User getUser(String userId) {
			String SQL = "SELECT * FROM user WHERE userId = ?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					user.setUserId(rs.getString(1));
					user.setUserPassword(rs.getString(2));
					user.setUserName(rs.getString(3));
					user.setUserPhone1(rs.getString(4));
					user.setUserPhone2(rs.getString(5));
					return user;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		public int update(String userId, String userName, String userPassword, String userPhone1, String userPhone2) {
			String SQL = "UPDATE USER SET userPassword = ?, userName = ?, userPhone1 = ?, userPhone2 = ? WHERE userId = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userPassword);
				pstmt.setString(2, userName);
				pstmt.setString(3, userId);
				pstmt.setString(4, userPhone1);
				pstmt.setString(5, userPhone2);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
		public int delete(String userId) {
			String SQL = "delete from user where userId=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userId);
				return pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //db 오류
		}
		}
	