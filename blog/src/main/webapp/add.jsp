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
	public void insertOne(DeptDto bean) throws SQLException {
		String sql = "insert into dept2(dname, loc) values('" + bean.getDname() + "', '" + bean.getLoc() + "')";

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
	String dname = request.getParameter("dname").trim();
	String loc = request.getParameter("loc").trim();

	DeptDto bean = new DeptDto();
	bean.setDname(dname);
	bean.setLoc(loc); 

	insertOne(bean);
	response.sendRedirect("./contact.jsp");
}
%>

</body>
</html>