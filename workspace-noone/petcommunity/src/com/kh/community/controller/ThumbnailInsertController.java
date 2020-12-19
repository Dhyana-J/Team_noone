package com.kh.community.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.community.model.service.BoardService;
import com.kh.community.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ThumbnailInsertController
 */
@WebServlet("/thumbnailInsert.bo")
public class ThumbnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드 하기 위해서 하는 controller
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 용량제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 저장할 폴더의 물리적인 경로 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");// 마지막에 / 꼭 기술 여기 안에다가 넣을거니까 
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			String boardWriter = multiRequest.getParameter("userNo");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardPhoto = "/resources/thumbnail_upfiles/" + multiRequest.getFilesystemName("file1");
			
			
			Board b = new Board(boardWriter, boardTitle, boardContent, boardPhoto);
			
			
			
			int result = new BoardService().insertThumbnailBoard(b);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "사진 게시판 등록 성공 !");
				response.sendRedirect(request.getContextPath() + "/thumbnailList.bo?currentPage=1");
				
				
			}else {
				
				if(b.getBoardPhoto() != null) {
					File faildFile = new File(savePath + b.getBoardPhoto());
					faildFile.delete();
				}
				
				request.setAttribute("errorPage", "사진 게시판 등록 실패..");
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
