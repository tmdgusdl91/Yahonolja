package com.project;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HotelServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String path = "C:\\HotelImage\\";
		String url;
		Util util = new Util();
		HotelDAO dao = new HotelDAO();
		if (uri.indexOf("hotel_regit.do") != -1) {
			url = "/jspProject/hotel_regit.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("main.do") != -1) {
			int totalNum = Integer.parseInt(dao.getMaxNum()) - 1;
			int[] num = new int[3];
			for (int i = 0; i < num.length; i++) {
				num[i] = (int) (Math.random() * totalNum + 1);
			}
			List<HotelDTO> list = dao.getList(num);
			List<String> ilist = util.getImg(num);
			req.setAttribute("list", list);
			req.setAttribute("path", cp);
			req.setAttribute("ilist", ilist);
			url = "/jspProject/main.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("hotel_search.do") != -1) {
			int type = 0;
			if (req.getParameter("loc") != null) {
				type = Integer.parseInt(req.getParameter("loc"));
			}
			System.out.println(type);
			List<HotelDTO> hit_dto = dao.getList("score", type, 6);
			List<HotelDTO> price_dto = dao.getList("price", type, 6);
			List<HotelDTO> new_dto = dao.getList("hdate", type, 6);
			List<String> topKeyword = dao.topKeyword();
			System.out.println(hit_dto.size());

			int[] num = new int[5];
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(hit_dto.get(i).getHnum());
			}
			List<String> hit_ilist = util.getImg(num);
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(price_dto.get(i).getHnum());
			}
			List<String> price_ilist = util.getImg(num);
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(new_dto.get(i).getHnum());
			}
			List<String> new_ilist = util.getImg(num);

			req.setAttribute("hit_dto", hit_dto);
			req.setAttribute("hit_ilist", hit_ilist);
			req.setAttribute("price_dto", price_dto);
			req.setAttribute("price_ilist", price_ilist);
			req.setAttribute("new_dto", new_dto);
			req.setAttribute("new_ilist", new_ilist);
			req.setAttribute("topKeyword", topKeyword);

			
			url = "/jspProject/hotel_search.jsp?loc="+type;
			forward(req, resp, url);
		} else if (uri.indexOf("hotel_regit_ok.do") != -1) {
			String encType = "UTF-8";
			int maxFileSize = 30 * 1024 * 1024; // 30mb
			HotelDTO dto = new HotelDTO();
			try {
				// 임시파일에 저장
				String hnum = dao.getMaxNum();
				path = "C:\\HotelImage\\" + hnum + "\\";
				File f = new File(path + "temp");
				if (!f.exists()) {
					f.mkdirs();
				}
				MultipartRequest mr = new MultipartRequest(req, path + "temp", maxFileSize, encType,
						new DefaultFileRenamePolicy());
				// Hdetail등록
				dto.setHnum(hnum);
				System.out.println(hnum);
				dto.setHid(mr.getParameter("userId"));
				dto.setHname(mr.getParameter("hotelName"));
				dto.setHloc(mr.getParameter("hotelAddress"));
				dto.setHintro(mr.getParameter("hotelInfo"));
				dto.setHtel(mr.getParameter("hotelNum"));
				dto.setRoomprice(Integer.parseInt(mr.getParameter("hotelPrice1")));
				dao.insertHotel(dto);
				// 사진이동
				moveFile(mr, hnum, path);
				// RoomDetail등록
				for (int i = 1; i < 6; i++) {
					String hotelRoomName = "hotelRoomName" + Integer.toString(i);
					String hotelRoomPrice = "hotelPrice" + Integer.toString(i);
					if (mr.getParameter(hotelRoomName) != null) {
						dto = new HotelDTO();
						dto.setHnum(hnum);
						dto.setHroomName(mr.getParameter(hotelRoomName));
						dto.setHroomprice(Integer.parseInt(mr.getParameter(hotelRoomPrice)));
						dao.insertRoom(dto);
					}
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			url = cp + "/user/main.do";
			resp.sendRedirect(url);
		} else if (uri.indexOf("hotel_my.do") != -1) {
			String userId = req.getParameter("userId");
			req.setAttribute("userId", userId);
			List<HotelDTO> list = dao.getList(userId);
			int[] num = new int[list.size()];
			for (int i = 0; i < list.size(); i++) {
				num[i] = Integer.parseInt(list.get(i).getHnum());
			}
			List<String> hotellist_ilist = util.getImg(num);
			req.setAttribute("hotellist", list);
			req.setAttribute("hotellist_ilist", hotellist_ilist);
			req.setAttribute("length", list.size());
			url = "/jspProject/hotel_my.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("hotel_update.do") != -1) {
			HotelDTO dto = dao.getData(req.getParameter("hnum"));
			req.setAttribute("hnum", req.getParameter("hnum"));
			req.setAttribute("dto", dto);
			url = "/jspProject/hotel_update.jsp";
			forward(req, resp, url);
		} else if(uri.indexOf("update_hotel_ok.do")!=-1) {			
			String userId = req.getParameter("userId");
			String hnum = req.getParameter("hnum");
			String hotelName = req.getParameter("hname");
			String hotelLoc = req.getParameter("hloc");
			String hotelIntro = req.getParameter("hintro");
			String hotelNum = req.getParameter("htel");
			System.out.println(userId+"  "+hnum+"  "+hotelName+"   "+hotelLoc+"  "+hotelIntro+"  "+hotelNum);
			HotelDTO dto = dao.getData(hnum);
			dto.setHname(hotelName);
			dto.setHloc(hotelLoc);
			dto.setHintro(hotelIntro);
			dto.setHtel(hotelNum);
			dao.updateHotel(dto);
			url = cp+"/hotel/hotel_my.do?userId="+userId;
			resp.sendRedirect(url);
		}		
		else if (uri.indexOf("room_update.do") != -1) {
			req.setAttribute("hnum", req.getParameter("hnum"));
			req.setAttribute("userId", req.getParameter("userId"));
			url = "/jspProject/room_update.jsp";
			forward(req, resp, url);
		} else if (uri.indexOf("update_room_ok.do") != -1) {
			String hnum = req.getParameter("hnum");
			String encType = "UTF-8";
			int maxFileSize = 30 * 1024 * 1024; // 30mb
			// temp폴더삭제
			for (int i = 0; i < 6; i++) {
				path = "C:\\HotelImage\\" + hnum + "\\"+i;
				System.out.println(path);
				File f = new File(path);
				try {
					while (f.exists()) {
						File[] folder_list = f.listFiles(); // 파일리스트 얻어오기
						for (int j = 0; j < folder_list.length; j++) {
							folder_list[j].delete(); // 파일 삭제
						}
						if (folder_list.length == 0 && f.isDirectory()) {
							f.delete(); // 대상폴더 삭제
						}
					}
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			path = "C:\\HotelImage\\" + hnum + "\\";
			File f = new File(path + "temp");
			if (!f.exists()) {
				f.mkdirs();
			}
			MultipartRequest mr = new MultipartRequest(req, path + "temp", maxFileSize, encType,
					new DefaultFileRenamePolicy());
			
			//사진이동
			moveFile(mr,hnum, path);
			HotelDTO dto = null;
			// 기존 DB삭제
			dao.deleteRoom(hnum);
			// 새로운 정보 등록
			for (int i = 1; i < 6; i++) {
				String hotelRoomName = "hotelRoomName" + Integer.toString(i);
				String hotelRoomPrice = "hotelPrice" + Integer.toString(i);
				System.out.println(hotelRoomName+"  "+hotelRoomPrice);
				if (mr.getParameter(hotelRoomName) != null) {
					dto = new HotelDTO();
					dto.setHnum(hnum);
					dto.setHroomName(mr.getParameter(hotelRoomName));
					dto.setHroomprice(Integer.parseInt(mr.getParameter(hotelRoomPrice)));
					dao.insertRoom(dto);
				}
			}
			String userId = req.getParameter("userId");
			url = cp+"/hotel/hotel_my.do?userId="+userId;
			resp.sendRedirect(url);
		}
	}

	private void moveFile(MultipartRequest mr, String hnum, String path) {
		Enumeration name = mr.getFileNames(); // 가져온 fileName
		String[][] file = new String[6][5];
		int t0, t1, t2, t3, t4, t5;
		t0 = t1 = t2 = t3 = t4 = t5 = 0;
		// 종류별저장
		while (name.hasMoreElements()) {
			String fileNames = (String) name.nextElement();
			String originalFileName = mr.getOriginalFileName(fileNames);
			if (fileNames.contains("hotelFile0")) {
				file[0][t0] = originalFileName;
				t0++;
			} else if (fileNames.contains("hotelFile1")) {
				file[1][t1] = originalFileName;
				t1++;
			} else if (fileNames.contains("hotelFile2")) {
				file[2][t2] = originalFileName;
				t2++;
			} else if (fileNames.contains("hotelFile3")) {
				file[3][t3] = originalFileName;
				t3++;
			} else if (fileNames.contains("hotelFile4")) {
				file[4][t4] = originalFileName;
				t4++;
			} else if (fileNames.contains("hotelFile5")) {
				file[5][t5] = originalFileName;
				t5++;
			}
		}
		System.out.println("중간확인1");
		// 폴더생성
		File f;
		for (int i = 0; i < 6; i++) {
			f = new File(path + Integer.toString(i));
			if (!f.exists()) {
				f.mkdirs();
			}
		}
		System.out.println("중간확인2");
		// 파일이동
		for (int i = 0; i < 6; i++) {
			for (int j = 0; j < file[0].length; j++) {
				if (file[i][j] != null) {
					Path source = Paths.get(path + "temp\\" + file[i][j]);
					Path target = Paths.get(path + Integer.toString(i) + "\\" + file[i][j]);
					try {
						Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						System.out.println(e.toString());
					}
				}
			}
		}
		System.out.println("중간확인3");
		// temp폴더삭제
		path = "C:\\HotelImage\\" + hnum + "\\temp";
		f = new File(path);
		try {
			while (f.exists()) {
				File[] folder_list = f.listFiles(); // 파일리스트 얻어오기
				for (int j = 0; j < folder_list.length; j++) {
					folder_list[j].delete(); // 파일 삭제
				}
				if (folder_list.length == 0 && f.isDirectory()) {
					f.delete(); // 대상폴더 삭제
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher(url);
		rs.forward(request, response);
	}
}
