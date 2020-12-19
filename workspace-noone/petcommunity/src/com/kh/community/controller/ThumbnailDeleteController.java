package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.BoardService;

/**
 * Servlet implementation class ThumbnailDeleteController
 */
@WebServlet("/thumbnailDelete.bo")
public class ThumbnailDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardService().deleteBoard(bno);
	
		if(result > 0 ) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 게시물이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/thumbnailList.bo?currentPage=1");
			
		}else{ // 에러문구 담아서 에러 페이지 보여주기 
			request.setAttribute("errorMsg", "삭제 실패하였습니다.");
			request.getRequestDispatcher("veiws/common/errorPage.jsp").forward(request, response);
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
