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

import com.kh.scenter.model.vo.Faq;
public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		
		String fileName = FaqDao.class.getResource("/sql/scenter/faq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public ArrayList<Faq> selectFaqList(Connection conn){
		
		ArrayList<Faq> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaqList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				list.add(new Faq( 
						         rset.getInt("faq_no"),
						         rset.getString("faq_content"),
						         rset.getString("faq_answer")
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
	
	public int insertFaq(Connection conn, String faqContent, String faqAnswer) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, faqContent);
			pstmt.setString(2, faqAnswer);
			
			result = pstmt.executeUpdate();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public Faq selectFaq(Connection conn, int fno) {
		Faq f = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaq");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new Faq(
							rset.getInt("faq_no"),
							rset.getString("faq_content"),
							rset.getString("faq_answer")
					
							);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
		
	}
	
	public int updateFaq(Connection conn, Faq f) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, f.getFaqContent());
			pstmt.setString(2, f.getFaqAnswer());
			pstmt.setInt(3, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
		
	}
	
	
	public int deleteFaq(Connection conn, int fno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
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
