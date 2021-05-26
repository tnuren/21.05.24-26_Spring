<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>memberview.jsp</H2>
	<!-- EL (Expression Language) 태그 ($표시로 쓰는거)  jsp에서만 쓸 수 있다. -->
	아이디 : ${result.mid}<br>
	비밀번호 : ${result.mpassword}<br>
	이름 : ${result.mname}<br>
	이메일 : ${result.memail}<br>
	
	<a href="./">홈으로</a>
	<a href="memberlist">list로 돌아가기</a>	
	
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

</body>
</html>