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
				<h1>Insert Page</h1>
				<%
				String errMsg = "";
				String param = request.getParameter("err");
				if(param != null){
					if(param.equals("number01")) errMsg = "숫자를 입력하세요";
				}
				%>
				
				<form action="insert.jsp">
					<table align="center" cellspacing="10">
						<tr>
							<td>deptno</td>
							<td><input type="text" name="deptno"><%=errMsg %></td>
						</tr>
						<tr>
							<td>dname</td>
							<td><input type="text" name="dname"></td>
						</tr>
						<tr>
							<td>loc</td>
							<td><input type="text" name="loc"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="submit" value="입 력">
								<input type="reset" value="취 소">
							</td>
							<td></td>
						</tr>
					</table>
				</form>
  <!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="grey">Copyright bybitacademy co.ltd</td>
		</tr>
	</table>
</body>
</html>