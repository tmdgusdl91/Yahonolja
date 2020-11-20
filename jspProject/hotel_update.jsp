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
        	function sendIt(i){
        		var f = document.myForm;
        		f.action = "<%=cp %>/hotel/update_hotel_ok.do?hnum="+i+"&userId=${sessionScope.LoginInfo.dto.userId }";
        		f.submit();
        	}   
        	function update(i){
        		var f = document.myForm;
        		f.action = "<%=cp %>/hotel/room_update.do?hnum="+i+"&userId=${sessionScope.LoginInfo.dto.userId }";
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
            <form action="" method="post" name="myForm">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="userId" class="int" maxlength="20" value="${sessionScope.LoginInfo.dto.userId }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <!-- NAME -->
                <div>
                    <h3 class="join_title">호텔이름</h3>
                    <span class="box int_name">
                        <input type="text" name="hname" class="int" maxlength="20"  placeholder="호텔델루나" value="${dto.hname }">
                    </span>
                </div>
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title">호텔주소</h3>
                    <span class="box int_email">
                        <input type="text" name="hloc" class="int" maxlength="100" placeholder="ex)군산시 해망동 장계1길 9-3" value="${dto.hloc }">
                    </span>    
                </div>                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title">호텔소개</h3>
                    <span class="box int_email">
                        <textarea rows="5" cols="30" class="int" name="hintro">${dto.hintro }</textarea>
                    </span>    
                </div>                
                  <!-- MOBILE -->
                <div>
                    <h3 class="join_title">휴대전화</h3>
                    <span class="box int_mobile">
                        <input type="tel" name="htel" class="int" maxlength="16" placeholder="063-445-7878" value="${dto.htel }">
                    </span>
                    <span class="error_next_box"></span>    
                </div>                
                <div class="btn_area" align="center">
                    <button type="button" class="submit-btn" onclick="update(${dto.hnum });">
                        <span>사진수정하기</span>
                    </button>
                     <button type="button" class="submit-btn" onclick="sendIt(${dto.hnum });">
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