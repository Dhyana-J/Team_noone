package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3. 해당 요청을 처리하는 서비스 클래스의 메소드 호출 한 후 그에 해당하는 결과받기
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) {
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
		}else { 
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			
			System.out.println("로그인 성공!!");
			if(loginUser.getManager().equals("N")) {
				response.sendRedirect(request.getContextPath());
			}else {
//				request.getRequestDispatcher("views/common/mainPage.jsp").forward(request, response);
				//리퀘스트쓰면 login.me url이 유지되어 오류가능성있다. 그래서  리다이렉트로 바꿔줌.
				response.sendRedirect(request.getContextPath());
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
