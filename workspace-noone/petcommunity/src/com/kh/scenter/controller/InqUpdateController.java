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
 * Servlet implementation class InqUpdateController
 */
@WebServlet("/update.inq")
public class InqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		String category = request.getParameter("category");
		String inqTitle = request.getParameter("title");
		String inqContent = request.getParameter("content");
		
		Inquiry i = new Inquiry();
		i.setInquiryNo(ino);
		i.setInquiryType(category);
		i.setInquiryTitle(inqTitle);
		i.setInquiryContent(inqContent);
		
		int result = new InqService().updateInq(i);
		
		if(result >0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.inq?inp=" + ino);
			
		}else {
			request.getSession().setAttribute("errorMsg", "수정에 실패했습니다.");
			
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
