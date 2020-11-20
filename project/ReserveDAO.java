package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ReserveDAO {
	// 유저 입장

	public void getData(ReserveDTO dto) {
		// 필요한 파일들 가져오기 --> 있으면 정리깔끔
	}

	public int hotel_resv(ReserveDTO dto) {
		// 필요:
		// int ReserveNumber,String HName, String UserName, String ReserveRoom, String
		// ReserveDate1
		// String ReserveDate2, String UserPhone

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int result = 1;
		String UserId = "", HNum = "", HId = "", HLoc = "", HTel = "";
		int RoomPrice = 0;
		try {
			sql = "SELECT HNUM,HID,HTEL,HLOC from HDETAIL where HNAME = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.gethName());
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				HNum = rs.getString("HNUM");
				HId = rs.getString("HID");
				HTel = rs.getString("HTEL");
				HLoc = rs.getString("HLOC");
			}
			/*
			 * sql = "SELECT ROOMPRICE from ROOMDETAIL where HNUM= ? AND ROOMTYPE = ?";
			 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, HNum);
			 * pstmt.setString(2, dto.getReserveRoom()); rs = pstmt.executeQuery();
			 * System.out.println(sql); if (rs.next()) { RoomPrice = rs.getInt("ROOMPRICE");
			 * }
			 */
//--------------------------------------------------------------------------------------------------------------------------
			sql = "INSERT INTO PMEMBER_RESERVE(USERID,USERNAME,HNUM,HNAME,HTEL,HLOC,RESERVEROOM,RESERVEDATE1 ,RESERVEDATE2,ROOMPRICE,RESERVENUMBER,USEREMAIL) "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, HNum);
			pstmt.setString(4, dto.gethName());
			pstmt.setString(5, HTel);
			pstmt.setString(6, HLoc);
			pstmt.setString(7, dto.getReserveRoom());
			pstmt.setString(8, dto.getReserveDate1());
			pstmt.setString(9, dto.getReserveDate2());
			pstmt.setInt(10, dto.getRoomPrice());
			pstmt.setInt(11, dto.getReserveNumber());
			pstmt.setString(12, dto.getUserEmail());

			pstmt.executeUpdate();

			sql = "INSERT INTO HOTEL_RESERVE(USERID,USERNAME,HNUM,HNAME,RESERVEROOM,RESERVEDATE1,RESERVEDATE2,RESERVENUMBER,USERPHONE,HID,USEREMAIL) "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, UserId);
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, HNum);
			pstmt.setString(4, dto.gethName());
			pstmt.setString(5, dto.getReserveRoom());
			pstmt.setString(6, dto.getReserveDate1());
			pstmt.setString(7, dto.getReserveDate2());
			pstmt.setInt(8, dto.getReserveNumber());
			pstmt.setString(9, dto.getUserPhone());
			pstmt.setString(10, HId);
			pstmt.setString(11, dto.getUserEmail());

			pstmt.executeUpdate();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			result = 0;
		}
		return result;
	}

//-----------------------------------------------------------------------------------------------------------------------------
	public List<ReserveDTO> searchReserv(String UserId) {
		List<ReserveDTO> list = new ArrayList<>();
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int timeLeft = 0;
		try {
			sql = "select USERID,USERNAME,HNUM,HNAME,HTEL,HLOC,RESERVEROOM,to_char(RESERVEDATE1,'YYYY-MM-DD') RESERVEDATE1,to_char(RESERVEDATE2,'YYYY-MM-DD') RESERVEDATE2,ROOMPRICE,RESERVENUMBER "
					+ "from PMEMBER_RESERVE where USERID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(UserId);
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.sethTel(rs.getString("HTEL"));
				r_data.sethLoc(rs.getString("HLOC"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setRoomPrice(rs.getInt("ROOMPRICE"));
				r_data.setReserveNumber(rs.getInt("RESERVENUMBER"));
				LocalDate myObj = LocalDate.now();
				LocalDate datee = LocalDate.parse(rs.getString("RESERVEDATE2"));
				timeLeft = myObj.compareTo(datee);
				r_data.setDateNum(timeLeft);
				list.add(r_data);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	// -------------------------------------------------------
	public int searchReservDate(String UserId) {
		List<ReserveDTO> list = new ArrayList<>();
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int timeLeft = 0;
		try {
			sql = "select USERID,USERNAME,HNUM,HNAME,HTEL,HLOC,RESERVEROOM,to_char(RESERVEDATE1,'YYYY-MM-DD') RESERVEDATE1,to_char(RESERVEDATE2,'YYYY-MM-DD') RESERVEDATE2,ROOMPRICE,RESERVENUMBER "
					+ "from PMEMBER_RESERVE where USERID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(UserId);
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.sethTel(rs.getString("HTEL"));
				r_data.sethLoc(rs.getString("HLOC"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setRoomPrice(rs.getInt("ROOMPRICE"));
				r_data.setReserveNumber(rs.getInt("RESERVENUMBER"));
				list.add(r_data);
			}
			LocalDate myObj = LocalDate.now();
			LocalDate datee = LocalDate.parse(r_data.getReserveDate2());
			timeLeft = myObj.compareTo(datee);
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return timeLeft;
	}

//-----------------------------------------------------------------------------------------------------------------------------
	public List<ReserveDTO> searchReservHotel(String UserId) {
		List<ReserveDTO> list = new ArrayList<>();
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			sql = "select USERID,USERNAME,HNUM,HNAME,RESERVEROOM,to_char(RESERVEDATE1,'YYYY-MM-DD') RESERVEDATE1,to_char(RESERVEDATE2,'YYYY-MM-DD') RESERVEDATE2,RESERVENUMBER,USERPHONE "
					+ "from HOTEL_RESERVE where HID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(rs.getString("USERID"));
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setReserveNumber(rs.getInt("RESERVENUMBER"));
				r_data.setUserPhone(rs.getString("USERPHONE"));
				list.add(r_data);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

//-----------------------------------------------------------------------------------------------------------------------------
	public ReserveDTO searchReservDetail(String UserId, int ReserveNumber) {
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			sql = "select USERID,USERNAME,HNUM,HNAME,HTEL,HLOC,RESERVEROOM,to_char(RESERVEDATE1,'YYYY-MM-DD') RESERVEDATE1,to_char(RESERVEDATE2,'YYYY-MM-DD') RESERVEDATE2,ROOMPRICE,RESERVENUMBER,USEREMAIL "
					+ "from PMEMBER_RESERVE where USERID=? AND RESERVENUMBER=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			pstmt.setInt(2, ReserveNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(UserId);
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.sethTel(rs.getString("HTEL"));
				r_data.sethLoc(rs.getString("HLOC"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setRoomPrice(rs.getInt("ROOMPRICE"));
				r_data.setReserveNumber(ReserveNumber);
				r_data.setUserEmail(rs.getString("USEREMAIL"));
			}
			pstmt.close();
			rs.close();

			sql = "select USERPHONE " + "from HOTEL_RESERVE where USERID=? AND RESERVENUMBER=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			pstmt.setInt(2, ReserveNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_data.setUserPhone(rs.getString("USERPHONE"));
			}
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r_data;
	}

//-----------------------------------------------------------------------------------------------------------------------------
	public void deleteReserve(String UserId, int RESERVENUMBER) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "delete PMEMBER_RESERVE where USERID =? and RESERVENUMBER =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			pstmt.setInt(2, RESERVENUMBER);
			pstmt.executeUpdate();
			sql = "delete hotel_reserve where USERID =? and RESERVENUMBER =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			pstmt.setInt(2, RESERVENUMBER);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public ReserveDTO searchHotel(String HName) {
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			sql = "select HNAME from HDETAIL where HNAME= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HName);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_data = new ReserveDTO();
				r_data.sethName(rs.getString("HNAME"));
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r_data;
	}
//-----------------------------------------------------------------------------------------------------------------------------
//-- 호텔 관점

	public List<ReserveDTO> hotelReserve(String HId) {
		List<ReserveDTO> list = new ArrayList<>();
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			sql = "select USERID,USERNAME,HID,HNUM,HNAME,RESERVEROOM,RESERVEDATE1,RESERVEDATE2,USERPHONE,RESERVENUMBER FROM HOTEL_RESERVE WHERE HID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(rs.getString("USERID"));
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.sethId(HId);
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setUserPhone(rs.getString("USERPHONE"));
				r_data.setReserveNumber(rs.getInt("RESERVENUMBER"));
				list.add(r_data);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public ReserveDTO searchHotelDetail(String HId, int ReserveNumber) {
		ReserveDTO r_data = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			sql = "select USERID,USERNAME,USEREMAIL,HID,HNUM,HNAME,RESERVEROOM,to_char(RESERVEDATE1,'YYYY-MM-DD') RESERVEDATE1,to_char(RESERVEDATE2,'YYYY-MM-DD') RESERVEDATE2,USERPHONE,RESERVENUMBER FROM HOTEL_RESERVE WHERE HID=? AND RESERVENUMBER=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HId);
			pstmt.setInt(2, ReserveNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_data = new ReserveDTO();
				r_data.setUserId(rs.getString("USERID"));
				r_data.setUserName(rs.getString("USERNAME"));
				r_data.setUserEmail(rs.getString("USEREMAIL"));
				r_data.sethId(HId);
				r_data.sethNum(rs.getString("HNUM"));
				r_data.sethName(rs.getString("HNAME"));
				r_data.setReserveRoom(rs.getString("RESERVEROOM"));
				r_data.setReserveDate1(rs.getString("RESERVEDATE1"));
				r_data.setReserveDate2(rs.getString("RESERVEDATE2"));
				r_data.setUserPhone(rs.getString("USERPHONE"));
				r_data.setReserveNumber(rs.getInt("RESERVENUMBER"));
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r_data;
	}

	public int setFavorites(String userId, String hnum) {
		PreparedStatement pstmt = null;
		try {
			if (facheck(userId, hnum)) {
				String sql = "INSERT INTO FAVORITES (USERID, HNUM) VALUES (?,?)";
				Connection conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, hnum);
				pstmt.executeUpdate();
				pstmt.close();
				return 1;
			}else {
				return 2;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	private boolean facheck(String userId, String hnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT USERID, HNUM FROM FAVORITES WHERE USERID = ?";
			Connection conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(hnum.equals(rs.getString("HNUM"))){
					return false;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return true;
	}

	public int[] getFavorites(String userId) {
		int[] hnum = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DBConn.getConnection();
		FavoritesDTO dto = null;
		try {
			String sql = "SELECT COUNT(*) FROM FAVORITES WHERE USERID =  ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				hnum = new int[rs.getInt(1)];
				int i = 0;
				sql = "SELECT USERID, HNUM FROM FAVORITES WHERE USERID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					hnum[i] = rs.getInt("HNUM");
					i++;
				}
			}			
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return hnum;
	}

	public void deleteFavorites(String userId, String hnum) {
		PreparedStatement pstmt = null;
		Connection conn = DBConn.getConnection();
		try {
			String sql ="DELETE FAVORITES WHERE USERID =? AND HNUM =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, hnum);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	public List<ReserveDTO> searchHotelRoom(String hNum) {
        List<ReserveDTO> list = new ArrayList<>();
        ReserveDTO r_data = null;
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        try {
            sql = "select roomtype from roomdetail where hnum = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, hNum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                r_data = new ReserveDTO();
                r_data.setReserveRoom(rs.getString("roomtype"));
                list.add(r_data);
            }
            pstmt.close();
            rs.close();
        }catch(Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
}
