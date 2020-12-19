package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.BoardService;
import com.kh.community.model.vo.BoardComment;

/**
 * Servlet implementation class CommentInsertController
 */
@WebServlet("/rinsert.bo")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String commentContent = request.getParameter("content");
	int bno = Integer.parseInt(request.getParameter("bno"));
	String userNo = request.getParameter("userNo");
	
	BoardComment c = new BoardComment();
	c.setBoardNo(bno);
	c.setUserNo(userNo);
	c.setCommentContent(commentContent);
	
	int result = new BoardService().insertComment(c);
	
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
