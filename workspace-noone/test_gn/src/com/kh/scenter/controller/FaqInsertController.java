package com.kh.scenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scenter.model.service.FaqService;

/**
 * Servlet implementation class faqInsertController
 */
@WebServlet("/insert.faq")
public class FaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String faqContent = request.getParameter("content");
		String faqAnswer = request.getParameter("answer");
		
		
		
		int result = new FaqService().insertFaq(faqContent, faqAnswer);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "자주묻는질문을 성공적으로등록했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/list.faq");
			
			
			
		}else {
			
			request.getSession().setAttribute("errorMsg", "자주묻는질문 작성에 실패했습니다.");
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
