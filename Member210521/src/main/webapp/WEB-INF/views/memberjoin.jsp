<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<!-- 액션 => memberjoin으로 보내준다. -->
	<form action ="memberjoin" method="post">
		아이디 : <input type="text" name="mid"><br> 				
		비밀번호 : <input type="text" name="mpassword"><br>				
		이름 : <input type="text" name="mname"><br>		
		이메일 : <input type="text" name="memail"><br>
		<input type="submit" value="전송">
	</form>
	
</body>


</html>