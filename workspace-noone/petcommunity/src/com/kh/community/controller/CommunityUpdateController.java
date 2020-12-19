package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.community.model.service.BoardService;
import com.kh.community.model.vo.Board;

/**
 * Servlet implementation class CommunityUpdateController
 */
@WebServlet("/boardUpdate.bo")
public class CommunityUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
	
		Board b = new Board();
		b.setBoardNo(bno);
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		
		int result = new BoardService().updateBoard(b);
		
			
		if(result > 0 ) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "게시물 수정 성공! ");
			
			response.sendRedirect(request.getContextPath() + "/boardDetail.bo?bno=" + bno);
														
		}else {
			
			request.setAttribute("errorPage", "수정을 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage").forward(request, response);
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
