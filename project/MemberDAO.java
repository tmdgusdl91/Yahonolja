package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class MemberDAO {
	Connection conn;
	public MemberDAO() {
		this.conn = DBCPConn.getConnection();
	}
	
	public int userJoin(MemberDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO PMEMBER (TYPE,USERID,USERPW,USERNAME,USERBIRTH,USERGENDER,USEREMAIL,USERPHONE) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getType());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserPw());
			pstmt.setString(4, dto.getUserName());
			pstmt.setString(5, dto.getUserBirth());
			pstmt.setString(6, dto.getUserGender());
			pstmt.setString(7, dto.getUserEmail());
			pstmt.setString(8, dto.getUserPhone());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public boolean idcheck(String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT USERID FROM PMEMBER WHERE USERID =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return true;
	}
	
	public MemberDTO getUserData(String userId) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT TYPE,USERID, USERNAME, TO_CHAR(USERBIRTH,'YYYY-MM-DD') USERBIRTH, USERGENDER, USEREMAIL, USERPHONE FROM PMEMBER WHERE USERID =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setType(rs.getInt("TYPE"));
				dto.setUserId(rs.getString("USERID"));
				dto.setUserName(rs.getString("USERNAME"));
				dto.setUserBirth(rs.getString("USERBIRTH"));
				dto.setUserGender(rs.getString("USERGENDER"));
				dto.setUserEmail(rs.getString("USEREMAIL"));
				dto.setUserPhone(rs.getString("USERPHONE"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	public int userUpdate(MemberDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE PMEMBER SET USERPW=?,USEREMAIL=?,USERPHONE=? WHERE USERID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPw());
			pstmt.setString(2, dto.getUserEmail());
			pstmt.setString(3, dto.getUserPhone());
			pstmt.setString(4, dto.getUserId());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	public MemberDTO login(String userId, String userPw) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT TYPE,USERID,USERPW,USERNAME,TO_CHAR(USERBIRTH,'YYYY-MM-DD') USERBIRTH ,USERGENDER,USEREMAIL,USERPHONE FROM PMEMBER WHERE USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(userPw.equals(rs.getString("USERPW"))) {
					dto = new MemberDTO();
					dto.setType(rs.getInt("TYPE"));
					dto.setUserId(userId);
					dto.setUserPw(userPw);
					dto.setUserName(rs.getString("USERNAME"));
					dto.setUserBirth(rs.getString("USERBIRTH"));
					dto.setUserGender(rs.getString("USERGENDER"));
					dto.setUserEmail(rs.getString("USEREMAIL"));
					dto.setUserPhone(rs.getString("USERPHONE"));
				}
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	public void deleteUser(String parameter) {
		PreparedStatement pstmt = null;
		try {
			String sql ="DELETE PMEMBER WHERE USERID =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, parameter);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void searchKeyword(String searchValue) {
		PreparedStatement pstmt = null;
		try {
			String sql ="UPDATE SEARCHCOUNT SET HITCOUNT = HITCOUNT+1 WHERE TAGINFO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			int result = pstmt.executeUpdate();
			if(result == 0) {
				sql = "INSERT INTO SEARCHCOUNT VALUES (?,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				pstmt.executeUpdate();
			}
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

}
