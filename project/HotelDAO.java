package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class HotelDAO {
	Connection conn = null;

	public HotelDAO() {
		this.conn = DBCPConn.getConnection();
	}

	public String getMaxNum() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) count from HDETAIL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count");
				result++;
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Integer.toString(result);
	}

	public int insertHotel(HotelDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO HDETAIL (HNUM,HID,HNAME,HLOC,HINTRO,HTEL,HDATE,ROOMPRICE,SCORE) VALUES (?,?,?,?,?,?,SYSDATE,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHnum());
			pstmt.setString(2, dto.getHid());
			pstmt.setString(3, dto.getHname());
			pstmt.setString(4, dto.getHloc());
			pstmt.setString(5, dto.getHintro());
			pstmt.setString(6, dto.getHtel());
			pstmt.setInt(7, dto.getRoomprice());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	public void insertRoom(HotelDTO dto) {
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO ROOMDETAIL (HNUM,ROOMTYPE,ROOMPRICE) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHnum());
			pstmt.setString(2, dto.getHroomName());
			pstmt.setInt(3, dto.getHroomprice());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public List<HotelDTO> getList(int[] num) {
		List<HotelDTO> list = new ArrayList<HotelDTO>();
		HotelDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			for (int i = 0; i < num.length; i++) {
				String sql = "SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM HDETAIL WHERE HNUM = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Integer.toString(num[i]));
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto = new HotelDTO();
					dto.setHnum(rs.getString("HNUM"));
					dto.setHid(rs.getString("HID"));
					dto.setHname(rs.getString("HNAME"));
					dto.setHloc(rs.getString("HLOC"));
					dto.setHintro(rs.getString("HINTRO"));
					dto.setHtel(rs.getString("HTEL"));
					dto.setHdate(rs.getString("HDATE"));
					dto.setRoomprice(rs.getInt("ROOMPRICE"));
					dto.setScore(rs.getInt("SCORE"));
					list.add(dto);
				}
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public List<HotelDTO> getList(String type,int index,int num) {
		List<HotelDTO> list = new ArrayList<HotelDTO>();
		HotelDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String loc = "";
		String sql = "";
		switch(index) {
		case 0:
			loc ="";
			break;
		case 1:
			loc =" WHERE A.HLOC LIKE '%군산%' OR A.HLOC LIKE '%고창%' OR A.HLOC LIKE '%정읍%' ";
			break;
		case 2:
			loc =" WHERE A.HLOC LIKE '%광주%' ";
			break;
		case 3:
			loc =" WHERE A.HLOC LIKE '%남원%' OR A.HLOC LIKE '%무주%' OR A.HLOC LIKE '%완주%' OR A.HLOC LIKE '%익산%' ";
			break;
		case 4:
			loc =" WHERE A.HLOC LIKE '%순천%' OR A.HLOC LIKE '%광양%' OR A.HLOC LIKE '%구례%' OR A.HLOC LIKE '%목포%' OR A.HLOC LIKE '%보성%' ";
			break;
		case 5:
			loc =" WHERE A.HLOC LIKE '%여수%' ";
			break;
		case 6:
			loc =" WHERE A.HLOC LIKE '%전주%' ";
			break;
		default :
			loc ="";
			break;
		}
		switch(type) {
		case "score":
			sql = "SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM (SELECT A.HNUM,A.HID,A.HNAME,A.HLOC,A.HINTRO,A.HTEL,A.HDATE,A.ROOMPRICE,A.SCORE, ROW_NUMBER() OVER(ORDER BY SCORE DESC ) AS RNUM FROM HDETAIL A "+loc+" ) WHERE RNUM < ?";
			break;
		case "price":
			sql = "SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM (SELECT A.HNUM,A.HID,A.HNAME,A.HLOC,A.HINTRO,A.HTEL,A.HDATE,A.ROOMPRICE,A.SCORE, ROW_NUMBER() OVER(ORDER BY ROOMPRICE ) AS RNUM FROM HDETAIL A "+loc+" ) WHERE RNUM < ?";
			break;
		case "hdate":
			sql = "SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM (SELECT A.HNUM,A.HID,A.HNAME,A.HLOC,A.HINTRO,A.HTEL,A.HDATE,A.ROOMPRICE,A.SCORE, ROW_NUMBER() OVER(ORDER BY HDATE DESC) AS RNUM FROM HDETAIL A "+loc+" ) WHERE RNUM < ?";
			break;
		default :
			sql = "SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM (SELECT A.HNUM,A.HID,A.HNAME,A.HLOC,A.HINTRO,A.HTEL,A.HDATE,A.ROOMPRICE,A.SCORE, ROW_NUMBER() OVER(ORDER BY SCORE DESC ) AS RNUM FROM HDETAIL A ) WHERE RNUM < ?";
		
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new HotelDTO();
				dto.setHnum(rs.getString("HNUM"));
				dto.setHid(rs.getString("HID"));
				dto.setHname(rs.getString("HNAME"));
				dto.setHloc(rs.getString("HLOC"));
				dto.setHintro(rs.getString("HINTRO"));
				dto.setHtel(rs.getString("HTEL"));
				dto.setHdate(rs.getString("HDATE"));
				dto.setRoomprice(rs.getInt("ROOMPRICE"));
				dto.setScore(rs.getInt("SCORE"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public List<HotelDTO> getList(String userId){
		List<HotelDTO> list = new ArrayList<HotelDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HotelDTO dto = null;
		try {
			String sql ="SELECT HNUM, HID, HNAME, HLOC, HINTRO, HTEL, TO_CHAR(HDATE, 'YYYY-MM-DD') HDATE, SCORE FROM HDETAIL WHERE HID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new HotelDTO();
				dto.setHnum(rs.getString("HNUM"));
				dto.setHid(rs.getString("HID"));
				dto.setHname(rs.getString("HNAME"));
				dto.setHloc(rs.getString("HLOC"));
				dto.setHintro(rs.getString("HINTRO"));
				dto.setHtel(rs.getString("HTEL"));
				dto.setHdate(rs.getString("HDATE"));
				dto.setScore(rs.getInt("SCORE"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public HotelDTO getData(String hnum) {
		HotelDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT HNUM, HID, HNAME, HLOC, HINTRO, HTEL, TO_CHAR(HDATE,'YYYY-MM-DD') HDATE, ROOMPRICE, SCORE FROM HDETAIL WHERE HNUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new HotelDTO();
				dto.setHnum(rs.getString("HNUM"));
				dto.setHid(rs.getString("HID"));
				dto.setHname(rs.getString("HNAME"));
				dto.setHloc(rs.getString("HLOC"));
				dto.setHintro(rs.getString("HINTRO"));
				dto.setHtel(rs.getString("HTEL"));
				dto.setHdate(rs.getString("HDATE"));
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	public List<HotelRoomDTO> getRoomList(String hnum) {
		List<HotelRoomDTO> list = new ArrayList<HotelRoomDTO>();
		HotelRoomDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql ="SELECT HNUM, ROOMTYPE, ROOMPRICE FROM ROOMDETAIL WHERE HNUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new HotelRoomDTO();
				dto.setHnum(rs.getString("HNUM"));
				dto.setRoomType(rs.getString("ROOMTYPE"));
				dto.setRoomPrice(rs.getInt("ROOMPRICE"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public void deleteRoom(String hnum) {
		PreparedStatement pstmt = null;
		try {
			String sql="DELETE ROOMDETAIL WHERE HNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hnum);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
	}

	public void updateHotel(HotelDTO dto) {
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE HDETAIL SET HNAME = ? , HLOC = ? , HINTRO = ? , HTEL = ? WHERE HNUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHname());
			pstmt.setString(2, dto.getHloc());
			pstmt.setString(3, dto.getHintro());
			pstmt.setString(4, dto.getHtel());
			pstmt.setString(5, dto.getHnum());
			int result = pstmt.executeUpdate();
			System.out.println(result);
			System.out.println(dto.getHname()+"  "+dto.getHloc()+"  "+dto.getHtel());
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
	}
	
	public List<String> topKeyword(){
		List<String> list = new ArrayList<String>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql="SELECT TAGINFO, HITCOUNT FROM (SELECT A.TAGINFO, A.HITCOUNT, ROW_NUMBER() OVER(ORDER BY HITCOUNT DESC) AS RNUM FROM SEARCHCOUNT A) WHERE RNUM < 6";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String keyword = rs.getString("TAGINFO");
				list.add(keyword);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public List<HscoreDTO> getSocre(String num) {
		List<HscoreDTO> list = new ArrayList<HscoreDTO>();
		HscoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql="SELECT USERID, SCORE, USERMEMO, HNUM FROM HSCORE WHERE HNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new HscoreDTO();
				dto.setUserId(rs.getString("USERID"));
				dto.setScore(rs.getInt("SCORE"));
				dto.setUserMemo(rs.getString("USERMEMO"));
				dto.setHnum(rs.getString("HNUM"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public List<HotelDTO> getList(String type, String searchValue) {
		List<HotelDTO> list = new ArrayList<HotelDTO>();
		HotelDTO dto = null;
		String sql ="SELECT HNUM,HID,HNAME,HLOC,HINTRO,HTEL,TO_CHAR(HDATE,'YYYY-MM-DD') HDATE,ROOMPRICE,SCORE FROM HDETAIL";
		if(!searchValue.equals("")) {
			searchValue = "%"+searchValue+"%";
			sql = sql+" WHERE HNAME LIKE ? OR HLOC LIKE ? ";
		}
		switch(type) {		
		case "hit":
			sql = sql+ " ORDER BY SCORE DESC";
			break;
		case "price":
			sql = sql+ " ORDER BY ROOMPRICE";
			break;
		case "new":
			sql = sql+ " ORDER BY HDATE DESC";
			break;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt= conn.prepareStatement(sql);
			if(!searchValue.equals("")) {
				pstmt.setString(1, searchValue);
				pstmt.setString(2, searchValue);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new HotelDTO();
				dto.setHnum(rs.getString("HNUM"));
				dto.setHid(rs.getString("HID"));
				dto.setHname(rs.getString("HNAME"));
				dto.setHloc(rs.getString("HLOC"));
				dto.setHintro(rs.getString("HINTRO"));
				dto.setHtel(rs.getString("HTEL"));
				dto.setHdate(rs.getString("HDATE"));
				dto.setRoomprice(rs.getInt("ROOMPRICE"));
				dto.setScore(rs.getInt("SCORE"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}

