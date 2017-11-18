<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld"%>
<%
    String path = request.getContextPath();
    String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
	<script type="text/javascript">
		var CONFIG = { scheme: '', sidebar: 'left'};
	</script>
</head>
<body>
	<span class="mobile btn-mobile-menu">
		<i class="fa fa-list btn-mobile-menu__icon"></i> 
		<i class="fa fa-angle-up btn-mobile-close__icon hidden"></i>
	</span>
	<jsp:include page="../common/author.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="content-wrapper__inner">
			<div class="main-post-list">
				<ol class="post-list">
					 <c:forEach items="${page.content}" var="post">
						 <li>
							<h2 class="post-list__post-title post-title">
								<a href="${g.domain}/posts/${post.id}" title="${post.title}" target="_blank">${post.title }</a>
							</h2>
							<p class="excerpt">${post.excerpt}...…</p>
							<div class="post-list__meta">
								<time datetime="${post.createTime}" class="post-list__meta--date date"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd" /></time>
								• <span class="post-list__meta--tags tags">${post.category.name }</span>
								• <span class="post-list__meta--tags tags"><i class="eye-icon"></i>&nbsp;${post.rcount }</span>
								<a class="btn-border-small" href="${g.domain}/posts/${post.id}" target="_blank">继续阅读</a>
							</div>
							<hr class="post-list__divider">
						</li>
					 </c:forEach>
				</ol>
				<hr class="post-list__divider ">
				<nav class="pagination" role="navigation">
					<c:if test="${page.pageIndex > 1 }">
						<c:if test="${page.pageIndex < 3}">
							<a class="newer-posts pagination__newer btn-post btn-small btn-tertiary" href="${g.domain}/blog">← 上一页</a>					
						</c:if>
						<c:if test="${page.pageIndex > 2}">
							<a class="newer-posts pagination__newer btn-post btn-small btn-tertiary" href="${g.domain}/blog/${page.pageIndex-1}">← 上一页</a>					
						</c:if>
					</c:if>
					<span class="pagination__page-number">${page.pageIndex}/${page.totalPage}</span>
					<c:if test="${page.pageIndex != page.totalPage }">
						<a class="older-posts pagination__older btn-post btn-small btn-tertiary" href="${g.domain}/blog/${page.pageIndex+1}">下一页   →</a>
					</c:if>
				</nav>
			</div>
			<jsp:include page="../common/footer.jsp" flush="false" />
		</div>
	</div>
	<div class="sidebar-toggle">
		<div class="sidebar-toggle-line-wrap">
			<span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
			<span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
			<span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
		</div>
	</div>
	<div class="back-to-top"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/analytics.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/highlight.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/helpers.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/velocity.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/velocity.ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/motion_global.js"></script>
</body>
</html>