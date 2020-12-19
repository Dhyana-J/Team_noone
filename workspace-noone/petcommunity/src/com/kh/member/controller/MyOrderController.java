package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.PageInfo;
import com.kh.member.model.vo.MyOrder;

/**
 * Servlet implementation class MyOrderFormController
 */
@WebServlet("/myOrder.me")
public class MyOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//유저 번호 가져오기
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String sortOption = request.getParameter("sortOption");
		
		// ----------------------- 페이징 처리 ----------------------
		int listCount;			// 현재 일반 게시판 총 갯수
		int currentPage;		// 사용자가 요청한 페이지 (즉, 현재 페이지)
		int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit; 		// 한 페이지 내에 보여질 게시글 최대갯수
		
		int maxPage;			// 전체 페이지들 중에서 가장 마지막 페이지 수 
		int startPage;			// 현재 사용자가 요청한페이지에 하단에 보여질 페이징 바의 시작수
		int endPage;			// 현재 사용자가 요청한페이지에 하단에 보여질 페이징 바의 끝수
		
		
		// * listCount : 현재 일반 게시판 총 게시글 갯수
		listCount = new MemberService().selectMyOrderCount(userNo);
		
		// * currentPage : 사용자가 요청한 페이지 (즉, 현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대갯수 (몇 개 단위씩 보여지게할껀지)
		pageLimit = 5;
		
		// * boardLimit : 한 페이지 내에 보여질 게시글 최대갯수 (몇 개 단위씩 보여지게할껀지)
		boardLimit = 4;
		
		// * maxPage : 제일 마지막 페이지 수
		/*
		 * listCount, boardLimit에 영향을 받음
		 * 
		 * ex) boardLimit : 10 이라는 가정하에 
		 * 
		 *  총갯수    boardLimit          			  maxPage
		 *  100.0 /   10	  => 10.0		=>      10
		 *  101.0 /   10 	  => 10.1		=>   	11
		 *  102.0 /   10	  => 10.2		=> 		11
		 *    ....
		 *  109.0 /   10	  => 10.9		=>      11
		 *  
		 *  총게시글갯수(실수)/boardLimit => 올림처리  => maxPage
		 * 
		 */
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		
		// * startPage : 현재 사용자가 요청한페이지에 하단에 보여질 페이징 바의 시작수
		/*
		 * currentPage, pageLimit 에 영향을 받음
		 * 
		 * ex) pageLimit : 10 이라는 가정하에
		 *     startPage : 1, 11, 21, 31, 41, .....	=> n * 10 + 1	==>  n * pageLimit + 1
		 *     
		 * 	   currentPage = 1    =>  1				=> 0 * 10 + 1	=> n=0
		 *     currentPage = 5	  =>  1				=> 0 * 10 + 1   => n=0
		 *     currentPage = 10	  =>  1				=> 0 * 10 + 1   => n=0
		 *     
		 *     currentPage = 11	  =>  11			=> 1 * 10 + 1	=> n=1
		 *     currentPage = 15	  =>  11			=> 1 * 10 + 1   => n=1
		 *     currentPage = 20   =>  11			=> 1 * 10 + 1   => n=1
		 *     
		 *     
		 *         currentPage = 1 ~10		=>   n=0
		 *         currentPage = 11~20      =>   n=1
		 *         currentPage = 21~30		=>   n=2
		 *         								 n = (currentPage-1)/pageLimit 
		 *     	
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		// * endPage : 현재 사용자가 요청한페이지에 하단에 보여질 페이징 바의 끝수
		/*
		 * startPage, pageLimit 에 기본적으로 영향을 받음
		 * 
		 * ex) pageLimit : 10 이라는 가정하여
		 * 
		 * startPage : 1		=> endPage : 10
		 * startPage : 11		=> endPage : 20
		 * startPage : 21		=> endPage : 30
		 */
		endPage = startPage + pageLimit - 1;
		
		// 만약 maxPage가 고작 13까지 밖에 안된다면 ? endPage를 다시 13으로 해줘야됨
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		// 페이징바를 만들때 필요한 정보들이 담겨있는 PageInfo 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		
		//---------------------- 주문정보 가져오기 --------------------------
		
		//페이지 정보를 가지고 주문내역 조회해서 ArrayList에 담기.
		ArrayList<MyOrder> list = new MemberService().selectMyOrderList(userNo,pi,sortOption);
		
		request.setAttribute("pi", pi);
		request.setAttribute("orderList", list);
		request.setAttribute("sortOption", sortOption);
		
		request.getRequestDispatcher("views/member/myPage/myOrder.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
