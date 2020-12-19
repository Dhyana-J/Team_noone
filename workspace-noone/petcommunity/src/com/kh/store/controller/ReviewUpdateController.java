package com.kh.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/reviewUpdate.st")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int pno = Integer.parseInt(request.getParameter("pNo"));
		int reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewContent = request.getParameter("reivewContent");
		
		Review r = new Review();
		r.setReviewNO(reviewNo);
		r.setReviewTitle(reviewTitle);
		r.setReviewRating(reviewRating);
		r.setReviewContent(reviewContent);
		
		
		int result = new ProductService().updateReview(r);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg2", "리뷰가 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.st?pno="+pno+"&rp=1&pip=1&qp=1");
			
		}else {
			request.setAttribute("errorMsg", "리뷰수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
