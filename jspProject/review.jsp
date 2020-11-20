<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호 텔 리 뷰</title>
<script type="text/javascript">
	function sendIt(){
		var f = document.myForm;
		f.action="<%=cp %>/rev/review_ok.do";
		f.submit();
	}
	function cancle(){
		var f = document.myForm;
		f.action="<%=cp %>/rev/cancle_ok.do";
		f.submit();
	}

</script>
</head>
<body>
<form action="" method="post" name="myForm">
<table width="344" border="2" cellpadding="0" cellspacing="0" 
	bordercolor="#dddddd" align="center">
	<tr height="40">
		<td bgcolor="#dddddd" align="center">
			<font color="#000000"> <b>리뷰쓰기</b> </font> <br/>
		</td>
	</tr>
</table>



<table align="center" style="padding-top: 10px;">
<tr>
	<td rowspan="2">
	<input type="hidden" name="userId" value="${sessionScope.LoginInfo.dto.userId }"/>
	<input type="hidden" name="hnum" value="${dto.hnum }"/>
	<img width="150" height="110" src="${resourcePath }/img/${hnum }/0/${plist.get(0)}" alt="">
	</td>
	
	<td align="center"> <font size="5px;" color="#000000"> &nbsp;${dto.hname } </font> </td>
</tr>


<tr>
	<td align="center"> <font size="2px;" color="#000000">  <br/> </font> </td>
</tr>


<tr>
	<td colspan="2" height="1" bgcolor="#dddddd" align="center"> </td>
</tr>


<tr>
	<td align="right" style="padding-top: 10px; padding-bottom: 10px;"> 숙박은 만족하셧나요? </td>
	
	<td style="padding-top: 10px; padding-bottom: 10px;">
		<select name="score" >
		<option value="1">1점</option>
		<option value="2">2점</option>
		<option value="3">3점</option>
		<option value="4">4점</option>
		<option value="5">5점</option>
		<option value="6">6점</option>
		<option value="7">7점</option>
		<option value="8">8점</option>
		<option value="9">9점</option>
		<option value="10" selected="selected">10점</option>
		</select>
	</td>
</tr>

<tr>
	<td colspan="2" height="1" bgcolor="#dddddd" align="center"> </td>
</tr>

</table>

<table align="center">

<tr align="center">
	<td style="padding-top: 10px;">
	<textarea id="reviwe" name="userMemo" rows="5" cols="46" placeholder="리뷰를 입력하세요."></textarea>
	</td>
</tr>

<tr>
	<td style="padding-top: 10px;"> <font color="#FF0000;" size="1pt;"> 
	* 본 상품과 무관한 허위사실 유포 및 이유없는 욕설 댓글작성시 삭제될수도 있습니다. 
	</font> </td>
</tr>

</table>



<!-- 버튼 테이블  -->

<table align="center">
<tr>
	<td style="padding-top: 10px;"> <input type="button" value="작성하기" onclick="sendIt()"/> </td>
	<td style="padding-top: 10px;"> <input type="button" value="취소하기" onclick="cancle()"/> </td>
</tr>
</table>

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
</html>