<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="z" uri="/WEB-INF/tld/function.tld"%>
<%
    String path = request.getContextPath();
	String basePath = request.getContextPath();
%>
<!DOCTYPE Html>
<html>
<head>
<jsp:include page="common/bootstrap.jsp" flush="false" />
</head>
<body style="background-color: #fbfbfb;">
	<div id="login" class="clearfix">
		<c:if test="${msg!=null}">
			<p class="message">${msg}<br></p>
		</c:if>
		<div id="logo">
			<img title="itxiaoer" src="${pageContext.request.contextPath}/static/images/logo.png" />
			<p>
				<a href="<%=basePath%>/" title="不知道自己在哪">← 回到主页</a>
			</p>
		</div>
		<form id="loginform" method="post">
			<input type="hidden" name="CSRFToken" value="${CSRFToken}" />
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="icon-user"></i>
					</div>
					<input type="text" autocomplete="off" class="form-control" 
						name="username" value="${z:cookieValue('un')}"
						placeholder="用户名/邮箱" />
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="icon-key"></i>
					</div>
					<input type="password" autocomplete="off" class="form-control"
						name="password" placeholder="密码" />
				</div>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remeber" />记住我的登录信息</label>
				<button type="submit" class="btn btn-primary" style="margin-left: 40px;">登录</button>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>
