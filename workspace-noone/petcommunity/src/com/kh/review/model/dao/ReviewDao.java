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
import com.kh.review.model.vo.ReviewCon;

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

	public int selectRtotal(Connection conn) {
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
	public int selectRtotal2(Connection conn, int Psort) {
		int Rtotal = 0;
		
		//if (Psort == 1) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectRtotal2");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			if(Psort == 2) {
				pstmt.setString(1, "N");
			}else {
				pstmt.setString(1, "Y");
			}
			rset = pstmt.executeQuery();
			if (rset.next()) {
				Rtotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return Rtotal;
		//}
	}
	public ArrayList<ReviewCon> selectReviewList(Connection conn, PageInfo p) {
		ArrayList<ReviewCon> reviewList = new ArrayList<>();

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
			String reportClass = "";
			while (rset.next()) {
				if(rset.getInt("REPORT_CLASS_NO") == 1) {
					reportClass = "욕설";
				}else if(rset.getInt("REPORT_CLASS_NO") == 2) {
					reportClass = "중복";
				}else if(rset.getInt("REPORT_CLASS_NO") == 3) {
					reportClass = "광고";
				}else {
					reportClass = "기타";
				}
				
				reviewList.add(new ReviewCon(reportClass
						, rset.getString("REPORT_CONTENT")
						, rset.getInt("REPORT_CATE_NO")
						, rset.getString("USER_NAME")
						, rset.getString("REPORT_STATUS")));
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
	
	public ArrayList<ReviewCon> selectReviewList2(Connection conn, int Psort, PageInfo p) {
		ArrayList<ReviewCon> reviewList = new ArrayList<>();

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewList2");
		ResultSet rset = null;
		int startRow = (p.getCurrentPage() - 1) * 6 + 1;
		int endRow = startRow + 5;

		try {
			pstmt = conn.prepareStatement(sql);
			if(Psort == 2) {
				pstmt.setString(1, "N");
			}else {
				pstmt.setString(1, "Y");
			}
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			String reportClass = "";
			while (rset.next()) {
				if(rset.getInt("REPORT_CLASS_NO") == 1) {
					reportClass = "욕설";
				}else if(rset.getInt("REPORT_CLASS_NO") == 2) {
					reportClass = "중복";
				}else if(rset.getInt("REPORT_CLASS_NO") == 3) {
					reportClass = "광고";
				}else {
					reportClass = "기타";
				}
				
				reviewList.add(new ReviewCon(reportClass
						, rset.getString("REPORT_CONTENT")
						, rset.getInt("REPORT_CATE_NO")
						, rset.getString("USER_NAME")
						, rset.getString("REPORT_STATUS")));
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
	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,reviewNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int changeStatus(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeStatus");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,reviewNo);
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
