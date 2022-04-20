<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Collation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" align="center" cellspacing="0">
		<tr>
			<td colspan="5"><img src="imgs/logo.jpg"></td>
		</tr>
		<tr>
			<td bgcolor="grey"></td>
			<td bgcolor="grey" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
			<td bgcolor="grey" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="grey" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="grey"></td>
		</tr>
		<tr>
			<td colspan="5">
				<!-- content start -->
				<h1>Mysql List</h1>
				<table border="1" width="80%" align="center">
					<tr>
						<td width="100" bgcolor="grey"><a href="list2.jsp?by=deptno">deptno</a></td>
						<td width="50%" bgcolor="grey"><a href="list2.jsp?by=dname">dname</a></td>
						<td bgcolor="grey"><a href="list2.jsp?by=loc">loc</a></td>
					</tr>
					<%
String keyword = request.getParameter("keyword");
if(keyword == null) keyword = "";					
String by = request.getParameter("by");
if(by == null) by = "deptno";					

String sql = "select * from dept where dname like '%" + keyword + "%' order by " + by;
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/scott";
String user = "user01";
String password = "1234";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
					</tr>
					<%
	}
} finally {
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
}
					%>
				</table>
				<p>
 					<form>
 						<input type="text" name="keyword">
 						<input type="submit" value="검 색">
 					</form>
 				</p>
				<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="grey">Copyright by bitacademy co.ltd</td>
		</tr>
	</table>
</body>
</html>