<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	table , tr , td , th {
		border: 1px black solid;
		border-collapse : collapse;
		padding : 5px;
		text-align: center; 
	}
	
</style>


</head>
<body>
	<H2>memberlist.jsp</H2>
	
<!--  	<c:forEach var="test" items="${dbList}">
		${test} <br>
	</c:forEach>
			-->
			
	<div>
		<table>
			<tr style=color:red;>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>이메일</td>
				<th>상세조회</th>
			</tr>
		<!-- addobject(service) => items -->
			<c:forEach var="test" items="${dbList}">			
			<tr>
				<td>${test.mid}</td>
				<td>${test.mpassword}</td>
				<td>${test.mname}</td>
				<td>${test.memail}</td>
				<!-- 조회 링크를 클릭하면 memberview.jsp에 해당 회원의 정보만 출력 -->
				<td><a href="memberview?mid=${test.mid}">조회</a>
				<!-- http://localhost:8081/member/memberview?mid=a
								memberview 라는 주소를 요청하면서 mid 파라미터에 a를 담아서 간다. -->
			</tr>	
			</c:forEach>
		</table>
	</div>
	<a href="/member">돌아가기</a>
			
</body>
</html>