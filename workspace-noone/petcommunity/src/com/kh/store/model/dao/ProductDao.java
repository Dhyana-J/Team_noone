package com.kh.store.model.dao;

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

import com.kh.store.model.vo.Basket;
import com.kh.store.model.vo.ImageUrl;
import com.kh.store.model.vo.PageInfo;
import com.kh.store.model.vo.Pinquiry;
import com.kh.store.model.vo.Product;
import com.kh.store.model.vo.Review;

public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {

		String fileName = ProductDao.class.getResource("/sql/store/store-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int StoreInsert(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("StoreInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getDescription());
			pstmt.setInt(4, p.getpStock());
			pstmt.setString(5, p.getpCategory());
			pstmt.setString(6, p.getpBrand());
			pstmt.setString(7, p.getpModel());
			pstmt.setString(8, p.getpThumbUrl());
			pstmt.setInt(9, p.getpStock());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int StoreUpdate(Connection conn, Product p, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("StoreUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getDescription());
			pstmt.setInt(4, p.getpStock());
			pstmt.setString(5, p.getpCategory());
			pstmt.setString(6, p.getpBrand());
			pstmt.setString(7, p.getpModel());
			pstmt.setInt(8, pno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int StoreDelete(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("StoreDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		return result;
	}
	
	public int UrlInsert(Connection conn, ImageUrl i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("UrlInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi) {
		// select문 => 여러행 조회
		ArrayList<Product> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProductList");

		try {

			int startRow = (pi.getCurrentPage() - 1) * 12 + 1;
			int endRow = startRow + 11;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("price"));
				p.setpSales(rset.getInt("p_sales"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				list.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public Product selectDetailProduct(Connection conn, int pno) {
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDetailProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("price"));
				p.setpCategory(rset.getString("p_category"));
				p.setpStock(rset.getInt("p_stock"));
				p.setpBrand(rset.getString("p_brand"));
				p.setpModel(rset.getString("p_model"));
				p.setDescription(rset.getString("description"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return p;
	}

	public ArrayList<String> selectDetailUrl(Connection conn, int pno) {
		// select문 => 여러행 조회
		ArrayList<String> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDetailUrl");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				String url = rset.getString("p_img_url");
				list.add(url);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public ArrayList<Product> selectProductList2(Connection conn, PageInfo pi) {
		// select문 => 여러행 조회
		ArrayList<Product> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProductList2");

		try {

			int startRow = (pi.getCurrentPage() - 1) * 12 + 1;
			int endRow = startRow + 11;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("price"));
				p.setpSales(rset.getInt("p_sales"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				list.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public int selectPtotal(Connection conn) {
		int Ptotal = 0;
		Statement stmt = null;
		String sql = prop.getProperty("selectPtotal");
		ResultSet rset = null;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				Ptotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return Ptotal;

	}

	public int selectPtotal2(Connection conn) {
		int Ptotal = 0;
		Statement stmt = null;
		String sql = prop.getProperty("selectPtotal2");
		ResultSet rset = null;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				Ptotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return Ptotal;

	}

	public int reviewInsert(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewInsert");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewContent());
			pstmt.setInt(3, r.getReviewRating());
			pstmt.setInt(4, r.getpNo());
			pstmt.setInt(5, r.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public Review selectReview(Connection conn, int rno) {
		Review review = null;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReview");
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				review = new Review(rset.getInt("review_no"), rset.getString("review_title"),
						rset.getString("review_content"), rset.getDate("review_date"), rset.getInt("reivew_rating"),
						rset.getInt("p_no"), rset.getInt("user_no"), rset.getString("user_name"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return review;

	}

	public ArrayList<Review> selectReviewList(Connection conn, int pno, PageInfo pi) {
		ArrayList<Review> reviewList = new ArrayList<>();

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewList");
		ResultSet rset = null;
		int startRow = (pi.getCurrentPage() - 1) * 5 + 1;
		int endRow = startRow + 4;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				reviewList.add(new Review(rset.getInt("review_no"), rset.getString("review_title"),
						rset.getString("review_content"), rset.getDate("review_date"), rset.getInt("reivew_rating"),
						rset.getInt("p_no"), rset.getInt("user_no"), rset.getString("user_name")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return reviewList;
	}

	public int selectReviewTotal(Connection conn, int pno) {
		int Rtotal = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewTotal");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				Rtotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return Rtotal;
	}

	public int updateReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReviewTitle());
			pstmt.setInt(2, r.getReviewRating());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setInt(4, r.getReviewNO());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;

	}

	public int deleteReview(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReivew");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int selectStockTotal(Connection conn, int psort) {
		int stocktotal = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		if (psort == 1) {
			sql = prop.getProperty("selectPtotal3");
		} else if (psort == 2) {
			sql = prop.getProperty("selectPtotal");
		} else if (psort == 3) {
			sql = prop.getProperty("selectPtotal2");
		} else {
			sql = prop.getProperty("selectPtotal3");
		}

		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				stocktotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return stocktotal;
	}

	public ArrayList<Product> selectStockList(Connection conn, PageInfo pi, int psort) {
		// select문 => 여러행 조회
		ArrayList<Product> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		if (psort == 1) {
			sql = prop.getProperty("selectProductList3");
		} else if (psort == 2) {
			sql = prop.getProperty("selectProductList4");
		} else if (psort == 3) {
			sql = prop.getProperty("selectProductList5");
		} else {
			sql = prop.getProperty("selectProductList3");
		}

		try {

			int startRow = (pi.getCurrentPage() - 1) * 12 + 1;
			int endRow = startRow + 11;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("p_stock"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				list.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public int PinquiryInsert(Connection conn, Pinquiry Pi) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("PinquiryInsert");

		if (Pi.getSecret() == null) {
			Pi.setSecret("N");
		}

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, Pi.getSecret());
			pstmt.setString(2, Pi.getPiTitle());
			pstmt.setString(3, Pi.getPiContent());
			pstmt.setInt(4, Pi.getpNo());
			pstmt.setInt(5, Pi.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectPiTotal(Connection conn, int pno) {
		int piTotal = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPiTotal");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				piTotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return piTotal;
	}

	public ArrayList<Pinquiry> selectPiList(Connection conn, int pno, PageInfo qpi) {

		ArrayList<Pinquiry> PiList = new ArrayList<>();

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPiList");
		ResultSet rset = null;
		int startRow = (qpi.getCurrentPage() - 1) * 5 + 1;
		int endRow = startRow + 4;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				PiList.add(new Pinquiry(rset.getInt("pi_no"), rset.getString("secret"), rset.getString("user_name"),
						rset.getString("pi_title"), rset.getString("pi_content"), rset.getDate("pi_enroll"),
						rset.getInt("p_no"), rset.getInt("user_no"), rset.getInt("count"),
						rset.getString("reply_status")));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return PiList;

	}

	public int selectStockSearchTotal(Connection conn, String pKey) {
		int Stotal = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectStockSearchTotal");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pKey);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				Stotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return Stotal;

	}

	public int selectStockSearchTotal2(Connection conn, int psort, String pKey) {
		int Stotal = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectStockSearchTotal2");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pKey);
			if (psort == 2) {
				pstmt.setString(2, "D");
			} else {
				pstmt.setString(3, "C");
			}
			rset = pstmt.executeQuery();
			if (rset.next()) {
				Stotal = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return Stotal;

	}

	public ArrayList<Product> selectStockSearch(Connection conn, String pKey, PageInfo pi) {
		// select문 => 여러행 조회
		ArrayList<Product> list = new ArrayList<>();
		String sql = prop.getProperty("selectStockSearch");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			int startRow = (pi.getCurrentPage() - 1) * 12 + 1;
			int endRow = startRow + 11;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pKey);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("p_stock"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> selectStockSearch2(Connection conn, int psort, String pKey, PageInfo pi) {
		// select문 => 여러행 조회
		ArrayList<Product> list = new ArrayList<>();
		String sql = prop.getProperty("selectStockSearch2");
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			int startRow = (pi.getCurrentPage() - 1) * 12 + 1;
			int endRow = startRow + 11;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pKey);
			if (psort == 2) {
				pstmt.setString(2, "D");
			} else {
				pstmt.setString(2, "C");
			}
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setPrice(rset.getInt("p_stock"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				list.add(p);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return list;
			 
			  
			  
		  }
		  
		 
		  



	public Pinquiry selectpInquiry(Connection conn, int piNo) {
		Pinquiry pi = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectpi");
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, piNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				pi = new Pinquiry(rset.getInt("pi_no"), rset.getString("secret"), rset.getString("user_name"),
						rset.getString("pi_title"), rset.getString("pi_content"), rset.getDate("pi_enroll"),
						rset.getInt("p_no"), rset.getInt("user_no"), rset.getInt("count"),
						rset.getString("reply_status"), rset.getString("pi_reply"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);
		}

		return pi;
	}

	public int increaseCount(Connection conn, int piNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, piNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}
		return result;

	}

	public ArrayList<Product> selectRecommand(Connection conn) {
		ArrayList<Product> rlist = new ArrayList<>();
		String sql = prop.getProperty("selectRecommand");
		Statement stmt = null;
		ResultSet rset = null;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				Product p = new Product();
				p.setpNo(rset.getInt("p_no"));
				p.setpName(rset.getString("p_name"));
				p.setpThumbUrl(rset.getString("p_thumb_url"));
				rlist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rlist;
	}
	
	 public int updatePi(Connection conn, Pinquiry pi) {
		   int result = 0;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("updatePi");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pi.getSecret());
			pstmt.setString(2, pi.getPiTitle());
			pstmt.setString(3, pi.getPiContent());
			pstmt.setInt(4, pi.getPiNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		   
		 return result;
		   
		   
		   
		   
	   }
	  
	  
	  public int deletePi(Connection conn, int piNo) {
		   int result = 0;
		   PreparedStatement pstmt = null;
		   String sql = prop.getProperty("deletePi");
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, piNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		   
		 return result;
		   
		   
		   
		   
	   }
	  
	  /** shopping테이블 insert구문 (장바구니, 구매하기 클릭시)
	 * @param conn 
	 * @param basket 사용자가 구입하려는 물건정보,사용자정보
	 * @return
	 */
	
	
	public int Buy(Connection conn, int number, int stock, int pno) {
		int update = stock - number;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("Buy");
		System.out.println("test1 : " + update);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, update);
			pstmt.setInt(2, pno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Product BselectP(Connection conn, int pno){
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("BselectP");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p.setpStock(rset.getInt("P_STOCK"));
				p.setpSales(rset.getInt("P_SALES"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int directSale(Connection conn, int tsales, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("directSale");
		System.out.println("test2 : " + tsales);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tsales);
			pstmt.setInt(2, pno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertShopping(Connection conn, Basket basket) {
		int result = 0;
		  PreparedStatement pstmt = null;
		  String sql= prop.getProperty("insertShopping");
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,basket.getPno());
			pstmt.setInt(2,basket.getUserNo());
			pstmt.setInt(3,basket.getCartAmount());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
		    
	  }
	public int insertOder(Connection conn, int userNo) {
		int result = 0;
		  PreparedStatement pstmt = null;
		  String sql= prop.getProperty("insertOrder");
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		    
	  }
	public ArrayList<Basket> selectBasketList(Connection conn, int userNo){
		ArrayList<Basket> blist = new ArrayList<Basket>();
		  PreparedStatement pstmt = null;
		  String sql= prop.getProperty("selectBasketList");
		  ResultSet rset = null;
		  try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				blist.add(new Basket(
								rset.getInt("p_no")
							  , rset.getInt("user_no")
							  , rset.getInt("order_no")
							  , rset.getInt("cart_amount")
							  , rset.getString("shopping_status")
							  , rset.getString("p_thumb_url")
							  , rset.getString("p_name")
							  , rset.getInt("price")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		  
		  
		  return blist;
		  
	}

}
