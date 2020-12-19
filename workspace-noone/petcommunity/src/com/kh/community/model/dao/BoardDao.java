package com.kh.community.model.dao;

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

import com.kh.community.model.vo.Board;
import com.kh.community.model.vo.BoardComment;
import com.kh.community.model.vo.BoardScrap;
import com.kh.community.model.vo.PageInfo;
public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	// 자유게시판 리스트 갯수조회 
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");  
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
		
		
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		// select문  => 여러행 => ArrayList
				ArrayList<Board> list = new ArrayList<>();
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectList");
				
				try {
					pstmt = conn.prepareStatement(sql);
					

					int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
					int endRow = startRow + pi.getBoardLimit() -1;
					
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Board(rset.getInt("board_no"),
										   rset.getString("user_id"),
										   rset.getString("board_title"),
										   rset.getDate("board_date"),
										   rset.getInt("board_count")
										   ));
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				
				return list;
		
		
	}

	public int insertBoard(Connection conn, Board b) {
		// insert문 
		int result = 0;
		
		PreparedStatement pstmt = null;	
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getUserNo()));
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	// 조회수 증가 (자유)
	public int increaseCount(Connection conn, int bno) {
	
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result; 
		
	}

	public Board selectBoard(Connection conn, int bno) {
		// select문 -> 한 행 => Board
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("user_id"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getDate("board_date")
						
						);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
		
	}

	public int deleteBoard(Connection conn, int bno) {
		//delete행 
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}

	public int updateBoard(Connection conn, Board b) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertThBoard(Connection conn, Board b) {
		// insert문 => 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql =  prop.getProperty("insertThBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getUserNo());
			pstmt.setString(2,b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardPhoto());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectThumbnailList(Connection conn, PageInfo pi) {
		// select => 여러행 조회 
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setUserNo(rset.getString("user_id"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardPhoto(rset.getString("board_photo"));
				b.setBoardDate(rset.getDate("board_date"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public Board selectThBoard(Connection conn, int bno) {
		//select문
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("user_id"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getString("board_photo"),
							  rset.getDate("board_date"),
							  rset.getInt("board_recom")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
		
		
	}

	// 댕냥한컷 수정하기 
	public int updateThBoard(Connection conn, Board b) {
		// update문 
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateThBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardPhoto());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}

	// 댕냥한컷 리스트 조회 
	public int selectThListCount(Connection conn) {
	
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");  
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
		
		
	}

	// 댓글 리스트 조회 select
	public ArrayList<BoardComment> selectCommentList(Connection conn, int bno) {
		
		ArrayList<BoardComment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardComment(rset.getInt("comment_no"),
										  rset.getString("user_id"),
										  rset.getString("comment_content"),
										  rset.getDate("comment_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}

	public int insertComment(Connection conn, BoardComment c) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getBoardNo());
			pstmt.setInt(2, Integer.parseInt(c.getUserNo()));
			pstmt.setString(3, c.getCommentContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int recomUpdate(Connection conn, int bno) {
		// update문 
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("recomUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

	public int insertScrap(Connection conn, BoardScrap s) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getBoardNo());
			pstmt.setInt(2, s.getUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}

	// 스크랩 취소 
	public int deleteScrap(Connection conn, BoardScrap s) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getBoardNo());
			pstmt.setInt(2, s.getUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}

	public int recomInsert(Connection conn, int bno, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("recomInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
		
	}

	public int deleteComment(Connection conn, BoardComment c) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getBoardNo());
			pstmt.setInt(2, Integer.parseInt(c.getUserNo()));
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
		
	}
		
	
	
}
