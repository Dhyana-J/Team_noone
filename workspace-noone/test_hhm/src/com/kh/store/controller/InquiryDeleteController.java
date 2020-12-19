package com.kh.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;

/**
 * Servlet implementation class InquiryDeleteController
 */
@WebServlet("/piDelete.st")
public class InquiryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int piNo = Integer.parseInt(request.getParameter("piNo"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new ProductService().deletePi(piNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg2", "리뷰가 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.st?pno="+pno+"&rp=1&pip=1&qp=1");
			
		}else {
			request.setAttribute("errorMsg", "리뷰삭제 실패");
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
