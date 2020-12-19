package com.kh.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.PageInfo;
import com.kh.store.model.vo.Product;

/**
 * Servlet implementation class StoreAdminStockBoardVIewController
 */
@WebServlet("/stock.st")
public class StoreAdminStockBoardVIewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreAdminStockBoardVIewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int psort = Integer.parseInt(request.getParameter("Psort"));
		
		int stocktotal = new ProductService().selectStockTotal(psort);
		int currentPage = Integer.parseInt(request.getParameter("Page"));
		
		int maxPage = (int)Math.ceil((double)stocktotal/12);
		
		int startPage = ((currentPage-1)/10) * 10 + 1;
		int endPage = startPage + 9;

		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo  p = new PageInfo(stocktotal, currentPage, maxPage, startPage, endPage);
		ArrayList<Product> list = new ProductService().selectStockList(p, psort);
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.setAttribute("Psort", psort);
		request.getRequestDispatcher("views/stock_board/stockList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
