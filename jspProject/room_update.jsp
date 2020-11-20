<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
%>
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <title>야호놀자 : 호텔등록하기</title>
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/join.css">
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/login.css">
		<style type="text/css">
			#fcolor {
	 color: rgb(248,48,156);
	}
		</style>
        <script type="text/javascript" src="<%=cp %>/jspProject/js/join.js"></script>
        <script type="text/javascript">
        	function sendIt(){
        		var f = document.myForm;
        		f.submit();
        	}        
        </script>
    </head>
    <body>
        <!-- header -->
        <div id="header">
          	<img src="<%=cp %>/jspProject/image/logo.jpg" id="logo"/>
        </div>
        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">
            <form action="<%=cp %>/hotel/update_room_ok.do?hnum=${hnum}&userId=${userId}" method="post" name="myForm" enctype="multipart/form-data">
            <!-- RoomMain -->
                <div>
                    <h3 class="join_title">메인 사진 (사진 최대 5장)</h3>  
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile0_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile0_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile0_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile0_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile0_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>                
                
                 <!-- Room1 -->
                <div>
                    <h3 class="join_title">객실 입력 (사진 최대 5장)</h3>
                    <span class="box int_mobile">
                        <input type="text" name="hotelRoomName1" class="int" maxlength="16" placeholder="객실 이름">
                    </span> 
                    <span class="box int_mobile">
                        <input type="text" name="hotelPrice1" class="int" maxlength="16"  placeholder="객실 가격">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile1_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile1_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile1_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile1_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile1_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>
                
                <!-- Room2 -->
                <div>
                    <h3 class="join_title">객실 입력 (사진 최대 5장)</h3>
                    <span class="box int_mobile">
                        <input type="text" name="hotelRoomName2" class="int" maxlength="16" placeholder="객실 이름">
                    </span> 
                    <span class="box int_mobile">
                        <input type="text" name="hotelPrice2" class="int" maxlength="16"  placeholder="객실 가격">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile2_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile2_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile2_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile2_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile2_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>
                
                <!-- Room3 -->
                <div>
                    <h3 class="join_title">객실 입력 (사진 최대 5장)</h3>
                    <span class="box int_mobile">
                        <input type="text" name="hotelRoomName3" class="int" maxlength="16" placeholder="객실 이름">
                    </span> 
                    <span class="box int_mobile">
                        <input type="text" name="hotelPrice3" class="int" maxlength="16"  placeholder="객실 가격">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile3_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile3_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile3_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile3_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile3_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>
                <!-- Room4 -->
                <div>
                    <h3 class="join_title">객실 입력 (사진 최대 5장)</h3>
                    <span class="box int_mobile">
                        <input type="text" name="hotelRoomName4" class="int" maxlength="16" placeholder="객실 이름">
                    </span> 
                    <span class="box int_mobile">
                        <input type="text" name="hotelPrice4" class="int" maxlength="16"  placeholder="객실 가격">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile4_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile4_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile4_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile4_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile4_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>
                
                <!-- Room5 -->
                <div>
                    <h3 class="join_title">객실 입력 (사진 최대 5장)</h3>
                    <span class="box int_mobile">
                        <input type="text" name="hotelRoomName5" class="int" maxlength="16" placeholder="객실 이름">
                    </span> 
                    <span class="box int_mobile">
                        <input type="text" name="hotelPrice5" class="int" maxlength="16"  placeholder="객실 가격">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile5_1" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile5_2" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile5_3" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile5_4" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>
                    <span class="box int_mobile">
                        <input type="file" name="hotelFile5_5" class="int" maxlength="16"  placeholder="객실 사진(최대 5장)">
                    </span>                    
                </div>
                <!-- JOIN BTN-->
                <div class="btn_area" align="center">
                    <button type="button" class="submit-btn" onclick="sendIt();">
                        <span>수정하기</span>
                    </button>
                </div>
              </form>
            </div> 
            <!-- content-->
        </div> 
        <!-- wrapper -->
        								<p align="center">
									<font size="2pt" style="align: left;">
									<br/><br/><br/><br/><br/><br/>
									(주)야호놀자 대표이사 : 장만월<br/>
									사업자 등록번호 : 220-87-42885<br/>
									통신판매업신고 : 강남-14211호 메일 : yaho@yahonolja.com<br/>
									관광사업자 등록번호 : 제2016-31호<br/>
									주소 : 서울 강남구 테헤란로 108길 42<br/>
									호스팅서비스 제공자 : 주식회사 야호놀자<br/>
									고객센터 : 1644-1346 (오전 9시 - 익일 새벽 3시)<br/>
									</font>
								</p>
    </body>
</html>