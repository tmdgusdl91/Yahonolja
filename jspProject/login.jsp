<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  <link rel="stylesheet" href="<%=cp %>/jspProject/css/login.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <style type="text/css">
  	body {
		background-image: url("<%=cp %>/jspProject/image/backg.png");
  	}
 	#fcolor {
	 color: rgb(248,48,156);
	}
  </style>
  <script type="text/javascript">
  	if(${login}){
  		alert("회원가입 성공!");	
  	}
  	if(!${login}){
  		alert("로그인 실패.");
  	}
  </script>
</head>
<body>
<%-- 	<div align="center">
        <div id="header">
          	<img src="<%=cp %>/jspProject/image/logo.jpg" id="logo"/>
        </div>
    </div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <div class="login-form">
    <form action="<%=cp %>/user/login_ok.do" method="post" name="myForm">
      <input type="text" name="userId" class="text-field" placeholder="아이디">
      <input type="password" name="userPw" class="text-field" placeholder="비밀번호">
      <input type="submit" value="로그인" class="submit-btn">
      <input type="button" value="네이버아이디로 로그인" class="submit-btn2">
      <input type="button" value="야호놀자 회원가입" class="submit-btn" onclick="javascript:location.href='<%=cp %>/jspProject/join.jsp';">
    </form>
 
    <div class="links">
      <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
  </div>
</body> --%>

<body>

<!-- 로그인이 되어있다면 main.do 로 리다이렉트 -->
<c:choose>
	<c:when test="${!empty sessionScope.LoginInfo.dto }">
		<% response.sendRedirect(cp + "/user/main.do"); %>
	</c:when>
</c:choose>

	<div align="center">
       <div id="header">
         	<a href="<%=cp %>/user/main.do" > <img src="<%=cp %>/jspProject/image/logo.jpg" width="500" height="115"/> </a>
       </div>
    </div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <div class="login-form">
    <form action="<%=cp %>/user/login_ok.do" method="post" name="myForm">
      <input type="text" name="userId" class="text-field" placeholder="아이디" />
      <input type="password" name="userPw" class="text-field" placeholder="비밀번호" />
      <input type="submit" value="로그인" class="submit-btn" />
      
      <div id="naverIdLogin">
      <script type="text/javascript">
      var naverLogin = new naver.LoginWithNaverId(
    		  {
    			  clientId: "VrLJn_3rFP_9NIbl3KnG",
    			  callbackUrl: "http://127.0.0.1:8080/study/user/naverCallback.do",
    			  isPopup: false, /* 팝업을 통한 연동처리 여부 */
    			  loginButton: {color: "green", type: 3, height: 56} /* 로그인 버튼의 타입을 지정 */
    			  }
    		  );
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	</script>
	</div>
      <input type="button" value="야호놀자 회원가입" class="submit-btn"
      onclick="javascript:location.href='<%=cp %>/user/join.do';">
    </form>
 
    <div class="links">
      <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
  </div>
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