package com.kh.scenter.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.scenter.model.dao.InqDao;
import com.kh.scenter.model.vo.Inquiry;

public class InqService {
	
	public ArrayList<Inquiry> selectInqList(){
		
		Connection conn = getConnection();
		
		ArrayList<Inquiry> list = new InqDao().selectInqList(conn);
		
		close(conn);
		
		return list;
	}
	
	public Inquiry selectInq(int ino) {
		
		Connection conn = getConnection();
		
		Inquiry i = new InqDao().selectInq(conn, ino);
		
		close(conn);
		
		return i;
		
		
	}
	
	public int insertInq(Inquiry i) {
		
		Connection conn = getConnection();
		
		int result = new InqDao().insertInq(conn, i);
		
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
				
		return result;
		
		
	}
	
	public int insertRe(int ino, String reContent) {
		
		Connection conn = getConnection();
		
		int result = new InqDao().insertRe(conn, ino, reContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int updateInq(Inquiry i) {
		
		Connection conn = getConnection();
		
		int result = new InqDao().updateInq(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int deleteInq(int ino) {
		Connection conn = getConnection();
		
		int result = new InqDao().deleteInq(conn, ino);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int updateRe(int ino, String reContent) {
		Connection conn = getConnection();
		
		int result = new InqDao().updateRe(conn, ino, reContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int deleteRe(int ino) {
		Connection conn = getConnection();
		
		int result = new InqDao().deleteRe(conn, ino);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
