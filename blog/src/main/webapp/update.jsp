<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*, com.bit.util.*, java.util.*"%>
<%!Connection conn;
	Statement stmt;
	ResultSet rs;

	public void updateOne(int deptno, String dname, String loc) throws SQLException {
		String sql = "update dept2 set dname='" + dname + "', loc='" + loc + "' where deptno=" + deptno;
		
		try {
			conn = DBServer.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
%>

<%
request.setCharacterEncoding("utf-8");

if (request.getMethod().equals("POST")) {
	int deptno = Integer.parseInt(request.getParameter("deptno").trim());
	String dname = request.getParameter("dname").trim();
	String loc = request.getParameter("loc").trim();

	updateOne(deptno, dname, loc);
	response.sendRedirect("./contact.jsp");
}
%>
</body>
</html>