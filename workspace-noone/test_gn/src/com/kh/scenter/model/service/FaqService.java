package com.kh.scenter.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.scenter.model.dao.FaqDao;
import com.kh.scenter.model.vo.Faq;

public class FaqService {
	
	
	public ArrayList<Faq> selectFaqList(){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertFaq(String faqContent, String faqAnswer) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().insertFaq(conn, faqContent, faqAnswer);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Faq selectFaq(int fno) {
		
		Connection conn = getConnection();
		
		Faq f = new FaqDao().selectFaq(conn, fno);
		
		close(conn);
		
		return f;
		
	}
	
	public int updateFaq(Faq f) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().updateFaq(conn, f);
		
		close(conn);
		
		return result;
		
	}
	
	public int deleteFaq(int fno) {
		Connection conn = getConnection();
		
		int result = new FaqDao().deleteFaq(conn, fno);
		
		close(conn);
		
		return result;
		
	}
	
}
