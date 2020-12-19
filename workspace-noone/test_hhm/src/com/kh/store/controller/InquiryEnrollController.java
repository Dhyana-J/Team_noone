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
 * Servlet implementation class InquiryEnrollController
 */
@WebServlet("/inquiryInsert.st")
public class InquiryEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int pno = Integer.parseInt(request.getParameter("pNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String secret= request.getParameter("secret");
		String title = request.getParameter("inquiry_title");
		String content = request.getParameter("inquiry_content");
		
		System.out.print(secret);
		Pinquiry Pi = new Pinquiry();
		
		Pi.setpNo(pno);
		Pi.setUserNo(userNo);
		Pi.setSecret(secret);
		Pi.setPiTitle(title);
		Pi.setPiContent(content);
		
		int result = new ProductService().PinquiryInsert(Pi);
		if(result>0) {
			System.out.println("성공");
			response.sendRedirect(request.getContextPath() + "/detail.st?pno="+pno+"&rp=1&pip=1");
		}else {
			request.setAttribute("errorMsg", "문의 등록을 실패하였습니다.");
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
