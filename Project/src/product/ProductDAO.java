package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.Product;

	public class ProductDAO {
	private Connection conn;
	private ResultSet rs;

	public ProductDAO() {
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
	
	public int getNext() {
		String SQL = "SELECT num FROM product ORDER BY num DESC";
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
	public int write(String pId, String pName, int pPrice, String pContent, String pFile ) {
		String SQL = "INSERT INTO PRODUCT VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, pId);
			pstmt.setString(3, pName);
			pstmt.setInt(4, pPrice);
			pstmt.setString(5, pContent);
			pstmt.setString(6, pFile);
			pstmt.setInt(7, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류

	}
	
	public ArrayList<Product> getList(int pageNumber){
		String SQL = "SELECT * FROM PRODUCT WHERE num < ? AND pAvailable = 1 ORDER BY num DESC LIMIT 20";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 20);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setNum(rs.getInt(1));
				product.setpId(rs.getString(2));
				product.setpName(rs.getString(3));
				product.setpPrice(rs.getInt(4));
				product.setpContent(rs.getString(5));
				product.setpFile(rs.getString(6));
				product.setpAvailable(rs.getInt(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM PRODUCT WHERE num < ? AND pAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 20);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Product getProduct(int num) {
		String SQL = "SELECT * FROM PRODUCT WHERE num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Product product = new Product();
				product.setNum(rs.getInt(1));
				product.setpId(rs.getString(2));
				product.setpName(rs.getString(3));
				product.setpPrice(rs.getInt(4));
				product.setpContent(rs.getString(5));
				product.setpFile(rs.getString(6));
				product.setpAvailable(rs.getInt(7));
				return product;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int num, String pId, String pName, int pPrice, String pContent, String pFile) {
		String SQL = "UPDATE PRODUCT SET pId = ?, pName = ?, pPrice = ?, pContent = ?, pFile = ? WHERE num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pId);
			pstmt.setString(2, pName);
			pstmt.setInt(3, pPrice);
			pstmt.setString(4, pContent);
			pstmt.setString(5, pFile);
			pstmt.setInt(6, num);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int delete(int num) {
		String SQL = "delete from product where num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
