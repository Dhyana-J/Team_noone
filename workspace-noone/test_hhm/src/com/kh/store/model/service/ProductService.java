package com.kh.store.model.service;


import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.store.model.dao.ProductDao;
import com.kh.store.model.vo.Basket;
import com.kh.store.model.vo.ImageUrl;
import com.kh.store.model.vo.PageInfo;
import com.kh.store.model.vo.Pinquiry;
import com.kh.store.model.vo.Product;
import com.kh.store.model.vo.Review;



public class ProductService {
	public int StoreInsert(Product p, ArrayList<ImageUrl> list) {
		Connection conn = getConnection();
		
		int result = new ProductDao().StoreInsert(conn, p);
		int result_2 = 0;
		
		if(list.isEmpty()) {
			result_2 = 1;
		}else {
			for(ImageUrl i : list) {
				result_2 = new ProductDao().UrlInsert(conn, i); 
				if(result_2 <= 0) {
					break;
				}
			}
			
		}
		
		if((result * result_2) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result * result_2;
		
		
	}
	
	public ArrayList<Product> selectProductList(PageInfo p){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList(conn, p);
		
		close(conn);
		
		return list;
		
	}
	
	public Product selectDetailProduct(int pno) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectDetailProduct(conn, pno);
		close(conn);
		return p;
	}
	
	public ArrayList<String> selectDetailUrl(int pno) {
		Connection conn = getConnection();
		ArrayList<String> list = new ProductDao().selectDetailUrl(conn, pno);
		close(conn);
		return list;
	}
	public ArrayList<Product> selectProductList2(PageInfo p){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList2(conn, p);
		
		close(conn);
		
		return list;
		
	}
	public int selectPtotal() {
		Connection conn = getConnection();
		
		int Ptotal = new ProductDao().selectPtotal(conn);
		close(conn);
		return Ptotal;
			
	}
	public int selectPtotal2() {
		Connection conn = getConnection();
		
		int Ptotal = new ProductDao().selectPtotal2(conn);
		close(conn);
		return Ptotal;
			
	}

	/**
	 * 리뷰작성 메소드
	 * 
	 * @param r 리뷰작성내용
	 * 
	 * @return
	 */
	public int reviewInsert(Review r) {
		Connection conn = getConnection();
		int result=new ProductDao().reviewInsert(conn,r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Review> selectReviewList(int pno, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Review> reviewList = new ProductDao().selectReviewList(conn,pno,pi);
		
		close(conn);
		
		return reviewList;
	}
	
	public Review selectReview(int rno) {
		
		Connection conn = getConnection();
		
		Review review = new ProductDao().selectReview(conn, rno);
		
		close(conn);
		return review;
	}
	
	public int selectReviewTotal(int pno) {
		Connection conn = getConnection();
		
		int Rtotal = new ProductDao().selectReviewTotal(conn, pno);
		close(conn);
		return Rtotal;
			
	}
	
	public int updateReview(Review r) {
		Connection conn = getConnection();
		
		int result = new ProductDao().updateReview(conn,r);
		close(conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteReview(int rno) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteReview(conn, rno);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int selectStockTotal(int psort) {
		Connection conn = getConnection();
		
		int stocktotal = new ProductDao().selectStockTotal(conn, psort);
		close(conn);
		return stocktotal;
			
	}
	
	public ArrayList<Product> selectStockList(PageInfo pi, int psort){
		Connection conn = getConnection();
		ArrayList<Product> stockList = new ProductDao().selectStockList(conn,pi,psort);
		
		close(conn);
		
		return stockList;
	}

	public int PinquiryInsert(Pinquiry Pi) {
		Connection conn = getConnection();
		
		int result = new ProductDao().PinquiryInsert(conn,Pi);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	

	
	public ArrayList<Pinquiry> selectPiList(int pno, PageInfo qpi) {
		Connection conn = getConnection();
		
		ArrayList<Pinquiry> PiList = new ProductDao().selectPiList(conn,pno,qpi);
		close(conn);
		return PiList;
		
	}
	
	public int increaseCount(int piNo) {
		Connection conn = getConnection();
		int result = new ProductDao().increaseCount(conn, piNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public Pinquiry selectpInquiry(int piNo) {
		Connection conn = getConnection();
		
		Pinquiry pi = new ProductDao().selectpInquiry(conn, piNo);
		
		close(conn);
		
		return pi;
		
		
		
	}
	
	public int selectPiTotal(int pno) {
		Connection conn = getConnection();
		
		int piTotal = new ProductDao().selectPiTotal(conn, pno);
		close(conn);
		return piTotal;
			
	}
	
	public int updatePi(Pinquiry pi) {
		Connection conn = getConnection();
		
		int result = new ProductDao().updatePi(conn, pi);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deletePi(int piNo) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().deletePi(conn, piNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int selectStockSearchTotal(int psort, String pKey) {
		Connection conn = getConnection();
		int Stotal = 0;
		if(psort == 1) {
			Stotal = new ProductDao().selectStockSearchTotal(conn, pKey);
		}else {
			Stotal = new ProductDao().selectStockSearchTotal2(conn, psort, pKey);
		}
		
		close(conn);
		return Stotal;
			
	}
	
	public ArrayList<Product> selectStockSearch(int psort, String pKey, PageInfo pi){
		Connection conn = getConnection();
		if(psort == 1) {
			ArrayList<Product> stockList = new ProductDao().selectStockSearch(conn, pKey, pi);
			close(conn);
			
			return stockList;
		}else {
			ArrayList<Product> stockList = new ProductDao().selectStockSearch2(conn, psort, pKey, pi);
			close(conn);
			
			return stockList;
		}
	}
	public ArrayList<Product> selectRecommand(){
		Connection conn = getConnection();
		ArrayList<Product> rlist = new ProductDao().selectRecommand(conn);
		close(conn);
		
		return rlist;
	}
	
	
	public int insertShopping(Basket basket) {
		Connection conn = getConnection();
		int result = new ProductDao().insertShopping(conn,basket);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Basket> selectBasketList(int userNo){
		Connection conn = getConnection();
		ArrayList<Basket> blist = new ProductDao().selectBasketList(conn, userNo);
		
		close(conn);
		return blist;
	}
}
