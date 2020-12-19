package com.kh.scenter.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.scenter.model.dao.ScenterDao;
import com.kh.scenter.model.vo.Notice;

public class ScenterService {

	public ArrayList<Notice> selectNoticeList(){
		
		Connection conn = getConnection();
			
		ArrayList<Notice> list = new ScenterDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int increaseCount(int nno) {
		
		Connection conn = getConnection();
		
		int result = new ScenterDao().increaseCount(conn, nno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Notice selectNotice(int nno) {
		Connection conn = getConnection();
		
		Notice n = new ScenterDao().selectNotice(conn, nno);
		
		close(conn);
		
		return n;
		
	}
	
	public int insertNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new ScenterDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new ScenterDao().updateNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else{
			rollback(conn);
			
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	public int deleteNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new ScenterDao().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
}
