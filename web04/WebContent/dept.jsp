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
				int deptno = Integer.parseInt(request.getParameter("deptno"));
				String dname = "-";
				String loc = "-";
				String ip = "127.0.0.1";
				int port = 27017;
				
				MongoClient client = null;
				try {
					client = new MongoClient(ip, port);
					DB db = client.getDB("testDB");
					DBCollection coll = db.getCollection("dept02");
					
					BasicDBObject doc = new BasicDBObject();
					doc.put("_id", deptno);
					DBCursor cursor = coll.find(doc);
					if(cursor.hasNext()) {
						DBObject result = cursor.next();
						deptno = Integer.parseInt(result.get("_id").toString());
						dname = result.get("dname").toString();
						loc = result.get("loc").toString();
					}
				} finally {
					client.close();
				}
				%>
				
				<h1 align="center">Detail Page</h1>
				<table align="center">
					<tr>
						<td bgcolor="gray" align="center" width="100">deptno</td>
						<td><%=deptno %></td>
					</tr>
					<tr>
						<td bgcolor="gray" align="center" width="100">dname</td>
						<td><%=dname %></td>
					</tr>
					<tr>
						<td bgcolor="gray" align="center" width="100">loc</td>
						<td><%=loc %></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="edit.jsp?deptno=<%=deptno%>">[수 정]</a>
							<a href="delete.jsp?deptno=<%=deptno%>">[삭 제]</a>
						</td>
					</tr>
				</table>
				<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="grey">Copyright by bitacademy co.ltd</td>
		</tr>
	</table>
</body>
</html>