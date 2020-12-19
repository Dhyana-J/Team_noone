package com.kh.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.Pinquiry;

/**
 * Servlet implementation class inquiryDetailController
 */
@WebServlet("/inquiryDetail.st")
public class inquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inquiryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int piNo = Integer.parseInt(request.getParameter("piNo"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new ProductService().increaseCount(piNo);
		
		if(result>0) {
		Pinquiry pi = new ProductService().selectpInquiry(piNo);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/store/detailInquiry.jsp").forward(request, response);
		
		}else {
			request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
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
