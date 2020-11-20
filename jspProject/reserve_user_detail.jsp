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
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>예약 수정</title>
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
        		f.action = "<%=cp %>/reserve/reserve_user.do?userId=${sessionScope.LoginInfo.dto.userId }";
        		f.submit();
        	}
        	function cancel(){
        		var f = document.myForm;
        		f.action = "<%=cp %>/reserve/reserve_user_cancel.do?userId=${sessionScope.LoginInfo.dto.userId }";
        		f.submit();
        	}
        
        </script>
    </head>
    <body>
    	<form action="" method="post" name="myForm">
        <!-- header -->
        <div id="header">
          	<img src="<%=cp %>/jspProject/image/logo.jpg" id="logo" onclick="javascript:location.href='<%=cp%>/user/main.do';"/>
        </div>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
				
                <!-- GENDER -->
                <!-- ID -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">예약번호</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="ReserveNumber" class="int" maxlength="16" value="${dto.reserveNumber }"readonly="readonly">
                        <input type="hidden" name="UserId" value="${sessionScope.LoginInfo.dto.userId }">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <div>
                    <h3 class="join_title">
                        <label for="id">호텔 이름</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="HName" class="int" maxlength="20" value="${dto.hName }"readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">예약자 이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="UserName" class="int" maxlength="20" value="${dto.userName }"readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- Room Select -->
                <div>
                <h3 class="join_title"><label for="name">방선택</label></h3>
                           <span class="box">
                                <input type="text" name="reserveRoom" class="int" maxlength="20" value="${dto.reserveRoom }"readonly="readonly">
                           </span>
                       </div>
                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">예약 이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="UserEmail" class="int" maxlength="100" value="${dto.userEmail }" readonly="readonly">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>
                
                <div>
                    <h3 class="join_title"><label for="yy">예약일자</label></h3>
						<span class="box int_email">
                        <input type="text" name="UserEmail" class="int" maxlength="100" value="${dto.reserveDate1 } ~ ${dto.reserveDate2 }"readonly="readonly">
                    </span>
                </div>

                  <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="UserPhone" class="int" maxlength="16" value="${dto.userPhone }"readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <!-- JOIN BTN-->
                <div class="btn_area" align="center">
                    <button type="button" class="submit-btn" onclick="cancel();" >
                        <span>예약취소</span>
                    </button>
                    
                    <button type="button" class="submit-btn" onclick="sendIt();">
                        <span>돌아가기</span>
                    </button>
                </div>  
            </div> 
            <!-- content-->
        </div> 
        <!-- wrapper -->
        </form>
    </body>
</html>