package com.kh.scenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scenter.model.service.FaqService;
import com.kh.scenter.model.vo.Faq;

/**
 * Servlet implementation class faqUpdateController
 */
@WebServlet("/update.faq")
public class FaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		String faqContent = request.getParameter("content");
		String faqAnswer = request.getParameter("answer");
		
		Faq f = new Faq();
		f.setFaqNo(fno);
		f.setFaqContent(faqContent);
		f.setFaqAnswer(faqAnswer);
		
		int result = new FaqService().updateFaq(f);
		
		if(result>0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			
			response.sendRedirect(request.getContextPath()+"/list.faq");
		}else {
			
			request.getSession().setAttribute("errorMsg", "수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorMsg.jsp").forward(request, response);
			
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
