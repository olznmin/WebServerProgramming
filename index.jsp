<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%!
String str1 = "이재민";
String str2 = "안녕하세요 !";
%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav>
	<ul>
		<li><a href="input.jsp">명암입력</a></li>
		<li><a href="search.jsp">명암검색</a></li>
		<li><a href="#">홈으로</a></li>
	</ul>
</nav>

<h2> 만들어 보는 <%= str1 %></h2>
	<p>
		<%
		out.println(str2 + str1 +"입니다. ^^");
		%>
	</p>
</body>
</html>