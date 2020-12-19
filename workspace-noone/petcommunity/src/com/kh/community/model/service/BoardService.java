package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.community.model.dao.BoardDao;
import com.kh.community.model.vo.Board;
import com.kh.community.model.vo.BoardComment;
import com.kh.community.model.vo.BoardScrap;
import com.kh.community.model.vo.PageInfo;

public class BoardService {

	
	

	// 게시글 추천수 올리기 
	public int recomUpdate(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().recomUpdate(conn, bno);
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	

	public int recomInsert(int bno, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().recomInsert(conn, bno, userNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}


	/**
	 *  자유게시판 리스트 조회수 
	 * @return
	 */
	public int selectListCount() {
			
		Connection conn = getConnection();
				
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	/**
	 * 자유게시판 리스트 밑에 페이지넘버들 
	 * @param pi
	 * @return
	 */
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
		
		
	}
	/**
	 * 자유이야기 글작성 insert
	 * @param b
	 * @return
	 */
	public int insertBoard(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	/**
	 * 자유게시판 조회수 증가 
	 * @param bno
	 * @return
	 */
	public int increaseCount(int bno) {
		
Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}

	/**
	 * 자유이야기 게시물상세조회 => select문이다 
	 * @param bno
	 * @return
	 */
	public Board selectBoard(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		
		return b;
		
		
		
	}

	// 게시물 삭제 
	public int deleteBoard(int bno) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateBoard(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	}

	// 댕냥한컷 글쓰기 (첨부파일 오직 사진 1개)
	public int insertThumbnailBoard(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertThBoard(conn,b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**
	 * 댕냥한컷 리스트보이게하기 
	 * @return
	 */
	public ArrayList<Board> selectThumbnailList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn,pi);
		
		close(conn);
		
		return list;
	}

	/**
	 * 댕냥한컷 상세조회 select문 
	 * @param bno
	 * @return
	 */
	public Board selectThBoard(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectThBoard(conn, bno);
		
		close(conn);
		return b;
		
		
	}

	/**
	 * 댕냥한컷(사진게시판) 수정하기 update문 
	 * @param b
	 * @return
	 */
	public int updateThBoard(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().updateThBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	/**
	 * 페이징처리를 위한 댕냥한컷 리스트 조호 ㅣ
	 * @return
	 */
	public int selectThListCount() {
	
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectThListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
	}

	/**
	 * 댓글 리스트 조회 
	 * @param bno
	 * @return
	 */
	public ArrayList<BoardComment> selectCommentList(int bno) {
	
		Connection conn = getConnection();
		
		ArrayList<BoardComment> list = new BoardDao().selectCommentList(conn,bno);
		close(conn);
		return list;
	}

	/**
	 * 댓글 작성 insert
	 * @param c
	 * @return
	 */
	public int insertComment(BoardComment c) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertComment(conn, c);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}



	// 스크랩  insert 
	public int insertScrap(BoardScrap s) {
	
		Connection conn = getConnection();
		
		int result = new BoardDao().insertScrap(conn, s);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 스크랩 취소 !! 
	public int deleteScrap(BoardScrap s) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteScrap(conn, s);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	// 댓글삭제
	public int deleteComment(BoardComment c) {
	
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteComment(conn, c);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}
	

	
	
	
}
