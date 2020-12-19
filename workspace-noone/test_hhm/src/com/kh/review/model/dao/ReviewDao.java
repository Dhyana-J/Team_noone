package com.kh.review.model.dao;

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

import com.kh.review.model.vo.PageInfo;
import com.kh.review.model.vo.Report;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	private Properties prop = new Properties();

	public ReviewDao() {

		String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectRtotal(Connection conn, int Psort) {
		int Rtotal = 0;
		
		//if (Psort == 1) {
		Statement stmt = null;
		String sql = prop.getProperty("selectRtotal");
		ResultSet rset = null;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				Rtotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return Rtotal;
		//}
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, int Psort, PageInfo p) {
		ArrayList<Review> reviewList = new ArrayList<>();

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewList");
		ResultSet rset = null;
		int startRow = (p.getCurrentPage() - 1) * 6 + 1;
		int endRow = startRow + 5;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				reviewList.add(new Review(rset.getInt("review_no"), rset.getString("review_title"),
						rset.getString("review_content"), rset.getDate("review_date"), rset.getInt("reivew_rating"),
						rset.getInt("p_no"), rset.getInt("user_no"), rset.getString("user_name")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return reviewList;
	}
	
	public int insertReport(Connection conn, Report r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReport");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,r.getUserNo());
			pstmt.setInt(2, r.getReportClassNo());
			pstmt.setString(3, r.getReportContent());
			pstmt.setString(4, r.getReportCate());
			pstmt.setInt(5, r.getReportCateNo());
			
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
