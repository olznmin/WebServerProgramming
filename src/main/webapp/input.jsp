<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>명함 입력</title>
</head>
<body>
<%
    System.out.println("-------------------------------------");
    
    // 데이터베이스 연결 정보 설정
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String loginid = "system";
    String password = "796796";
    
    // 사용자 입력 값 가져오기
    String id = request.getParameter("txtId");
    String name = request.getParameter("txtName");
    String telNo = request.getParameter("txtTelNo");
    String mail = request.getParameter("txtMail");
    
    System.out.println("txtId : " + id);
    System.out.println("txtName : " + name);
    System.out.println("txtTelNo : " + telNo);
    System.out.println("txtMail : " + mail);
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        // JDBC 드라이버 로드 및 데이터베이스 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, loginid, password);
        
        // PreparedStatement를 사용하여 SQL 쿼리 실행
        if (id != null && !id.isEmpty()) {
            String sql = "INSERT INTO namecard (id, name, telno, mail) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, telNo);
            pstmt.setString(4, mail);
            pstmt.executeUpdate();
%>
<script>
    alert("저장되었습니다.");
</script>
<%
        } else {
%>
<script>
    alert("ID를 입력해주세요.");
</script>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
%>
<script>
    alert("저장 오류 발생. 관리자에게 문의하세요.");
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
<script>
    alert("예기치 않은 오류 발생. 관리자에게 문의하세요.");
</script>
<%
    } finally {
        // 리소스 해제
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!-- 입력 폼 -->
<form action="<%= request.getRequestURI() %>" method="post">
    <table border="1" width="550" height="300">
        <tr align="center">
            <td>ID</td>
            <td><input type="text" name="txtId" size="10" value=""></td>
        </tr>
        <tr align="center">
            <td>이름</td>
            <td><input type="text" name="txtName" size="10" value=""></td>
        </tr>
        <tr align="center">
            <td>폰번호</td>
            <td><input type="text" name="txtTelNo" size="15" value=""></td>
        </tr>
        <tr align="center">
            <td>이메일</td>
            <td><input type="text" name="txtMail" size="30" value=""></td>
        </tr>
    </table>
    <input type="submit" value="입력"/>
</form>
<!-- 홈으로 이동하는 링크 -->
<nav>
    <ul>
        <li><a href="index.jsp">홈으로</a></li>
    </ul>
</nav>
</body>
</html>
