package com.kh.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.Basket;

/**
 * Servlet implementation class BasketInsertController
 */
@WebServlet("/basketInsert.st")
public class BasketInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pay = Integer.parseInt(request.getParameter("pay"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		
		Basket basket = new Basket();
		basket.setPno(pno);
		basket.setUserNo(userNo);
		basket.setCartAmount(amount);
		
		//int result = new ProductService().insertShopping(basket);
		
		//if(result>0) {	// shopping테이블 insert성공 후
			//System.out.println("성공");
			if(pay==0) { // 장바구니 선택시	보여질 화면
				//ArrayList<Basket> blist  = new ProductService().selectBasketList(userNo);
				//System.out.println(blist);
				//request.setAttribute("blist", blist);
				request.getRequestDispatcher("views/store/basket.jsp").forward(request, response);
			}else {//구매하기 선택시 보여질 화면
				request.getRequestDispatcher("views/store/pay.jsp").forward(request, response);
			}
//		}else {
//			request.setAttribute("errorMsg", "구매상품등록을 실패하였습니다.");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
