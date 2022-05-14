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
        #section{
            margin-left: 20%;
            width: 79.95%;
            text-align: center;
            display: flex;
            align-items: center;
        }
        #section>.name{
            font-size: 60px;
            margin-left: 100px;
            position: relative;
        }
        #section>.name>img{
            border: 1px solid gray;
            border-radius: 50%;
            opacity: 0.6;
            position: absolute;
            z-index: -99;
            left: -90px;
            top: -150px;
            font-size: 80px;
            margin-left: 100px;
        }
        #section>.line{
            margin-left: 80px;
        }
        #section>.line>hr{
            margin-top: 50px;
            height: 850px;
        }
        #section>.admin{
            margin-left: 60px;
        }
        #section>.admin>img{
            border: 2px solid black;
            margin-left: 50px;
            margin: 50px 0px;
        }
        #section>.admin>p{
            font-size: 30px;
            margin: 50px 0px;
        }
        #page{
            margin-left: 20%;
            margin-top: 80px;
        }
        #page>ul{
            list-style: none;
            display: flex;
            justify-content: center;
        }
        #page>ul>li{
            margin: 0px 20px;
            font-size: 20px;
        }
        #page>ul>li>a{
            text-decoration: none;
        }
        </style>
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/blog.js"></script>
    <script></script>
    <title>man`s blog</title>
</head>
<body>
    <!-- nav -->
    <%@ include file="/template/nav.jsp" %>

    <div id="section">
        <div class="name">
            간호사 페이지
            <img src="/imgs/project/function/nurse.png" alt="nurse">
        </div>
        <div class="line">
            <hr>    
        </div>
        <div class="admin">
            <img src="/imgs/project/function/nurse.gif" >
            <p>"환자 등록 및 정보 수정, 내원 이력 조회, 진료비 수납"</p>
        </div>
    </div>

    <div id="page">
        <ul>
            <li><a href="/project/function/admin.jsp">[1]</a></li>
            <li><a href="/project/function/nurse.jsp">[2]</a></li>
            <li><a href="/project/function/doctor.jsp">[3]</a></li>
        </ul>
    </div>

    <!-- footer -->
    <%@ include file="../../template/footer.jsp" %>
</body>
</html>