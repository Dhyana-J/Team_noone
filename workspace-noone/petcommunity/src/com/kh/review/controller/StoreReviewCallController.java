package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Report;

/**
 * Servlet implementation class StoreReviewCallController
 */
@WebServlet("/call.re")
public class StoreReviewCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreReviewCallController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		int reportClassNo = Integer.parseInt(request.getParameter("call_reason"));
		int reviewNo = Integer.parseInt(request.getParameter("review_no"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String reportContent= request.getParameter("call_reason_detail");
		Report r = new Report();
		r.setUserNo(userNo);
		r.setReportCateNo(reviewNo);
		r.setReportClassNo(reportClassNo);
		r.setReportContent(reportContent);
		r.setReportCate("V");
		int result = new ReviewService().insertReport(r);
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
