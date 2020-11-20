<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
Date now = new Date();

SimpleDateFormat sf = new SimpleDateFormat("MM");
SimpleDateFormat sf1 = new SimpleDateFormat("dd");

int month = Integer.parseInt(sf.format(now));
int day = Integer.parseInt(sf1.format(now));
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>예약하기</title>
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/join.css">
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/login.css">
        <style type="text/css">
        	#fcolor {
	 		color: rgb(248,48,156);
			}
        
        </style>
        <script type="text/javascript" src="<%=cp %>/jspProject/js/join.js"></script>
        <script type="text/javascript" src="<%=cp %>/jspProject/js/date.js"></script>
        <script type="text/javascript">
        	function sendIt(){
        		
        		var f = document.myForm;
        		var a = parseInt(f.userBm1.value);
        		var b = parseInt(f.userBm2.value);
        		var c = parseInt(f.userBm3.value);
        		var d = parseInt(f.userBm4.value);
        		
        		if(c < a ){
        		alert("예약일자를 확인해주세요");
        		return;
        		}else if(c == a && b == d){
        		alert("1박이상 선택해야합니다.")
        		return;
        		}else if(c == a && b > d){
        		alert("선택할수 없습니다.");
        		return;
        		}
        		f.action = "<%=cp %>/reserve/hotel_reserve_ok.do?userId=${sessionScope.LoginInfo.dto.userId }&hnum=${hdto.hnum}";
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
                    <h3 class="join_title">
                        <label for="id">호텔이름</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="HName" class="int" maxlength="20" value="${hdto.hname }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">예약자 이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="UserName" class="int" maxlength="20" value="${sessionScope.LoginInfo.dto.userName }" readonly="readonly">
                        <input type="hidden" name="UserId" value="${sessionScope.LoginInfo.dto.userId }">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- Room Select -->
                <div>
                <h3 class="join_title"><label for="name">방선택</label></h3>
                           <span class="box">
                               <select name="ReserveRoom" class="sel">
                                   <option value="00">방을선택해주세요</option>
                                   <c:forEach var="dto" items="${roomLists }">
                                   <option value=${dto.getRoomType() }>${dto.getRoomType() }</option>
                                   </c:forEach>
                               </select>
                           </span>
                       </div>
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                    <span class="box int_email">
                       <input type="text" name="UserEmail" class="int" maxlength="100" value="${sessionScope.LoginInfo.dto.userEmail }">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>
                
                <div>
                    <h3 class="join_title"><label for="yy">일자 선택</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
						 <select name="userBm1" onchange="categoryChange(this)">
							  <option value="00">월</option>
									<c:forEach var="date1" begin="<%=month %>" end="12">
										<c:if test="${date1 lt 10}">
											<option value="0${date1 }">${date1 }</option>
										</c:if>
										<c:if test="${date1 gt 9}">
											<option value="${date1 }">${date1 }</option>
										</c:if>
									</c:forEach>
							</select>
							</span>
                        </div>

                        <div id="bir_mm">
                            <span class="box">
                            	<input type="hidden" name="textValue">
                                <select id="good" name="userBm2" class="sel">
								<option>일</option>
								</select>
                            </span>
                        </div>      
                        <div id="bir_mm">
                            <span class="box">
                           
                                <select name="userBm3" class="sel" onchange="categoryChange1(this)" >
                                	<option value="00">월</option>
                                    <c:forEach var="date3" begin="<%=month %>" end="12">
                                    <c:if test="${date3 lt 10}">
                                    <option value="0${date3 }">${date3 }</option>
                                    </c:if>
                                    <c:if test="${date3 gt 9}">
                                    <option value="${date3 }">${date3 }</option>
                                    </c:if>
                                    </c:forEach>
                                </select>
                            </span>
                        </div>
                        <div id="bir_mm">
                            <span class="box">
                                <select id="good1" name="userBm4" class="sel">
								<option>일</option>
								</select>
                            </span>
                        </div>
                    </div>  
                </div>

                  <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="UserPhone" class="int" maxlength="16" placeholder="전화번호 입력" value="${sessionScope.LoginInfo.dto.userPhone }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <!-- JOIN BTN-->
                <div class="btn_area" align="center">
                    <button type="button" class="submit-btn" onclick="sendIt();">
                        <span>예약하기</span>
                    </button>
                </div>  
            </div> 
            <!-- content-->
        </div> 
        <!-- wrapper -->
        </form>
        						
    </body>
</html>