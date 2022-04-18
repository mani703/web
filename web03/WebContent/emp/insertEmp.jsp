<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//empno=1111&ename=aaaa&job=SALESMAN&mgr=7934&deptno=10
int empno = Integer.parseInt(request.getParameter("empno"));
String ename = request.getParameter("ename");
String job = request.getParameter("job");
int mgr = Integer.parseInt(request.getParameter("mgr"));
int deptno = Integer.parseInt(request.getParameter("deptno"));

String sql = "insert into emp values (" + empno + ", '" + ename + "', '" + job + "', " + mgr + ", now(), 0, null, " + deptno + ")";
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/scott";
String user = "user01";
String password = "1234";

Connection conn = null;
Statement stmt = null;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
} finally {
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
}
response.sendRedirect("list.jsp");
%>
</body>
</html>