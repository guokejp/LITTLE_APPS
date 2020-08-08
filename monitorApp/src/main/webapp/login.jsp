<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>智慧校园视频监控管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="shortcut icon" href="public/images/logo.png">
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="views/admin/css/login.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="loginHeaderContainer">
                    <a class="loginLogo" href="login.jsp">
                        <img src="views/admin/images/login/logoLogin.png" alt="">
                        <span class="logoText">智慧校园视频监控管理系统</span>
                    </a>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="loginBodyContainer">
                    <div class="loginFormContainer">
                        <div class="loginBodyTitle">
                            <span class="titleText">用户登录</span>
                        </div>
                        <form class="loginFormBox">
                            <div class="clearfix loginInputBox loginInputName">
                                <label class="loginBtnBox" for="email"><span class="glyphicon glyphicon-user"></span><span class="line"></span></label>
                                <input type="email" class="pull-left" id="email" placeholder="请输入用户名">
                            </div>
                            <div class="clearfix loginInputBox loginInputPwd">
                                <label class="loginBtnBox" for="password"><span class="glyphicon glyphicon-lock"></span><span class="line"></span></label>
                                <input type="password" class="pull-left" id="password" placeholder="请输入密码">
                            </div>
                            <div class="loginSubmitBox">
                                <div class="text-center">
                                    <button type="button" class="btn gui-btn-ok" id="submit_btn">&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="loginFootContainer">
                    <div class="loginCopyRight text-center"></div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var ROOTPATH = '<%=basePath %>';
    </script>
    <script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="public/js/tooltips.js"></script>
    <script type="text/javascript" src="public/js/login.js"></script>
</body>
</html>
