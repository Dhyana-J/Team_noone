package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.BoardService;
import com.kh.community.model.vo.BoardScrap;

/**
 * Servlet implementation class ScrapThController
 */
@WebServlet("/thscrap.bo")
public class ScrapThController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapThController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		BoardScrap s = new BoardScrap();
		s.setBoardNo(bno);
		s.setUserNo(userNo);
		
		int result = new BoardService().insertScrap(s);
		
		if(result > 0 ) {
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
