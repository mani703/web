<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*, com.bit.util.*, java.util.*"%>
<%!Connection conn;
	Statement stmt;
	ResultSet rs;

	// insert
	public void deleteOne(int deptno) throws SQLException {
		String sql = "delete from dept2 where deptno = " + deptno;

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

	deleteOne(deptno);
	response.sendRedirect("./contact.jsp");
}
%>
</body>
</html>