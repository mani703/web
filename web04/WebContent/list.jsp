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
				<h1>List Page</h1>
				<table border="1" width="80%" align="center">
					<tr>
						<td width="100" bgcolor="grey"><a href="list.jsp?by=_id">deptno</a></td>
						<td width="50%" bgcolor="grey"><a href="list.jsp?by=dname">dname</a></td>
						<td bgcolor="grey"><a href="list.jsp?by=loc">loc</a></td>
					</tr>
				
<%
 	String ip = "127.0.0.1";
 	int port = 27017;

 	MongoClient client = new MongoClient(new ServerAddress(ip, port));
 	DB db = client.getDB("testDB");

 	DBCollection coll = db.getCollection("dept02");
 	String keyword = request.getParameter("keyword");
 	if(keyword == null) keyword = "";
 	String by = request.getParameter("by");
 	if(by == null) by = "_id";
 	BasicDBObject orderBy = new BasicDBObject(by, 1);
 	
 	BasicDBObject doc = new BasicDBObject("dname", new BasicDBObject("$regex", keyword));
 	
 	DBCursor cursor = coll.find(doc).sort(orderBy);
 	while (cursor.hasNext()) {
 		DBObject obj = cursor.next();
 		out.println("<tr>");
 		out.print("<td><a href=\"dept.jsp?deptno=" + obj.get("_id") + "\">" + obj.get("_id") + "</a></td>");
 		out.print("<td><a href=\"dept.jsp?deptno=" + obj.get("_id") + "\">" + obj.get("dname") + "</a></td>");
 		out.print("<td><a href=\"dept.jsp?deptno=" + obj.get("_id") + "\">" + obj.get("loc") + "</a></td>");
 		out.println("</tr>");
 	}

 	client.close();
 %>
 				</table>
 				<p>
 					<form>
 						<input type="text" name="keyword">
 						<input type="submit" value="검 색">
 					</form>
 				</p>
 				<p align="center">
 					<a href="add.jsp">[입 력]</a>
 				</p>
  <!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="grey">Copyright bybitacademy co.ltd</td>
		</tr>
	</table>
</body>
</html>