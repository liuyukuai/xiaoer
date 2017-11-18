<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-1548659503765106",
	    enable_page_level_ads: true
	  });
	</script>
	<title>首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
</head>
<body>
	<span class="mobile btn-mobile-menu"> <i
		class="fa fa-list btn-mobile-menu__icon"></i> <i
		class="fa fa-angle-up btn-mobile-close__icon hidden"></i>
	</span>
	<header class="panel-cover "
		style="background-image: url(/static/images/background-cover.jpg)">
		<div class="panel-main">
			<div class="panel-main__inner panel-inverted">
				<div class="panel-main__content">
					<a href="<%=basePath%>/blog" class="blog-button">
						<img src="${pageContext.request.contextPath}/static/images/logo.png" class="panel-cover__logo"></a>
						<h1 class="panel-cover__title panel-title">
						<a href="<%=basePath%>/blog" title="IT小二分享平台" class="blog-button">IT小二分享平台</a>
					</h1>
					<span class="panel-cover__subtitle panel-subtitle">talk is cheap, show me your code</span>
					<hr class="panel-cover__divider">
					<p class="panel-cover__description">It worked yesterday.</br>How is that possible?</br>It must be a hardware problem.</br>It works on my machine!</br>Somebody must have changed my code.</br>...</p>
					<hr class="panel-cover__divider panel-cover__divider--secondary">
					<div class="navigation-wrapper">
						<div>
							<nav class="cover-navigation cover-navigation--primary">
								<ul class="navigation">
									<li class="navigation__item"><a href="<%=basePath%>/blog" title="访问博客" class="blog-button">博客</a></li>
									<li class="navigation__item"><a href="<%=basePath %>" target="_blank" title="我的项目">分类</a></li>
									<li class="navigation__item"><a href="<%=basePath %>" target="_blank" title="了解更多关于我">关于</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-cover--overlay cover-slate"></div>
		</div>
	</header>
	<jsp:include page="common/footer.jsp" flush="false" />
</body>
</html>