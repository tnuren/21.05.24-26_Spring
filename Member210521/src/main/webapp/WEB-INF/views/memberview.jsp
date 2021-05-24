<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>memberview.jsp</H2>
	아이디 : ${result.mid}<br>
	비밀번호 : ${result.mpassword}<br>
	이름 : ${result.mname}<br>
	이메일 : ${result.memail}<br>
	
	<a href="./">홈으로</a>
	<a href="memberlist">list로 돌아가기</a>	

</body>
</html>