<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
String month = request.getParameter("month");
%>
<%

%>
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <title>야호놀자 : 정보수정</title>
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/join.css">
        <link rel="stylesheet" href="<%=cp %>/jspProject/css/login.css">
		<style type="text/css">		
			body {
			    margin: 0;
			    height: 100%;
				background-image: url("<%=cp %>/jspProject/image/backg.png");
			    font-family: Dotum,'돋움',Helvetica,sans-serif;
			}
				#fcolor {
	 color: rgb(248,48,156);
	}
		</style>
        <script type="text/javascript" src="<%=cp %>/jspProject/js/join.js"></script>
    </head>
    <body>
    	<form action="<%=cp %>/user/update_user_ok.do" method="post" name="myForm">
        <!-- header -->
        <div id="header">
          	<img src="<%=cp %>/jspProject/image/logo.jpg" id="logo"/>
        </div>
        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">				
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="userId" class="int" maxlength="20" value="${dto.userId }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
               <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="userPw1" class="int" maxlength="20" value="${dto.userPw }">                     
                    </span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" name="userPw2" class="int" maxlength="20" value="${dto.userPw }">
                    </span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="userName" class="int" maxlength="20" value="${dto.userName }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" name="userBy" class="int" maxlength="4" placeholder="년(4자)" value="${birth[0] }">
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select name="userBm" class="sel">
                                    <option value="00">월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                                <input type="text" name="userBd" class="int" maxlength="2" placeholder="일" value="${birth[2] }">
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="userEmail" class="int" maxlength="100" placeholder="선택입력" value="${dto.userEmail }">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>
                
                

                  <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="userPhone" class="int" maxlength="16" placeholder="전화번호 입력" value="${dto.userPhone }">
                    </span>
                    <span class="error_next_box"></span>    
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area" align="center">
                    <button type="button" class="submit-btn" onclick="sendIt();">
                        <span>수정하기</span>
                    </button>
                    <button type="button" class="submit-btn" onclick="update('${dto.userId}');">
                        <span>회원탈퇴</span>
                    </button>
                </div>  
            </div> 
            <!-- content-->
        </div> 
        <!-- wrapper -->
        </form>
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
    <script type="text/javascript">
    	if(<%=month %>!=null){
     		for(var i = 0 ; i < document.myForm.userBm.length; i++){
     			if(<%=month%>==document.myForm.userBm[i].value){
     				document.myForm.userBm[i].selected=true;
     			}
     		}
    	}
    	function update(userId){
    		document.myForm.action = "<%=cp %>/user/delete_user_ok.do?userId="+userId;
    		document.myForm.submit();
    	}
        </script>
</html>