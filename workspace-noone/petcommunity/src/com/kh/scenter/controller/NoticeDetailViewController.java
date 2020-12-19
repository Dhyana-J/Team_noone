package com.kh.scenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scenter.model.vo.Notice;
import com.kh.scenter.model.service.ScenterService;

/**
 * Servlet implementation class noticeDetailViewController
 */
@WebServlet("/detail.no")
public class NoticeDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		int result = new ScenterService().increaseCount(nno);
		
		if(result >0) {
			
			Notice n = new ScenterService().selectNotice(nno);
			
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/scenter/serviceCenterDetailView.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("errorMsg", "게시글 조회에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
			
			
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
