package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.BoardService;
import com.kh.community.model.vo.Board;

/**
 * Servlet implementation class CommunityInsertController
 */
@WebServlet("/boardInsert.bo")
public class CommunityInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String boardtitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String boardWriter = request.getParameter("userNo");
		
		Board b= new Board();
		b.setBoardTitle(boardtitle);
		b.setBoardContent(boardContent);
		b.setUserNo(boardWriter);
		
		int result = new BoardService().insertBoard(b);
		
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "게시글 등록 성공 ! ");
			response.sendRedirect(request.getContextPath() + "/communityList.bo?currentPage=1");
			
			
		}else {
			
			request.setAttribute("errorMsg", "업로드 실패입니다");
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
