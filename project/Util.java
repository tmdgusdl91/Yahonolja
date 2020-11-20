package com.project;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class Util {
	
	public String[][] getImage(String imgPath) {
		
		// 파일개수
		int fileCount = 0;
		
		// 파일이미지, 경로
		String[][] fileName = null;
		String path = "";
		String path2 = "";
		
		boolean isCheck = true;
		
		// 폴더
		File f;

		// 각자 맞는 컴퓨터경로가 필요합니다.
		path += "C:\\hotelImage\\" + imgPath;
		
		f = new File(path);
		
		
		// 폴더개수 구하기
		File[] files = f.listFiles();
		int folderCount = 0;
		for (int i = 0; i < files.length; i++) {

			if (files[i].isFile()) {
				// System.out.println("파일 : " + files[i].getName());
			} else {
				// System.out.println("디렉토리명 : " + files[i].getName());
				folderCount++;
			}
		}
		
		// 폴더 개수만큼 반복
		for(int i = 0; i < folderCount; i++) {
			
			path2 = path + "\\" + files[i].getName();
			
			f = new File(path2);
			
			// 경로의 파일의 개수를 구함
			File []fileList = f.listFiles();
			for(File file : fileList) {
				if(file.isFile()) {
					fileCount++;
				}
			}
			
			// 파일의 수만큼 배열생성
			if(isCheck) {
			fileName = new String[folderCount][10];
				isCheck = false;
			}
			
			// 파일이름을 배열에 저장
			for(int j = 0; j < fileCount; j++) {
				fileName[i][j] = fileList[j].getName();
				// System.out.println(fileName[i][j]);
			}
			//System.out.println("--------------------------");
			fileCount = 0;
		}
		return fileName;
	}
	
	//메인타이틀사진가져오기
	public List<String> getImg(int[] num) {
		List<String> list =new ArrayList<String>();
		for(int i =0 ; i < num.length ; i++) {
			File f = new File("C:\\HotelImage\\"+num[i]+"\\0\\");
			File[] file = f.listFiles();
			System.out.println(file[0].getName());
			list.add(file[0].getName());
		}
		return list;
	}
}
