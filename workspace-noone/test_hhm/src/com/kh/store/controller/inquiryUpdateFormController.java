package com.kh.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.Pinquiry;
import com.kh.store.model.vo.Review;

/**
 * Servlet implementation class inquiryUpdateFormController
 */
@WebServlet("/piUpdateForm.st")
public class inquiryUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inquiryUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int piNo = Integer.parseInt(request.getParameter("piNo"));

		
		
		Pinquiry pi = new ProductService().selectpInquiry(piNo);

		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/store/inquiryUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
