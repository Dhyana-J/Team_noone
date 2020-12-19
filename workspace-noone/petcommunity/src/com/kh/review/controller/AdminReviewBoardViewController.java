package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.PageInfo;
import com.kh.review.model.vo.ReviewCon;


/**
 * Servlet implementation class AdminReviewBoardViewController
 */
@WebServlet("/review.bo")
public class AdminReviewBoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewBoardViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("Page"));
		int Psort = Integer.parseInt(request.getParameter("Psort"));
		int Rtotal = new ReviewService().selectRtotal(Psort);
		int maxPage = (int)Math.ceil((double)Rtotal/6);
		
		int startPage = ((currentPage-1)/10) * 10 + 1;
		int endPage = startPage + 9;

		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo  p = new PageInfo(Rtotal, currentPage, maxPage, startPage, endPage);
		ArrayList<ReviewCon> list = new ReviewService().selectReviewList(Psort, p);
		request.setAttribute("p", p);
		request.setAttribute("Psort", Psort);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/review_board/reviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

