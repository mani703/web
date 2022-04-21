<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#dddddd">
<%
String myPath="..";
%>
		<%@ include file="../template/header.jspf" %>
			<!-- content start -->
			<h1>DEPT List</h1>
			<table width="500" align="center" border="1">
				<tr>
					<th>deptno</th>
					<th>dname</th>
					<th>loc</th>
				</tr>
				<%@ page import="com.mongodb.*" %>
				<%
				// default 정보의 경우만
				//Mongo mongo = new MongoClient();
				//DB db = mongo.getDB("testDB");
				// DBCollection coll = db.getCollection("dept02");
				
				MongoClient client = new MongoClient();
				try {
					MongoDatabase db = null;
					db = client.getDatabase("testDB");
					MongoCollection<Document> coll = null;
					coll = db.getCollection("dept02");
					
					FindIterable<Document> ite = coll.find();
					MongoCursor<Document> cursor = ite.iterator();
					while(cursor.hasNext()) {
						 Document obj = cursor.next();	
					%>
					<tr>
						<td><%=obj.getInteger("_id", 0) %></td>
						<td><%=obj.getString("dname") %></td>
						<td><%=obj.getString("loc") %></td>
					</tr>
					<%
					}
				} finally {
					client.close();
				}
				%>
			</table>
			<p align="center"><a href="add.jsp">[입 력]</a></p>
		<%@ include file="../template/footer.jspf" %>
</body>
</html>