package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.PageInfo;
import com.kh.review.model.vo.Report;
import com.kh.review.model.vo.Review;




public class ReviewService {
	
	public int selectRtotal(int Psort) {
		Connection conn = getConnection();
		int Rtotal = new ReviewDao().selectRtotal(conn, Psort);
		close(conn);
		return Rtotal;
	}
	public ArrayList<Review> selectReviewList(int Psort, PageInfo p){
		Connection conn = getConnection();
		ArrayList<Review> reviewList = new ReviewDao().selectReviewList(conn,Psort,p);
		
		close(conn);
		
		return reviewList;
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

}
