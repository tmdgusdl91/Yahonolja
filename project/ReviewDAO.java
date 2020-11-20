package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ReviewDAO {
	
	private Connection conn;
	
	public ReviewDAO(Connection conn) {
		
		this.conn = conn;
	}
	
	//1.num컬럼의 마지막 값
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num), 0) from hscore";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())

				maxNum = rs.getInt(1);

			rs.close();
			pstmt.close();

		} catch (Exception e) {

			System.out.println(e.toString());

		}

		return maxNum;

	}

	//2.입력
	public int insertData(ReviewDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "INSERT INTO HSCORE (USERID,SCORE,USERMEMO,HNUM) VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setInt(2, dto.getScore());
			pstmt.setString(3, dto.getUsermemo());
			pstmt.setString(4, dto.getHnum());			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//3.데이터 가져오기
	public List<ReviewDTO> getListData(int start, int end) {

		List<ReviewDTO> lists = new ArrayList<ReviewDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select userid, score, usermemo, hnum from hscore ";
			sql += "order by userid desc) data) ";
			sql += "where rnum >= ? and rnum <= ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setUserid(rs.getString("userid"));
				dto.setScore(rs.getInt("score"));
				dto.setUsermemo(rs.getString("usermemo"));
				dto.setHnum(rs.getString("hnum"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {

			System.out.println(e.toString());

		}

		return lists;
	}

	//4.전체 레코드의 갯수
	public int getDataCount() {

		int totalData = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*), 0) from hscore ";
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				totalData = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {

			System.out.println(e.toString());

		}

		return totalData;

	}

	//5.삭제
	public int deleteData(String userid) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete from hscore where userid = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {

			System.out.println(e.toString());

		}

		return result;

	}	
	
}
