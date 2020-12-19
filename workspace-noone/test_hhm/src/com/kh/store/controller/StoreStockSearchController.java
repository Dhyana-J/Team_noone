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
 * Servlet implementation class StoreStockSearchController
 */
@WebServlet("/stockSearch.st")
public class StoreStockSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreStockSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int Psort = Integer.parseInt(request.getParameter("Psort"));
		String pKey = request.getParameter("pKey");
		int Stotal = new ProductService().selectStockSearchTotal(Psort, pKey);
		int currentPage = Integer.parseInt(request.getParameter("Page"));
		int maxPage = (int)Math.ceil((double)Stotal/12);
		
		int startPage = ((currentPage-1)/10) * 10 + 1;
		int endPage = startPage + 9;

		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(Stotal, currentPage, maxPage, startPage, endPage);
		ArrayList<Product> list = new ProductService().selectStockSearch(Psort, pKey, pi);
		request.setAttribute("list", list);
		request.setAttribute("p", pi);
		request.setAttribute("Psort", Psort);
		request.setAttribute("pKey", pKey);
		request.getRequestDispatcher("views/stock_board/stockSearch.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath() + "/stock.st?Page=1&Psort=" + Psort + "&pKey=" + pKey);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
