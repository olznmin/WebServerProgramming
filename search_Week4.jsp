<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>명함검색</title>
</head>
<body>

<form action="search.jsp" method="post">
	<input type="text" name="keyword" placeholder="검색어 입력">
	<input type="submit" value="검색">
</form>

<%
//OracleXE 연결 

Connection conn = null; 

String url = "jdbc:oracle:thin:@localhost:1521/xe";
String user = "system";
String password = "796796";

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, password);
    
    //검색어처리
    String keyword = request.getParameter("keyword"); // 'Keyword'를 'keyword'로 수정

    //SQL 쿼리 작성 
    String sql ="SELECT * FROM namecard ";
    if(keyword != null && !keyword.isEmpty()){
        sql += "WHERE name LIKE '%" + keyword + "%' OR telno LIKE '%"+
                keyword +"%' OR mail LIKE '%" + keyword + "%'";
    }

    //Statement 생성 및 실행
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    //검색결과 출력 
    %>
    <table border="1">
        <tr>
            <th>순번</th>
            <th>이름</th>
            <th>폰번호</th>
            <th>메일</th>
        </tr>
        <%
        int count =1;
        while (rs.next()){
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("telno") %></td>
            <td><%= rs.getString("mail") %></td>
        </tr>
        <% 
        }
        rs.close();
        stmt.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (conn != null) try { conn.close(); } catch(SQLException e) {}
    }
    %>
    
    </table>

</body>
</html>
