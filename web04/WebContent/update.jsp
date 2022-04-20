<%@page import="com.mongodb.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int deptno = Integer.parseInt(request.getParameter("deptno"));
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

MongoClient client = null;

try {
	client = new MongoClient("127.0.0.1", 27017);
	BasicDBObject doc = new BasicDBObject();
	doc.append("dname", dname);
	doc.append("loc", loc);
	client.getDB("testDB")
		.getCollection("dept02")
		.update(new BasicDBObject("_id", deptno), new BasicDBObject("$set", doc));
} finally {
	client.close();
}
response.sendRedirect("list.jsp");
%>

</body>
</html>