package com.kh.scenter.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.scenter.model.vo.Inquiry;

public class InqDao {
	
	private Properties prop = new Properties();
	
	public InqDao() {
		
		String fileName = InqDao.class.getResource("/sql/scenter/inq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public ArrayList<Inquiry> selectInqList(Connection conn){
		
		ArrayList<Inquiry> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInqList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Inquiry(
									  rset.getInt("inquiry_no"),
									  rset.getString("user_name"),
									  rset.getString("inquiry_title"),
									  rset.getString("inquiry_content"),
									  rset.getDate("inquiry_date"),
									  rset.getString("inquiry_status"),
									  rset.getString("inquiry_type"),
									  rset.getString("re_content"),
									  rset.getDate("re_date")
						));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	
		
		
		
	}
	
	public Inquiry selectInq(Connection conn, int ino) {
		
		Inquiry i = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ino);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Inquiry(
						  rset.getInt("inquiry_no"),
						  rset.getString("user_name"),
						  rset.getString("inquiry_title"),
						  rset.getString("inquiry_content"),
						  rset.getDate("inquiry_date"),
						  rset.getString("inquiry_status"),
						  rset.getString("inquiry_type"),
						  rset.getString("re_content"),
						  rset.getDate("re_date")
			);
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return i;
	}
	
	public int insertInq(Connection conn, Inquiry i) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, i.getUserNo());
			pstmt.setString(2, i.getInquiryTitle());
			pstmt.setString(3, i.getInquiryContent());
			pstmt.setString(4, i.getInquiryType());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public int insertRe(Connection conn, int ino, String reContent) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reContent);
			pstmt.setInt(2, ino);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateInq(Connection conn, Inquiry i) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, i.getInquiryTitle());
			pstmt.setString(2, i.getInquiryContent());
			pstmt.setString(3, i.getInquiryType());
			pstmt.setInt(4, i.getInquiryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteInq(Connection conn, int ino) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ino);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateRe(Connection conn, int ino, String reContent) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reContent);
			pstmt.setInt(2, ino);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteRe(Connection conn, int ino) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ino);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}
