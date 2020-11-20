package com.project;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class ReserveServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher(url);
		rs.forward(request, response);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn = DBConn.getConnection();
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		ReserveDAO dao = new ReserveDAO();
//--------------------------------------------------------------------------------------------				
		if(uri.indexOf("hotel_reserve.do")!=-1) { //호텔 예약 페이지
			HotelDAO hdao = new HotelDAO();
			String hnum = req.getParameter("hnum");
			System.out.println(hnum);
			HotelDTO hdto = hdao.getData(hnum);
			req.setAttribute("hdto", hdto);
			List<HotelRoomDTO> roomLists = hdao.getRoomList(hnum);
			req.setAttribute("roomLists", roomLists);
			url = "/jspProject/hotel_reserve.jsp";
			forward(req,resp,url);
//--------------------------------------------------------------------------------------------					
		}else if(uri.indexOf("hotel_reserve_ok.do")!=-1) {
			
			ReserveDTO dto = new ReserveDTO();
			String hnum = req.getParameter("hnum");
			String userId = req.getParameter("userId");
			List<HotelRoomDTO> list = new HotelDAO().getRoomList(hnum);
			//int ReserveNumber,String HName, String UserName, String ReserveRoom, 
			//String ReserveDate1, String ReserveDate2, String UserPhone
			Random rand = new Random();
			dto.setReserveNumber(rand.nextInt(500000));
			dto.sethName(req.getParameter("HName"));
			System.out.println(dto.gethName());			
			dto.setUserName(req.getParameter("UserName"));
			dto.setReserveRoom(req.getParameter("ReserveRoom"));			
			for(int i = 0 ; i < list.size() ; i++) {
				if(list.get(i).getRoomType().contains(req.getParameter("ReserveRoom"))) {
					dto.setRoomPrice(list.get(i).getRoomPrice());
					System.out.println(list.get(i).getRoomPrice());
					break;
				}
			}
			dto.setUserEmail(req.getParameter("UserEmail"));
			System.out.println(dto.getReserveRoom());
			String date1 = "20/" + req.getParameter("userBm1") + "/" + req.getParameter("userBm2");
			String date2 = "20/" + req.getParameter("userBm3") + "/" + req.getParameter("userBm4");
			dto.setReserveDate1(date1);
			dto.setReserveDate2(date2);
			dto.setUserPhone(req.getParameter("UserPhone"));
			dto.setUserId(userId);
			int result = dao.hotel_resv(dto);
			System.out.println(result);
			if(result == 0) {
				url = cp + "/user/hotel_search.do";
				resp.sendRedirect(url);
				return;
			}	
			url = cp + "/reserve/reserve_user.do?userId="+req.getParameter("userId");
			resp.sendRedirect(url);
		
//--------------------------------------------------------------------------------------------			
		}else if(uri.indexOf("reserve_user.do")!=-1) { //예약한 호텔
			String UserId = req.getParameter("userId");
			List<ReserveDTO> reserveLists = dao.searchReserv(UserId);
			int[] num = new int[reserveLists.size()];
			for(int i = 0 ; i < num.length ; i++) {
				num[i] = Integer.parseInt(reserveLists.get(i).gethNum());
			}
			List<String> plist = new Util().getImg(num);
			req.setAttribute("plist", plist);
			req.setAttribute("reserveLists", reserveLists);
			req.setAttribute("size", num.length-1);
			url = "/jspProject/reserve_user.jsp";
			forward(req,resp,url);
//--------------------------------------------------------------------------------------------			
		}else if(uri.indexOf("reserve_user_detail.do")!=-1) {
			String userId = req.getParameter("userId");
			int reserveNumber = Integer.parseInt(req.getParameter("reserveNumber"));
			ReserveDTO dto = dao.searchReservDetail(userId, reserveNumber);
			req.setAttribute("dto", dto);
			url = "/jspProject/reserve_user_detail.jsp";
			forward(req,resp,url);
			
		}else if(uri.indexOf("reserve_user_cancel.do")!=-1) {
			String UserId = req.getParameter("userId");
			int ReserveNumber = Integer.parseInt(req.getParameter("ReserveNumber"));
			dao.deleteReserve(UserId, ReserveNumber);
			url = cp + "/reserve/reserve_user.do?userId="+UserId;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("reserve_hotel.do")!=-1) {
			String userId = req.getParameter("userId");
			List<ReserveDTO> reserveListsHotel = dao.searchReservHotel(userId);
			int[] num = new int[reserveListsHotel.size()];
			for(int i = 0 ; i < num.length ; i++) {
				num[i] = Integer.parseInt(reserveListsHotel.get(i).gethNum());
			}
			List<String> plist = new Util().getImg(num);
			req.setAttribute("plist", plist);
			req.setAttribute("reserveListsHotel", reserveListsHotel);
			url = "/jspProject/reserve_hotel.jsp";
			req.setAttribute("size", num.length-1);
			forward(req,resp,url);
			
		}else if(uri.indexOf("reserve_hotel_detail.do")!=-1) {
			String userId = req.getParameter("userId");
			int ReserveNumber = Integer.parseInt(req.getParameter("ReserveNumber"));
			System.out.println(ReserveNumber);
			ReserveDTO dto = dao.searchHotelDetail(userId, ReserveNumber);
			req.setAttribute("dto", dto);
			url = "/jspProject/reserve_hotel_detail.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("favorites_ok.do")!=-1){
			String hnum = req.getParameter("hnum");
			String userId = req.getParameter("userId");
			int result = dao.setFavorites(userId,hnum);
			url = cp+"/user/hotel_detail.do?hnum="+hnum+"&result="+result;
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("favorites.do")!=-1) {
			String userId = req.getParameter("userId");
			HotelDAO hdao = new HotelDAO();
			//등록된 호텔넘버를 찾음.
			int[] hnum = dao.getFavorites(userId);
			//등록된번호의 호텔데이터를 가져옴
			List<HotelDTO> hlist = hdao.getList(hnum);
			//사진데이터가져오기
			List<String> plist = new Util().getImg(hnum);
			req.setAttribute("hlist", hlist);
			req.setAttribute("plist", plist);
			req.setAttribute("size", hlist.size()-1);
			url = "/jspProject/favorites.jsp";
			forward(req, resp, url);
		}
		else if(uri.indexOf("delete_Favorites.do")!=-1) {
			String userId = req.getParameter("userId");
			String hnum = req.getParameter("hnum");
			dao.deleteFavorites(userId,hnum);
			url=cp+"/reserve/favorites.do?userId="+userId;
			resp.sendRedirect(url);
		}
	}
}
