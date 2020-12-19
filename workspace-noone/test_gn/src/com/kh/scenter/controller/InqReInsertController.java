package com.kh.scenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scenter.model.service.InqService;

/**
 * Servlet implementation class InqReInsertController
 */
@WebServlet("/reInsert.inq")
public class InqReInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqReInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		String reContent = request.getParameter("content");
		
		int result = new InqService().insertRe(ino, reContent);
		
		if(result > 0 ) {
			
			request.getSession().setAttribute("alertMsg", "답변등록에 성공했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/list.inq");
		}else {
			
			request.setAttribute("errorMsg", "답변작성에 실패했습니다.");
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
