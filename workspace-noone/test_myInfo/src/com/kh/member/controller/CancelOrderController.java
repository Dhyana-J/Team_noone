package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class CancelOrderController
 */
@WebServlet("/cancelOrder.me")
public class CancelOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//주문번호를 가지고 shopping테이블의 주문상태를 '주문취소'로 변경해주자
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		
		System.out.println(orderNo);
		
		int result = new MemberService().cancelOrder(orderNo);
		
		response.setCharacterEncoding("utf-8");
		
		if(result>0) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
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
