<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="org.bson.*" %>
<%@ page import="org.bson.conversions.Bson" %>
<%@ page import="com.mongodb.client.model.Filters"%>
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
					<th>id</th>
					<th>title</th>
				</tr>
				
				<%			
				MongoClient client = new MongoClient();
				int p = 1; // 현재 페이지
				int totalPage = 0;
				
				String keyword = request.getParameter("keyword");
				if(keyword == null) keyword = "";
				
				String option = request.getParameter("option");
				if(option == null) option = "title";
				
				try {
					p = Integer.parseInt(request.getParameter("p"));
				} catch(NumberFormatException e) {}
				
				try {
					MongoDatabase db = null;
					db = client.getDatabase("testDB");
					MongoCollection<Document> coll = null;
					coll = db.getCollection("dept01");
					
					Bson filter = Filters.regex(option, keyword);
					totalPage = (int)Math.ceil(coll.countDocuments(filter)/10.0);
					FindIterable<Document> ite = coll.find(filter).skip(10*(p-1)).limit(10);
					MongoCursor<Document> cursor = ite.iterator();
		
					while(cursor.hasNext()) {
						 Document obj = cursor.next();	
					%>								
					<tr>
						<td><a href="detail.jsp?id=<%=obj.getInteger("_id", 0) %>"><%=obj.getInteger("_id", 0) %></a></td>
						<td><a href="detail.jsp?id=<%=obj.getInteger("_id", 0) %>"><%=obj.getString("title") %></a></td>
					</tr>
					<%
					}
				} finally {
					client.close();
				}
				%>
					
			</table>
			<div align="center">
				<form>
					<select name="option">
						<option value="title">제목</option>
						<option value="body">내용</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="입 력">
					<input type="reset" value="취 소">
				</form>		
			</div>
			<div align="center">
			<!-- page -->	
			<%
            for(int i=0; i<totalPage; i++){
				String pages = (i+1) + "";
			%>
				<a href="list.jsp?p=<%=pages %>&option=<%=option %>&keyword=<%=keyword%>"><%=pages %></a>&nbsp
			<%
			}
			%>
			</div>
			
		<%@ include file="../template/footer.jspf" %>
</body>
</html>