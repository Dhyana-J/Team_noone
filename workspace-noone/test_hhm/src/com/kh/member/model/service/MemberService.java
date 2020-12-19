package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.MyOrder;
import com.kh.member.model.vo.PageInfo;


public class MemberService {
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return loginUser;
	}
	
	public int MemberInsert(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().MemberInsert(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int CheckId(String cId) {
		Connection conn = getConnection();
		int result = new MemberDao().CheckId(conn, cId);
		
		close(conn);
		return result;
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();

		int result = new MemberDao().updateMember(conn,m);

		Member updateMem = null;

		if(result>0) { //update 성공

			commit(conn);

			//갱신된 회원 다시조회해오기
			updateMem = new MemberDao().loginMember(conn,m.getUserId(),m.getUserPwd());

		}else { //update 실패
			rollback(conn);
		}

		close(conn);

		return updateMem;
	}
	
	//------------마이페이지주문내역관련----------------

	public ArrayList<MyOrder> selectMyOrderList(int userNo, PageInfo pi, String sortOption) {
		
		Connection conn = getConnection();
		
		ArrayList<MyOrder> list = new MemberDao().selectMyOrderList(conn,userNo,pi, sortOption);
		
		close(conn);
		
		return list;
	}
	
	public int selectMyOrderCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectMyOrderCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	
	public int cancelOrder(int orderNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().cancelOrder(conn, orderNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
