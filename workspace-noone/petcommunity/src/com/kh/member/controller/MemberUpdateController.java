package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정(utf-8)
		request.setCharacterEncoding("utf-8");

		//요청시 전달된 값 뽑아주기.
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		int addressCode = Integer.parseInt(request.getParameter("addressCode"));



		//사용자가 수정한 정보를 맴버객체 m에 세팅한다.
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setUserName(userName);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address);
		m.setAddressDetail(addressDetail);
		m.setAddressCode(addressCode);

		//m을 가지고 DB 업데이트 요청한 후 결과값을 updateMem객체에 담는다.
		Member updateMem = new MemberService().updateMember(m);

		if(updateMem!=null) {//업뎃성공

			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원정보 수정 성공!");
			response.sendRedirect(request.getContextPath()+"/myPage.me");

		}else {//업뎃실패

			request.setAttribute("errorMsg", "회원정보 수정 실패");
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
