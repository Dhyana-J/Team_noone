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
 * Servlet implementation class InqInsertController
 */
@WebServlet("/insert.inq")
public class InqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String category = request.getParameter("category");
		String inquiryTitle = request.getParameter("title");
		String inquiryContent = request.getParameter("content");
		
		Inquiry i = new Inquiry();
		i.setUserNo(userNo);
		i.setInquiryType(category);
		i.setInquiryTitle(inquiryTitle);
		i.setInquiryContent(inquiryContent);
		
		int result = new InqService().insertInq(i);
		
		if(result >0) {
			
			request.getSession().setAttribute("alertMsg","문의작성에 성곻했습니다. 조속히 답변 드리겠습니다.");
			
			response.sendRedirect(request.getContextPath() +"/list.inq");
		}else {
			
			request.getSession().setAttribute("errorMsg", "문의작성에 실패했습니다.");
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
