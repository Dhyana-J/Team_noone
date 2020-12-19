package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.PageInfo;
import com.kh.review.model.vo.Report;
import com.kh.review.model.vo.ReviewCon;




public class ReviewService {
	
	public int selectRtotal(int Psort) {
		Connection conn = getConnection();
		if(Psort == 1) {
			int Rtotal = new ReviewDao().selectRtotal(conn);
			close(conn);
			return Rtotal;
		}
		else {
			int Rtotal = new ReviewDao().selectRtotal2(conn, Psort);
			close(conn);
			return Rtotal;
		}

	}
	public ArrayList<ReviewCon> selectReviewList(int Psort, PageInfo p){
		Connection conn = getConnection();
		if(Psort == 1) {
			ArrayList<ReviewCon> reviewList = new ReviewDao().selectReviewList(conn,p);
			
			close(conn);
			
			return reviewList;
		} else {
			ArrayList<ReviewCon> reviewList = new ReviewDao().selectReviewList2(conn,Psort,p);
			
			close(conn);
			
			return reviewList;
		}
		
	}
	public int insertReport(Report r) {
		Connection conn = getConnection();
		int result = new ReviewDao().insertReport(conn, r);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result2 = 0;
		int result = new ReviewDao().deleteReview(conn, reviewNo);
		if(result < 0) {
			result2 = 0;
		}else {
			result2 = new ReviewDao().changeStatus(conn, reviewNo);
		}
		if(result2 > 0 && result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result2;
	}
	

}
