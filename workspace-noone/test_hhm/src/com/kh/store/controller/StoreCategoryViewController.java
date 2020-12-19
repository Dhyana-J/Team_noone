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
 * Servlet implementation class StoreCategoryViewController
 */
@WebServlet("/storeCategory.st")
public class StoreCategoryViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreCategoryViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		if(category.equals("D")) {
			int Ptotal = new ProductService().selectPtotal();
			int currentPage = Integer.parseInt(request.getParameter("Page"));
			
			int maxPage = (int)Math.ceil((double)Ptotal/12);
			
			int startPage = ((currentPage-1)/10) * 10 + 1;
			int endPage = startPage + 9;

			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo  p = new PageInfo(Ptotal, currentPage, maxPage, startPage, endPage);
			ArrayList<Product> list = new ProductService().selectProductList(p);
			request.setAttribute("p", p);
			request.setAttribute("category", category);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/store/store.jsp").forward(request, response);
		}else {
			int Ptotal = new ProductService().selectPtotal2();
			int currentPage = Integer.parseInt(request.getParameter("Page"));
			
			int maxPage = (int)Math.ceil((double)Ptotal/12);
			
			int startPage = ((currentPage-1)/10) * 10 + 1;
			int endPage = startPage + 9;

			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo  p = new PageInfo(Ptotal, currentPage, maxPage, startPage, endPage);
			ArrayList<Product> list = new ProductService().selectProductList2(p);
			request.setAttribute("p", p);
			request.setAttribute("category", category);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/store/store.jsp").forward(request, response);
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
