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
 * Servlet implementation class ThumbnailUpdateController
 */
@WebServlet("/thumbnailUpdate.bo")
public class ThumbnailUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardPhoto = "/resources/thumbnail_upfiles/" + multiRequest.getFilesystemName("reUpfile");
			
			
			
			Board b = new Board(bno, boardTitle, boardContent, boardPhoto);
				
			if(multiRequest.getOriginalFileName("reUpfile") != multiRequest.getOriginalFileName("originFile")) {
				
				b.setBoardPhoto("/resources/thumbnail_upfiles/" + multiRequest.getFilesystemName("reUpfile"));
				
				
			}
			
			
			int result = new BoardService().updateThBoard(b);
			
			
			if(result > 0) {
				
					if( multiRequest.getParameter("reUpfile")!= null) {
					
						File deleteFile = new File(savePath + multiRequest.getParameter("reUpfile"));
						deleteFile.delete();
					}
					
					request.getSession().setAttribute("alertMsg", "게시글 수정 성공~");
					response.sendRedirect(request.getContextPath() + "/thumbnailDetail.bo?bno="+ bno);
				
				
			}else {
				request.setAttribute("errorMsg", "게시글 수정 실패!");
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
