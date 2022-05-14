<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/nav.css">
<link rel="stylesheet" type="text/css" href="/css/footer.css">
<style rel="stylesheet" type="text/css">
#section {
	margin-left: 20%;
	width: 79.95%;
}

#section>.wrap {
	border-radius: 40px;
	margin-left: 40px;
	width: 95%;
	background-color: cadetblue;
	height: 200px;
}

#section>.wrap>.title>:nth-child(1) {
	font-size: 80px;
	text-align: center;
}

#section>.wrap>.title>:nth-child(2) {
	margin: 50px 0;
	font-size: 40px;
	text-align: center;
}

#section>.wrap2 {
	margin: 100px auto;
	display: flex;
	justify-content: space-between;
	border: 1px solid black;
	width: 95%;
	height: 200px;
}

#section>.wrap2>.p, .m, .g {
	display: flex;
	margin: 50px;
}

#section>.wrap2>.p>.phone {
	font-size: 30px;
	margin: auto auto;
	padding-left: 25px;
}

#section>.wrap2>.m>.mail {
	font-size: 30px;
	margin: auto auto;
	padding-left: 25px;
}

#section>.wrap2>.g>.github {
	font-size: 30px;
	margin: auto auto;
	padding-left: 25px;
}

#section>.wrap2>.g>.github>a {
	text-decoration: none;
}

#section>.wrap3 {
	padding-top: 50px;
	text-align: center;
}

#section>.wrap3>h2 {
	font-size: 50px;
}

#section>.wrap3>.board {
	margin-top: 80px;
	display: flex;
	justify-content: space-evenly;
}

#section>.wrap3>.board>.table {
	width: 40%;
}

#section>.wrap3>.board>.table, .table tr>th, .table tr>td {
	border: 1px solid black;
	border-collapse: collapse;
	height: 50px;
	line-height: 50px;
}

#section>.wrap3>.board>.table tr>th:nth-child(1) {
	width: 10%;
	font-weight: bold;
	font-size: 15px;
}

#section>.wrap3>.board>.table tr>th:nth-child(2) {
	width: 55%;
	font-weight: bold;
	font-size: 15px;
}

#section>.wrap3>.board>.table tr>th:nth-child(3) {
	width: 20%;
	font-weight: bold;
	font-size: 15px;
}

#section>.wrap3>.board>.table tr>th:nth-child(4) {
	width: 15%;
	font-weight: bold;
	font-size: 15px;
	border: 1px solid black;
}

#section>.wrap3>.board>.table th {
	background-color: gray;
	color: white;
}

#section>.wrap3>.board>.table>tbody>tr>td>a {
	display: block;
	text-decoration: none;
}

#section>.wrap3>.board>form {
	margin: auto 0px;
	width: 400px;
	height: 300px;
	border: 1px solid black;
	background-color: gray;
}

#section>.wrap3>.board>form>h2 {
	margin-top: 30px;
	color: white;
	font-size: 30px;
	font-weight: bold;
}

#section>.wrap3>.board>form>div {
	margin: 30px auto;
}

#section>.wrap3>.board>form>div>label {
	margin-right: 20px;
	display: inline-block;
	width: 65px;
	height: 30px;
	border: 1px solid black;
	background-color: white;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
}

#section>.wrap3>.board>form>div>input {
	display: inline-block;
	border: 1px solid black;
	width: 250px;
	height: 30px;
	padding: 0px;
	margin-bottom: -5px;
}

#section>.wrap3>.board>form>div>button {
	display: inline-block;
	border: 1px solid black;
	width: 50px;
	height: 40px;
	font-size: 15px;
}

#popup{
	position: fixed;
 	width: 100%;
 	height: 100%;
 	background-color: rgba(0,0,0,0.5);
 	left: 0px;
 	top:0px;
}
#popup>div{
	width: 400px;
 	height: 250px;
 	padding: 30px;
 	margin: 200px auto 0px auto;
 	background-color: white;
 	border-radius: 10px;
}
 #popup>div>form>h2{
 	text-align: center;
 	font-size: 30px;
 	font-weight: bold;
}
#popup>div>form>div{
 	text-align: center;
 	margin: 20px 0px;
 	justify-content: space-around;
 	align-content: space-around;
}
#popup>div>form>div:nth-child(2)>label{
 	font-size: 20px;
 	font-weight: bold;
 	padding-right: 35px;
}
#popup>div>form>div:nth-child(3)>label{
 	font-size: 20px;
 	font-weight: bold;
 	padding-right: 35px;
}
#popup>div>form>div:nth-child(4)>label{
 	font-size: 20px;
 	font-weight: bold;
 	padding-right: 15px;
}
#popup>div>form>div>input{
 	height: 25px;
 	width: 250px;
}
#popup>div>form>div>button{
 	display: inline-block;
	border: 1px solid black;
	width: 50px;
	height: 40px;
	font-size: 15px;
	margin: 0px 10px;
}
</style>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/js/blog.js"></script>
<script></script>
<title>man`s blog</title>
</head>
<%@ page import="java.sql.*, com.bit.util.*, java.util.*"%>
<%!Connection conn;
	Statement stmt;
	ResultSet rs;

	// select
	public List<DeptDto> getList() throws SQLException {
		String sql = "select * from dept2 order by deptno desc";
		List<DeptDto> list = new ArrayList<DeptDto>();

		try {
			conn = DBServer.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				DeptDto bean = new DeptDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				list.add(bean);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
%>

<body>
	<!-- nav -->
	<%@ include file="/template/nav.jsp"%>

	<div id="section">
		<div class="wrap">
			<div class="title">
				<div>Contact me</div>
				<div>연락 주시기 바랍니다.</div>
			</div>
		</div>
		<hr style="margin-left: 120px; margin-top: 50px;" width="85%"
			align="left">

		<div class="wrap2">
			<div class="p">
				<img src="/imgs/contact/phone.png">
				<div class="phone">010-4846-2767</div>
			</div>
			<div class="m">
				<img src="/imgs/contact/mail.png">
				<div class="mail">mani703@naver.com</div>
			</div>
			<div class="g">
				<img src="/imgs/contact/github.png">
				<div class="github">
					<a href="https://github.com/mani703">github:click!</a>
				</div>
			</div>
		</div>


		<div class="wrap3">
			<h2>자유게시판</h2>
			<div class="board">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>작성자</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (DeptDto bean : getList()) {
						%>
						<tr>
							<td><a href="#"><%=bean.getDeptno()%></a></td>
							<td><a href="#"><%=bean.getDname()%></a></td>
							<td><a href="#"><%=bean.getLoc()%></a></td>
							<td>
								<form action="delete.jsp?deptno=<%=bean.getDeptno()%>" method="post">
									<button>삭제</button>
								</form>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<form action="add.jsp" method="post">
					<h2>입력</h2>
					<div>
						<label for="loc">내용</label> 
						<input type="text" name="dname" id="dname" placeholder="내용을 입력해 주세요."/>
					</div>
					<div>
						<label for="dname">작성자</label> 
						<input type="text" name="loc" id="loc" placeholder="이름을 입력해 주세요."/>
					</div>
					<div>
						<button>입력</button>
						<button>취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/template/footer.jsp"%>

	<div id="popup">
		<div>
			<form action="update.jsp" method="post">
				<h2>수정</h2>
				<div>
					<label for="deptno">번호</label> 
					<input type="text" name="deptno" id="deptno"/>
				</div>
				<div>
					<label for="dname">내용</label> 
					<input type="text" name="dname" id="dname"/>
				</div>
				<div>
					<label for="loc">작성자</label> 
					<input type="text" name="loc" id="loc" />
				</div>
				<div>
					<button>수정</button>
					<button type="button">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>