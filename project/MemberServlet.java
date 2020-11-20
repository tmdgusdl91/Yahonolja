package com.project;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.CustomInfo;
import com.project.MemberDTO;

public class MemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		Util util = new Util();
		
		MemberDAO dao = new MemberDAO();
		
		if(uri.indexOf("main.do")!=-1) {
			url = cp+"/hotel/main.do";
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("hotel_search.do")!=-1) {
			url = cp+"/hotel/hotel_search.do?loc=0";
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("hotel_list.do")!=-1) {
			String searchValue = "";
			if(req.getParameter("searchValue")!=null) {
				searchValue = (String)req.getParameter("searchValue");
			}
			String type = "";
			if(req.getParameter("type")!=null) {
				type = (String)req.getParameter("type");
			}
			System.out.println(type);
			//전체리스트의 데이터정보
			List<HotelDTO> hlist = new HotelDAO().getList(type, searchValue);
			System.out.println(hlist.size());
			int[] num = new int[hlist.size()];
			for(int i = 0 ; i <num.length ; i++) {
				num[i] = Integer.parseInt(hlist.get(i).getHnum());
			}
			switch(type) {
			case "hit":
				req.setAttribute("type", "인기순");
				break;
			case "price":
				req.setAttribute("type", "가격순");
				break;
			case "new":
				req.setAttribute("type", "최신순");				
			}
			List<String> plist = new Util().getImg(num);
			req.setAttribute("hlist", hlist);
			req.setAttribute("plist",plist);			
			req.setAttribute("searchValue", searchValue);
			req.setAttribute("size", num.length);
			if(!searchValue.equals(""))
				dao.searchKeyword(searchValue);
			url = "/jspProject/hotel_list.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("hotel_detail.do")!=-1) {			
			// 데이터 받아와야합니다.
			String[] hotelNum = {"0", "1", "2", "3", "4", "5"};
			if(req.getParameter("result")!=null){
				if(Integer.parseInt(req.getParameter("result"))==1) {
					req.setAttribute("result", 1);
				}
				else if(Integer.parseInt(req.getParameter("result"))==2) {
					req.setAttribute("result", 2);
				}
			}
			String num = req.getParameter("hnum");
			HotelDAO hdao = new HotelDAO();
			HotelDTO hdto = hdao.getData(num);
			List<HscoreDTO> slist = hdao.getSocre(num);
			List<HotelRoomDTO> list = hdao.getRoomList(num);
			String[][] img = util.getImage(num);
			req.setAttribute("slist", slist);
			req.setAttribute("size", slist.size()-1);
			req.setAttribute("hdto", hdto);
			req.setAttribute("path", hotelNum);
			req.setAttribute("status", "find");
			req.setAttribute("img", img);
			req.setAttribute("list", list);
			int count = 0;
			for(int i = 0 ; i < 6 ; i++) {
				for(int j = 0 ; j < 5; j++) {
					if(img[i][j]!=null) count++;
				}
			}
			System.out.println(count);
			String[] mainImg = new String[count];
			int temp = 0;
			for(int i = 0 ; i < 6 ; i++) {
				for(int j = 0 ; j < 5; j++) {
					if(img[i][j]!=null) {
						mainImg[temp] = Integer.toString(i)+"/"+img[i][j];
						temp++;
					}					
				}
			}
			for(int i = 0 ; i < mainImg.length ; i++) {
				System.out.println(mainImg[i]);
			}
			req.setAttribute("mainImg", mainImg);
			req.setAttribute("num", num);
			req.setAttribute("img0", img[0]);
			req.setAttribute("img1", img[1]);
			req.setAttribute("img2", img[2]);
			req.setAttribute("img3", img[3]);
			req.setAttribute("img4", img[4]);
			req.setAttribute("img5", img[5]);			
			url = "/jspProject/hotel_detail.jsp";
			forward(req,resp,url);			
		}
		else if(uri.indexOf("hotel_reserve.do")!=-1) {
			url = "/jspProject/hotel_reserve.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("reserve_user.do")!=-1) {
			url = "/jspProject/reserve_user.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("favorites.do")!=-1) {
			url = "/jspProject/favorites.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("login.do")!=-1) {
			url = "/jspProject/login.jsp?";
			forward(req,resp,url);
		}
		else if(uri.indexOf("login_ok.do")!=-1) {
			System.out.println("여기옴");
			String userId = req.getParameter("userId");
			String userPw = req.getParameter("userPw");			
			MemberDTO dto = dao.login(userId,userPw);
			/*
			 * int type = Integer.parseInt(req.getParameter("type"));
			 * System.out.println(type); switch(type) { case 1 : url =
			 * cp+"/user/hotel_serch.do"; break; case 2: url = cp+"/user/hotel_list.do";
			 * break; case 3: url = cp+"/user/hotel_detail.do"; break; case 4: url =
			 * cp+"/user/hotel_detail.do"; break; default : url = cp+"/user/main.do"; }
			 */
			if(dto==null) {
				req.setAttribute("login", false);
				url = "/jspProject/login.jsp";
				forward(req,resp,url);
			}else {
				deleteSession(req);
				insertSession(req,dto);
				url = cp+"/hotel/main.do";
				resp.sendRedirect(url);
			}
		}else if(uri.indexOf("join.do")!=-1) {
			url = "/jspProject/join.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("join_ok.do")!=-1) {
			MemberDTO dto = new MemberDTO();
			dto.setType(Integer.parseInt(req.getParameter("userType")));
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPw(req.getParameter("userPw1"));
			dto.setUserName(req.getParameter("userName"));
			String userBirth = req.getParameter("userBy")+"-"+req.getParameter("userBm")+"-"+req.getParameter("userBd");
			dto.setUserBirth(userBirth);
			dto.setUserGender(req.getParameter("userGender"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserPhone(req.getParameter("userPhone"));
			int result = dao.userJoin(dto);
			if(result!=0) {
				req.setAttribute("login", true);
			}
			url = "/jspProject/login.jsp";
			forward(req,resp,url);
		}else if(uri.indexOf("naverCallback.do") != -1) {
			
			url = "/jspProject/naverCallback.jsp";
			forward(req, resp, url);
			
		} else if(uri.indexOf("session.do") != -1) {
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String uniqId = req.getParameter("uniqId");
			String userPhone = "";
			MemberDTO dto = new MemberDTO();
			MemberDAO mdao = new MemberDAO();
			dto.setType(3);
			dto.setUserId(uniqId);
			dto.setUserPw("naver");
			dto.setUserEmail(email);
			dto.setUserName(name);
			dto.setUserPhone(userPhone);
			dto.setUserBirth("1901-01-01");
			dto.setUserGender("무");		
			boolean b = false;
			b = mdao.idcheck(dto.getUserId());
			System.out.println(b);
			if(b) {				
				mdao.userJoin(dto);			
			}
			insertSession(req,dto);
			
			url = cp + "/user/login.do";
			resp.sendRedirect(url);
			
		}
		else if(uri.indexOf("logout_ok.do")!=-1) {
			deleteSession(req);
			url = cp+"/hotel/main.do";
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("hotel_regit_ok.do")!=-1) 
		{
			url = cp+"/hotel/main.do";
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("user_update.do")!=-1) {
			MemberDTO dto = dao.getUserData(req.getParameter("userId"));
			String[] birth = dto.getUserBirth().split("-");
			req.setAttribute("dto", dto);
			req.setAttribute("birth", birth);
			url = "/jspProject/user_update.jsp?month="+birth[1];
			forward(req, resp, url);
		}
		else if(uri.indexOf("update_user_ok.do")!=-1) {
			MemberDTO dto = dao.getUserData(req.getParameter("userId"));
			dto.setUserPw(req.getParameter("userPw1"));
			String userBirth = req.getParameter("userBy")+"-"+req.getParameter("userBm")+"-"+req.getParameter("userBd");
			dto.setUserBirth(userBirth);
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserPhone(req.getParameter("userPhone"));
			dao.userUpdate(dto);
			url = cp+"/hotel/main.do";
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("delete_user_ok.do")!=-1) {
			dao.deleteUser(req.getParameter("userId"));
			deleteSession(req);
			url = cp+"/hotel/main.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("search_list.do")!=-1) {
			String searchValue = req.getParameter("searchValue");
			dao.searchKeyword(searchValue);
		}
	}	
	private void insertSession(HttpServletRequest req, MemberDTO dto) {
		HttpSession session = req.getSession();
		CustomInfo info = new CustomInfo();
		info.setDto(dto);
		session.setAttribute("LoginInfo", info);		
	}

	private void deleteSession(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("LoginInfo");
		session.invalidate();		
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher(url);
		rs.forward(request, response);
	}	
		
}
