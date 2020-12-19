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
 * Servlet implementation class InquiryUpdateController
 */
@WebServlet("/inquiryUpdate.st")
public class InquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int piNo = Integer.parseInt(request.getParameter("piNo"));
		int pno = Integer.parseInt(request.getParameter("pNo"));
		String secret = request.getParameter("secret");
		String piTitle = request.getParameter("inquiry_title");
		String piContent = request.getParameter("inquiry_content");
		
		Pinquiry pi = new Pinquiry();
		pi.setPiNo(piNo);
		pi.setSecret(secret);
		pi.setPiTitle(piTitle);
		pi.setPiContent(piContent);
		
		System.out.println(piNo);
		int result = new ProductService().updatePi(pi);
		
		if(result>0){
			request.getSession().setAttribute("alertMsg2", "문의가 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.st?pno="+pno+"&rp=1&pip=1&qp=1");
			
		}else {
			request.setAttribute("errorMsg", "리뷰수정 실패");
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
