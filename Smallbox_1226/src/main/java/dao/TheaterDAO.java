package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.MovieBean;
import vo.TheaterBean;
import db.JdbcUtil;

public class TheaterDAO {
	//==============mvc==========================================
	private static TheaterDAO instance = new TheaterDAO();
	
//	private MovieDAO() {}

	public static TheaterDAO getInstance() {
		return instance;
	}
	
	private Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//========================================================
	
	public int insertTheater(TheaterBean theater) {
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			// 1. 극장 번호 구하기
			int theater_idx = 1;
			
			String sql = "SELECT MAX(theater_idx) FROM theater";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				theater_idx = rs.getInt(1) + 1;
			}
			
			// 2. 극장 등록
			sql = "INSERT INTO theater VALUES(?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, theater_idx);
			pstmt2.setString(2, theater.getTheater_title());
			pstmt2.setDate(3, theater.getTheater_date());
			pstmt2.setTime(4, theater.getTheater_time());
			pstmt2.setInt(5, theater.getTheater_seat_cnt());
			
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertTheater()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	public List<TheaterBean> selectTheaterList(String movie_title, String reserve_date) {
		System.out.println("TheaterDAO - selectTheaterList");
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		List<TheaterBean> theaterList = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT theater_time FROM theater WHERE theater_title=? AND theater_date=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie_title);
			pstmt.setString(2, reserve_date);
			rs = pstmt.executeQuery();
			
			theaterList = new ArrayList<TheaterBean>();
			
			System.out.println(pstmt);
			
			while(rs.next()) {
				TheaterBean theaterTime = new TheaterBean();
				theaterTime.setTheater_time(rs.getTime("theater_time"));
				
				theaterList.add(theaterTime);
				System.out.println("theaterList");
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectTheaterList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return theaterList;
	}
}
