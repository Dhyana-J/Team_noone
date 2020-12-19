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
 * Servlet implementation class CommunityDetailController
 */
@WebServlet("/boardDetail.bo")
public class CommunityDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// 조회수 증가 
		int result = new BoardService().increaseCount(bno);
	
		if(result > 0 ) { // 유효한게시글일 때 게시글 정보 조회를 해야하고 첨부파일 정보도 조회됨 ! 
			
			// 게시글 정보 조회 (Board)
			Board b = new BoardService().selectBoard(bno);
	
			request.setAttribute("b", b);
			
			request.getRequestDispatcher("views/community/boardDetailView.jsp").forward(request, response);
		}else {
			
			request.setAttribute("errorMsg", "유효한 게시글이 아닙니다. 또는 해당 게시글이 삭제되었을 수 있습니다.");
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
