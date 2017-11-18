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
	<title>文章详情</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
<body >
	<span class="mobile btn-mobile-menu"> <i
		class="fa fa-list btn-mobile-menu__icon"></i> <i
		class="fa fa-angle-up btn-mobile-close__icon hidden"></i>
	</span>
	<div class="content-wrapper content-detail">
		<div class="content-wrapper__inner">
			<article class="post-container post-container--single">
				<header class="post-header">
					<div class="post-meta">
						<time datetime="${post.createTime}"
							itemprop="datePublished" class="post-meta__date date"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd" /></time>
						• <span class="post-meta__tags tags">${post.category.name}</span>
					</div>
					<h1 class="post-title">${post.title}</h1>
				</header>
				<section class="post">
					${post.content}
				</section>
			</article>
			<section class="read-more">
				<c:if test="${prev!=null}">
					<div class="read-more-item">
				       <span class="read-more-item-dim">上一篇</span>
				       <h3 class="post-list__post-title post-title"><a href="${prev.id}" title="${prev.title}">${prev.title}</a></h3>
				       <div class="post-list__meta"><time datetime="${prev.createTime}" class="post-list__meta--date date"><fmt:formatDate value="${prev.createTime}" pattern="yyyy-MM-dd" /></time></div> 
				   </div>
			   </c:if>
			   <c:if test="${next!=null}">
					<div class="read-more-item">
				       <span class="read-more-item-dim">下一篇</span>
				       <h3 class="post-list__post-title post-title"><a href="${next.id}" title="${next.title}">${next.title}</a></h3>
				       <div class="post-list__meta"><time datetime="${next.createTime}" class="post-list__meta--date date"><fmt:formatDate value="${next.createTime}" pattern="yyyy-MM-dd" /></time></div>
				   </div>
			   </c:if>
			</section>
			<section class="footer">
				<footer>
					<span>版权所有 IT小二</span>
				</footer>
			</section>
		</div>
	</div>
	<div class="back-to-top"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/highlight.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/velocity.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
</body>
</html>