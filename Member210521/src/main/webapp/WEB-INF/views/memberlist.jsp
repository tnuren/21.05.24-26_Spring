<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function memberviewAjax(mid) {
		console.log(mid);
		/*
			ajax를 이용하여 id를 컨트롤러로 보냄
			DB에서 해당 id의 정보를 리턴받고 리턴받은 값을 화면에 출력
			json(javascript object notataion) : 데이터형식
		*/
		$.ajax({
			type : 'post',
			url : 'memberviewajax',
			// 'mid' -> 변수 // mid -> 담을 데이터
			data : {'mid' : mid},
			dataType : 'json',
			success : function(result){
				console.log(result);
				console.log(result.mid);
				console.log(result.mpassword);
				console.log(result.mname);
				console.log(result.memail);
				
				var output = "<table>";
				output += "<tr><th>ID</th> <th>PASSWORD</th> <th>NAME</th>";
				output += " <th>EMAIL</th></tr>";
				output += "<tr>";
				output += "<td>"+result.mid+"</td>";
				output += "<td>"+result.mpassword+"</td>";
				output += "<td>"+result.mname+"</td>";
				output += "<td>"+result.memail+"</td>";
				output += "</tr>";
				output += "</table>";
				
				document.getElementById('memberviewdiv').innerHTML = output;  
				
				
				
			},
			error : function(){
				console.log('문제발생');
			}
			
		});
	}
</script>
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
	
	로그인아이디 : ${sessionScope.loginMember}<br>
	
	
<!--  	<c:forEach var="test" items="${dbList}">
		${test} <br>
	</c:forEach>
			-->
			
	
		<table>
			<tr style=color:red;>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>이메일</td>
				<th>상세조회</th>
				<th>삭제</th>
				<th>상세조회(ajax)</th>
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
				<td><button onclick="deletefn('${test.mid}')">삭제</button>
				<td><button onclick="memberviewAjax('${test.mid}')">조회(ajax)</button>			
			</tr>	
			</c:forEach>
		</table>
		
		<!-- ajax로 가져온 상세조회 테이터를 아래 div에 출력 -->
		<div id="memberviewdiv"></div>
		
		
		<script>
		// deletefn(id) = ${test.mid}  같은거다
			function deletefn(id){
				console.log('삭제할아이디' + id);
				location.href="memberdelete?mid="+id;
			}
		</script>	
	
	
	<a href="/member">돌아가기</a>
			
</body>
</html>