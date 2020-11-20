<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Naver Login </title>

</head>
<body>

	<!-- 로그인이 되어있다면 main.do 로 리다이렉트 -->
	<c:choose>
		<c:when test="${!empty sessionScope.LoginInfo.dto }">
			<% response.sendRedirect(cp + "/user/main.do"); %>
		</c:when>
	</c:choose>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{YOUR_CLIENT_ID}",
				callbackUrl: "{YOUR_REDIRECT_URL}",
				isPopup: false,
				callbackHandle: true
			}
		);

		naverLogin.init();

		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					var email = naverLogin.user.getEmail();
					var name = naverLogin.user.getNickName();
					var profileImage = naverLogin.user.getProfileImage();
					var birthday = naverLogin.user.getBirthday();			
					var uniqId = naverLogin.user.getId();
					var age = naverLogin.user.getAge();
					
					window.location.replace("http://" + window.location.hostname + 
							( (location.port==""||location.port==undefined)?"":":" + location.port) +
							"/study/user/session.do?email=" + email + 
									"&name=" + name +
									"&birthday=" + birthday +
									"&uniqId=" + uniqId + 
									"&age=" + age +
									"&profileImage=" + profileImage);

					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>


</html>