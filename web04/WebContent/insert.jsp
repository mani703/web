<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.model.Collation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mongodb.*"%>
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
<%
int deptno = 0;

try{
	deptno = Integer.parseInt(request.getParameter("deptno"));

	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	String ip = "127.0.0.1";
	int port = 27017;
	MongoClient client = null;
	
	try{
		client = new MongoClient(new ServerAddress(ip, port));
		DB db = client.getDB("testDB");
		DBCollection coll = db.getCollection("dept02");
		
		BasicDBObject doc = new BasicDBObject();
		doc.append("_id", deptno);
		doc.append("dname", dname);
		doc.append("loc", loc);
		coll.insert(doc);
	} finally {
		client.close();
	}
	
	response.sendRedirect("list.jsp");
} catch(NumberFormatException e) {
	//out.println("<h1 align='center'>오류발생</h1>");
	//out.println("<p align='center'>계속된 문제가 발생시 전산관리자(tel 000-0000)에 연락바랍니다.</p>");
	response.sendRedirect("add.jsp?err=number01");
}
%>
<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="grey">Copyright by bitacademy co.ltd</td>
		</tr>
	</table>
</body>
</html>