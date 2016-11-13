<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE Html>
<html>
<head>
	<link href="static/css/base.css" rel="stylesheet">
	<link href="static/css/mood.css" rel="stylesheet">
	<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="static/css/common.css">
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<header>
	<div id="logo"><a href="/"></a></div>
	<nav class="topnav" id="topnav">
	 	<a href="/"><span>首页</span><span class="en">Protal</span></a>
	 	<a href="about.html"><span>关于我</span><span class="en">About</span></a>
	 	<a href="newlist.html"><span>慢生活</span><span class="en">Life</span></a>
	 	<a href="moodlist.html"><span>碎言碎语</span><span class="en">Doing</span></a>
	 	<a href="share.html"><span>模板分享</span><span class="en">Share</span></a>
	 	<a href="knowledge.html"><span>学无止境</span><span class="en">Learn</span></a>
	 	<a href="book.html"><span>留言版</span><span class="en">Gustbook</span></a>
	</nav>
</header>
<div class="moodlist">
	<h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">碎言碎语</a></h1>
	<div class="bloglist">
		<c:forEach items="${page.content}" var="post">
			<ul class="arrow_box">
				<div class="sy">
					<img src="static/images/001.png">
					<h3>程序员请放下你的技术情节，与你的同伴一起进步</h3>
					<p>${post.excerpt}...</p>
					<a  href="/" target="_blank" class="readmore"><button type="button" class="btn btn-success">查看详情</button></a>
					<a  href="/" target="_blank" class="readmore"><button type="button" class="btn btn-success">查看详情</button></a>
				</div>
				<span class="dateview">2014-1-1</span>
			</ul>
		</c:forEach>
	</div>
	<div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
</div>
<footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>
