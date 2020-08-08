<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>异常错误</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <!-- Bootstrap -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>


    <style>
        body {
            background: #ebebeb;
            font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei", "\9ED1\4F53", Arial, sans-serif;
            color: #3a3a3a;
            font-size: 12px;
        }
        * {
            padding: 0px;
            margin: 0px;
        }

    </style>

</head>

<body>
    <div class="container">
        <div class="" style="margin: 200px auto;">
            <h1 class="text-center">500 ERROR</h1>
        </div>
    </div>
</body>
</html>
