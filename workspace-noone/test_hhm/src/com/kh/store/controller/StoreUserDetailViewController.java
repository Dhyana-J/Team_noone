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
import com.kh.store.model.vo.Pinquiry;
import com.kh.store.model.vo.Product;
import com.kh.store.model.vo.Review;

/**
 * Servlet implementation class StoreUserDetailViewController
 */
@WebServlet("/detail.st")
public class StoreUserDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreUserDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		//상품테이블
		Product p = new ProductService().selectDetailProduct(pno);
		//url테이블
		ArrayList<String> list = new ProductService().selectDetailUrl(pno);
		//리뷰테이블
		
		//임시, 나중에 ajax 처리할 예정
		int rtotal = new ProductService().selectReviewTotal(pno);
		int piTotal = new ProductService().selectPiTotal(pno);
		
		int currentPage = Integer.parseInt(request.getParameter("rp"));
		int maxPage = (int)Math.ceil((double)rtotal/5);
		int startPage = ((currentPage - 1)/10)*10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		int currentPage2 = Integer.parseInt(request.getParameter("pip"));
		int maxPage2 = (int)Math.ceil((double)piTotal/5);
		int startPage2 = ((currentPage2 - 1)/10)*10 + 1;
		int endPage2 = startPage2 + 9;
		if(endPage2 > maxPage2) {
			endPage2 = maxPage2;
		}
		
		PageInfo rpi = new PageInfo(rtotal, currentPage, maxPage, startPage, endPage);
		PageInfo qpi = new PageInfo(piTotal,currentPage2, maxPage2, startPage2, endPage2);
		
		ArrayList<Review> reviewList = new ProductService().selectReviewList(pno,rpi);
		ArrayList<Pinquiry> PiList = new ProductService().selectPiList(pno,qpi);
		System.out.println(PiList);
		request.setAttribute("PiList", PiList);
		request.setAttribute("reviewList",reviewList);
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.setAttribute("rpi", rpi);
		request.setAttribute("qpi", qpi);
		request.getRequestDispatcher("views/store/storeDetail.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
