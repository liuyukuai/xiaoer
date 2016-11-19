<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>管理员后台</title>
<link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/Font-Awesome-3.2.1/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/backend.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/backend/zblog.admin.js"></script>