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
<table width="800" align="center" bgcolor="white">
	<tr>
		<td><img alt="" src="../imgs/logo.jpg"></td>
	</tr>
	<tr>
		<td bgcolor="grey" align="center">
			<a href="../index.jsp">[HOME]</a>
			<a href="dept/list.jsp">[DEPT]</a>
			<a href="../emp/list.jsp">[EMP]</a>
		</td>
	</tr>
	<tr>
		<td>
			<!-- content start -->
			<h1>DEPT List</h1>
			<table width="500" align="center">
				<tr>
					<td>deptno</td>
					<td>dname</td>
					<td>loc</td>
				</tr>
				<%@ page import="com.mongodb.*" %>
				<%
				// default 정보의 경우만
				//Mongo mongo = new MongoClient();
				//DB db = mongo.getDB("testDB");
				// DBCollection coll = db.getCollection("dept02");
				
				MongoClient client = new MongoClient();
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
					<td><%=obj.get("_id") %></td>
					<td><%=obj.get("dname") %></td>
					<td><%=obj.get("loc") %></td>
				</tr>
				<%
				}
				client.close();
				%>
			</table>
			<!-- content end -->
		</td>
	</tr>
	<tr>
		<td bgcolor="#cccccc" align="center">
		Copyright by bitacademy co.ltd
		</td>
	</tr>
</table>
</body>
</html>