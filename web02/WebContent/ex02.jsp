<%@ page info="out class" %>
<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<% // 스크립트릿 - 자바코드 - in main
	a=12324;
	%>
	
	<%! // 선언부 - 메서드 정의 부분 - in class, out main
	private int a=1234;
	
	static class Inner1{}
	class Inner2{}
	
	public Date func(){
		System.out.println("메서드 호출");
		return new Date();
	}
	
	public void func1(){}
	%>

<body>
	<h1>jsp 첫페이지</h1>
	<%=a %> <br>
	<%=new Inner2() %>
	
</body>
</html>