package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;
import com.kh.member.model.vo.MyOrder;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		try {
			//prop.load(new FileInputStream(fileName));
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		// select문 => 한 행 => Member 
		
		// 필요한 변수들 먼저 셋팅
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 sql문
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 애초에 sql문 담은채로 생성
			// 현재 담긴 sql문이 미완성된 sql문이기 때문에 바로 실행 불가!
			
			// 완성형태로 만든 후에 실행해야됨!!
			pstmt.setString(1, userId); // 'admin'
			pstmt.setString(2, userPwd);// '1234'
			
			// 실행! (select문 => executeQuery(반환형ResultSet) / dml문 => executeUpdate(반환형int))
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 일치하는 회원을 찾았을 경우
				m = new Member(
						rset.getInt("user_no"),
						rset.getString("user_id"),
						rset.getString("user_pwd"),
						rset.getString("user_name"),
						rset.getString("email"),
						rset.getString("phone"),
						rset.getString("address"),
						rset.getString("address_detail"),
						rset.getInt("address_code"),
						rset.getString("quit"),
						rset.getString("manager"),
						rset.getInt("report_amount")
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			/*JDBCTemplate.*/close(rset);
			/*JDBCTemplate.*/close(pstmt);
		}
		return m; // 일치하는회원을 찾았을 경우 생성된 Member 객체 반환 / 일치하는회원을 찾지 못했을 경우 null 반환
		
	}
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getAddressDetail());
			pstmt.setInt(7, m.getAddressCode());
			pstmt.setString(8, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//-------------마이페이지주문내역관련--------------
	public ArrayList<MyOrder> selectMyOrderList(Connection conn, int userNo, PageInfo pi, String sortOption) {
		
		ArrayList<MyOrder> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMyOrderListDESC"); //날짜 최신순 정렬
		
		if(sortOption.equals("oldest")) {//sortOption이 "과거순"인 경우
			sql = prop.getProperty("selectMyOrderListASC"); //날짜 과거순 정렬
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyOrder(
						rset.getInt("p_no"),
						rset.getInt("order_no"),
						rset.getInt("cart_amount"),
						rset.getString("p_thumb_url"),
						rset.getString("p_name"),
						rset.getInt("pay_cost"),
						rset.getDate("order_date"),
						rset.getString("d_status").trim(), //공백이랑 같이들어와서 공백쳐냄
						rset.getString("shopping_status").trim(),
						rset.getString("d_company"),
						rset.getInt("d_number")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectMyOrderCount(Connection conn, int userNo) {
		// select문 => int(총 갯수)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyOrderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int cancelOrder(Connection conn, int orderNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("cancelOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
