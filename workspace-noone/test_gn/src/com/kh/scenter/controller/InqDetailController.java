package com.kh.scenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scenter.model.service.InqService;
import com.kh.scenter.model.vo.Inquiry;

/**
 * Servlet implementation class inqDetailController
 */
@WebServlet("/detail.inq")
public class InqDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		
		Inquiry i = new InqService().selectInq(ino);
		
		if(i != null) {
			request.setAttribute("i", i);
			request.getRequestDispatcher("views/scenter/inquiryDetail.jsp").forward(request, response);
			
		}else {
			request.getSession().setAttribute("errorMsg", "문의 상세조회에 실패했습니다.");
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
