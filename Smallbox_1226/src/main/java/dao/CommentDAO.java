package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.CommentBean;

public class CommentDAO {

	//==============mvc==========================================
	private static CommentDAO instance = new CommentDAO();
	
	private CommentDAO() {}

	public static CommentDAO getInstance() {
		return instance;
	}
	
	private Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	//================================================================
	PreparedStatement pstmt = null, pstmt2 = null;
	ResultSet rs = null;

	public int insertComment(CommentBean cmt) {
		int insertCount = 0;
		int comment_idx = 1;
		
		try {
			//=====comment_idx 구하기====================================
			String sql = "SELECT MAX(comment_idx) FROM comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comment_idx = rs.getInt(1) + 1;
			}
			//=====comment insert======================================
			sql = "INSERT INTO comment VALUES(?,?,?,?,?,now())";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, comment_idx);
			pstmt2.setInt(2, cmt.getMovie_idx());
			pstmt2.setString(3, cmt.getMember_id());
			pstmt2.setInt(4, cmt.getComment_star());
			pstmt2.setString(5, cmt.getComment_content());
			
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - commentDAO>insertComment()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
		} // ~~~~finally end~~~~
		
		return insertCount;
	} // ~~~~method public int insertComment end~~~~

	public List<CommentBean> selectCommentList(int movie_idx) {
		List<CommentBean> commentList = null;
		
		try {
			String sql = "SELECT * FROM comment WHERE movie_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_idx);
			rs = pstmt.executeQuery();
			
			commentList = new ArrayList<CommentBean>();
			
			while(rs.next()) {
				CommentBean comment = new CommentBean();
				
				comment.setComment_idx(rs.getInt("comment_idx"));
				comment.setMovie_idx(rs.getInt("movie_idx"));
				comment.setMember_id(rs.getString("member_id"));
				comment.setComment_star(rs.getInt("comment_star"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setComment_date(rs.getDate("comment_date"));
				
				commentList.add(comment);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - commentDAO>selectCommentList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} // ~~~~finally end~~~~
		
		return commentList;
	} //~~~~method public List<CommentBean> selectCommentList end~~~~

	public double selectAvg(int movie_idx) {
		double starAvg = 0;
		
		try {
			String sql = "SELECT AVG(c.comment_star) FROM comment c JOIN movie m ON c.movie_idx = m.movie_idx WHERE c.movie_idx=? GROUP BY c.movie_idx";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				starAvg = rs.getDouble(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - commentDAO>selectAvg()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} // ~~~~finally end~~~~
		
		return starAvg;
	} // ~~~~method public double selectAvg end~~~~

	public int deleteComment(int comment_idx) {
		int deleteCount = 0;
		
		try {
			String sql = "DELETE FROM comment WHERE comment_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_idx);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - commentDAO>deleteComment()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return deleteCount;
	} // ~~~~method public int deleteComment end~~~~

	public CommentBean getMovieIdx(int comment_idx) {
		CommentBean comment = null;
		
		try {
			String sql = "SELECT movie_idx FROM comment WHERE comment_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comment = new CommentBean();
				comment.setMovie_idx(rs.getInt("movie_idx"));
				System.out.println("getmovie idx dao 의 comment"+comment);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - commentDAO>getMovieIdx()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return comment;
	}

	
	
	
	
	
} // ~~~~public class CommentDAO end~~~~
