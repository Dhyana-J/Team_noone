package com.kh.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.PCImageRenamePolicy;
import com.kh.store.model.service.ProductService;
import com.kh.store.model.vo.ImageUrl;
import com.kh.store.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateProductController
 */
@WebServlet("/updateProduct.st")
public class UpdateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");

			if (ServletFileUpload.isMultipartContent(request)) {
				int maxSize = 100 * 1024 * 1024;
				String savePath = request.getSession().getServletContext().getRealPath("/resources/productImage/");
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
						new PCImageRenamePolicy());
				int pno = Integer.parseInt(request.getParameter("pno"));
				System.out.println(pno);
				String pName = multiRequest.getParameter("pName");
				int price = Integer.parseInt(multiRequest.getParameter("price"));
				String pCategory = multiRequest.getParameter("pCategory");
				int pStock = Integer.parseInt(multiRequest.getParameter("pStock"));
				String pBrand = multiRequest.getParameter("pBrand");
				String pModel = multiRequest.getParameter("pModel");
				String description = multiRequest.getParameter("description");
				Product p = new Product(pName, price, description, pStock, pCategory, pBrand, pModel);

				
				int result = new ProductService().StoreUpdate(p, pno);
				if (result > 0) { // 성공 => 리스트페이지(list.th url로 재요청) 요청

					request.getSession().setAttribute("alertMsg3", "상품 수정 성공!");
					response.sendRedirect(request.getContextPath() + "/storeCategory.st?Page=1&category=D");

				} else { 


					request.setAttribute("errorMsg", "상품 수정 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

				}
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
