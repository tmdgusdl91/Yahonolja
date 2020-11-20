package com.project;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.CustomInfo;
import com.util.DBCPConn;

public class ReviewServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException
			/*throws ServletException, IOException */{
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");	
		String cp = req.getContextPath();		
		Connection conn = DBCPConn.getConnection();
		ReviewDAO dao = new ReviewDAO(conn);
		String uri = req.getRequestURI();		
		String url="";
		
		if(uri.indexOf("review.do")!=-1) {
			String userId = req.getParameter("userId");
			String hnum = req.getParameter("hnum");
			req.setAttribute("userId", userId);
			req.setAttribute("hnum", hnum);
			HotelDTO dto = new HotelDAO().getData(hnum);
			int[] num = {Integer.parseInt(hnum)};
			List<String> plist = new Util().getImg(num);
			req.setAttribute("dto", dto);
			req.setAttribute("plist", plist);
			url = "/jspProject/review.jsp";			
			forward(req,resp,url);
		}
		else if(uri.indexOf("review_ok.do")!=-1){
			String userId = req.getParameter("userId");
			int score = 0;
			if(req.getParameter("score")!=null)
				score = Integer.parseInt(req.getParameter("score"));
			String userMemo = req.getParameter("userMemo");
			String hnum = req.getParameter("hnum");
			ReviewDTO dto = new ReviewDTO();
			dto.setUserid(userId);
			dto.setScore(score);
			dto.setUsermemo(userMemo);
			dto.setHnum(hnum);
			dao.insertData(dto);
			url = cp+"/reserve/reserve_user.do?userId="+userId;
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("cancle_ok.do")!=-1) {
			String userId=req.getParameter("userId");
			url = cp+"/reserve/reserve_user.do?userId="+userId;
			resp.sendRedirect(url);
		}
	}
}
