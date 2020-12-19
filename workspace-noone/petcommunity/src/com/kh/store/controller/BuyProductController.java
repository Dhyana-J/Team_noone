package com.kh.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;

/**
 * Servlet implementation class BuyProductController
 */
@WebServlet("/buyproduct.st")
public class BuyProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number = 1;
		int pno = Integer.parseInt(request.getParameter("pno"));
		int result = new ProductService().Buy(number, pno);
		if (result > 0) { // 성공 => 리스트페이지(list.th url로 재요청) 요청
			request.getSession().setAttribute("alertMsg3", "상품 구매 성공!");
			response.sendRedirect(request.getContextPath() + "/storeCategory.st?Page=1&category=D");

		} else { 
			request.setAttribute("errorMsg", "상품 구매 실패");
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
