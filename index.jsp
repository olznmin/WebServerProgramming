<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%!
String str1 = "�����";
String str2 = "�ȳ��ϼ��� !";
%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav>
	<ul>
		<li><a href="input.jsp">����Է�</a></li>
		<li><a href="search.jsp">��ϰ˻�</a></li>
		<li><a href="#">Ȩ����</a></li>
	</ul>
</nav>

<h2> ����� ���� <%= str1 %></h2>
	<p>
		<%
		out.println(str2 + str1 +"�Դϴ�. ^^");
		%>
	</p>
</body>
</html>