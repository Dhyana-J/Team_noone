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
 * Servlet implementation class ReviewEnrollController
 */
@WebServlet("/reviewInsert.st")
public class ReviewEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리뷰 insert
		request.setCharacterEncoding("utf-8");
		int pno = Integer.parseInt(request.getParameter("pNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int rating= Integer.parseInt(request.getParameter("reviewRating"));
		String title = request.getParameter("reviewTitle");
		String content = request.getParameter("reivewContent");
		
		Review r = new Review();
		r.setpNo(pno);
		r.setUserNo(userNo);
		r.setReviewRating(rating);
		r.setReviewTitle(title);
		r.setReviewContent(content);
		
		System.out.println(r);
		
		int result = new ProductService().reviewInsert(r);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg2", "리뷰가 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.st?pno="+pno+"&rp=1&pip=1&qp=1");
		}else {
			request.setAttribute("errorMsg", "리뷰가 등록을 실패하였습니다.");
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
