package com.project;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class Util {
	
	public String[][] getImage(String imgPath) {
		
		// ���ϰ���
		int fileCount = 0;
		
		// �����̹���, ���
		String[][] fileName = null;
		String path = "";
		String path2 = "";
		
		boolean isCheck = true;
		
		// ����
		File f;

		// ���� �´� ��ǻ�Ͱ�ΰ� �ʿ��մϴ�.
		path += "C:\\hotelImage\\" + imgPath;
		
		f = new File(path);
		
		
		// �������� ���ϱ�
		File[] files = f.listFiles();
		int folderCount = 0;
		for (int i = 0; i < files.length; i++) {

			if (files[i].isFile()) {
				// System.out.println("���� : " + files[i].getName());
			} else {
				// System.out.println("���丮�� : " + files[i].getName());
				folderCount++;
			}
		}
		
		// ���� ������ŭ �ݺ�
		for(int i = 0; i < folderCount; i++) {
			
			path2 = path + "\\" + files[i].getName();
			
			f = new File(path2);
			
			// ����� ������ ������ ����
			File []fileList = f.listFiles();
			for(File file : fileList) {
				if(file.isFile()) {
					fileCount++;
				}
			}
			
			// ������ ����ŭ �迭����
			if(isCheck) {
			fileName = new String[folderCount][10];
				isCheck = false;
			}
			
			// �����̸��� �迭�� ����
			for(int j = 0; j < fileCount; j++) {
				fileName[i][j] = fileList[j].getName();
				// System.out.println(fileName[i][j]);
			}
			//System.out.println("--------------------------");
			fileCount = 0;
		}
		return fileName;
	}
	
	//����Ÿ��Ʋ������������
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
