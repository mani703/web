<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String myPath = ".."; %>
	<%@ include file="../template/header.jspf" %>
	<%@ page import="com.mongodb.MongoClient" %>
	<%@ page import="com.mongodb.client.*" %>
	<%@ page import="org.bson.*" %>
	<%@ page import="org.bson.conversions.Bson" %>
	<%@ page import="com.mongodb.client.model.Filters"%>
	<%
	int _id = Integer.parseInt(request.getParameter("id"));
	String title = null;
	String body = null;
	MongoClient client = null;
	try {
		client = new MongoClient();
		
		MongoDatabase db = client.getDatabase("testDB");
		MongoCollection<Document> coll = db.getCollection("dept01");
		Bson filter = Filters.eq("_id", _id);
		MongoCursor<Document> cur = coll.find(filter).iterator();
		if(cur.hasNext()){
			Document doc = cur.next();
			_id = doc.getInteger("_id");
			title = doc.getString("title");
			body = doc.getString("body");
		}
	} finally {
		client.close();
	}
	%>
	
	<h1>DEPT Detail Page</h1>
	
		<table align="center">
			<tr>
				<td width="100" bgcolor="#cccccc" align="center">_id</td>
				<td><input type="text" name="deptno" value="<%=_id %>" readonly></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">title</td>
				<td><input type="text" name="dname" value="<%=title %>" readonly></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">body</td>
				<td><input type="text" name="dname" value="<%=body %>" readonly></td>
			</tr>
			
		</table>
	<%@ include file="../template/footer.jspf" %>
</body>
</html>