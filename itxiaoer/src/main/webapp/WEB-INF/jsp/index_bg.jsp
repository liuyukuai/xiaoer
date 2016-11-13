<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE Html>
<html>
<head>
	<head>
		<title>首页</title>
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="static/bootstrap/css/common.css">
		<link rel="stylesheet" href="static/css/main.css">
		<script src="static/bootstrap/js/jquery.1.11.js"></script>
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
	</head>
</head>
<body>
	<div class="container one-column page-home">
    <div class="headband"></div>
    <header id="header" class="header">
	    <div class="header-inner">
	    	<div class="site-meta ">
				<div class="custom-logo-site-title">
				<a href="/" class="brand" rel="start" style="opacity: 1;">
					<span class="logo-line-before"><i></i></span>
					<span class="site-title" style="opacity: 1; top: 0px;">IT小二</span>
					<span class="logo-line-after"><i></i></span>
				</a>
			</div>
		</div>
		<div class="site-nav-toggle">
		  <button>
		    <span class="btn-bar"></span>
		    <span class="btn-bar"></span>
		    <span class="btn-bar"></span>
		  </button>
		</div>
		<nav class="site-nav">
			<ul id="menu" class="menu menu-left">
				<li class="menu-item menu-item-home" style="opacity: 1; transform: translateY(0px);">
					<a href="/" rel="section"><i class="menu-item-icon fa fa-home fa-fw"></i> <br>首页</a>
				</li>
				<li class="menu-item menu-item-categories" style="opacity: 1; transform: translateY(0px);">
					<a href="/categories" rel="section"><i class="menu-item-icon fa fa-th fa-fw"></i> <br>分类</a>
				</li>
				<li class="menu-item menu-item-archives" style="opacity: 1; transform: translateY(0px);">
					<a href="/archives" rel="section"><i class="menu-item-icon fa fa-archive fa-fw"></i> <br>档案</a>
				</li>
				<li class="menu-item menu-item-tags" style="opacity: 1; transform: translateY(0px);">
					<a href="/tags" rel="section"><i class="menu-item-icon fa fa-tags fa-fw"></i> <br>标签</a>
				</li>
				<li class="menu-item menu-item-about" style="opacity: 1; transform: translateY(0px);">
					<a href="/about" rel="section"><i class="menu-item-icon fa fa-user fa-fw"></i> <br>关于我</a>
				</li>
				<li class="menu-item menu-item-search" style="opacity: 1; transform: translateY(0px);">
					<a href="#" class="st-search-show-outputs"><i class="menu-item-icon fa fa-search fa-fw"></i> <br>搜索</a>
				</li>
			</ul>
			<div class="site-search"></div>
		</nav>
	</div>
</header>
<main id="main" class="main">
	<div class="main-inner">
		<div id="content" class="content">
			<section id="posts" class="posts-expand">
				<c:forEach items="${page.content}" var="post">
					<article class="post post-type-normal" style="opacity: 1; display: block; transform: translateY(0px);">
						<header class="post-header">
							<h1 class="post-title" itemprop="name headline">
								<a class="post-title-link" href="${g.domain}/posts/${post.id}">${post.title}</a>
							</h1>
		    				<div class="post-meta">
							<span class="post-time">
								<time itemprop="dateCreated" datetime="${post.createTime}"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd" /></time>
							</span>
							<span class="post-category">
							  	&nbsp; | &nbsp;
								<span itemprop="about">
									<a href="javascript:;;">
										<span itemprop="name">${post.category.name}</span>
									</a>
								</span>
							</span>
							<span class="post-comments-count">
							  &nbsp; | &nbsp;
								<a >
									<span class="post-comments-count disqus-comment-count" data-disqus-identifier="understanding-lstm-network.html" itemprop="commentsCount"></span>
								</a>
							</span>
							&nbsp; | &nbsp;
							<span class="leancloud_visitors" data-flag-title="${post.title}">${post.rcount} 
							&nbsp;阅读
							</span>
							&nbsp; | &nbsp;
							<span class="leancloud_visitors" data-flag-title="${post.title}">${post.rcount}
							&nbsp;评论
							</span>
						</div>
					</header>
	    			<div class="post-body">
	          			${post.excerpt}...
						<div class="post-more-link text-center">
							<a class="btn" href="${g.domain}/posts/${post.id}" rel="contents">阅读全文</a>
						</div>
	    			</div>
				    <footer class="post-footer">
				        <div class="post-eof"></div>
				    </footer>
	  			</article>
	  		</c:forEach>
  		</section>
		<div id="page_nav">
	        <div class="clearfix page">
				<ul class="page-numbers">
					<page:page model="${page}" pageUrl="${request.requestURL}" showPage="9" boundary="2">
						<page:prev>
							<li><a href="${pageUrl}"><<</a></li>
						</page:prev>
						<page:pager>
							<c:choose>
								<c:when test="${dot}">
									<li><span class="dots">…</span></li>
								</c:when>
								<c:when test="${pageNumber==page.pageIndex}">
									<li><span class="current">${pageNumber}</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageUrl}">${pageNumber}</a></li>
								</c:otherwise>
							</c:choose>
						</page:pager>
					<page:next>
						<li><a href="${pageUrl}">>></a></li>
					</page:next>
					</page:page>
				</ul>
	        </div>
      </div>
    </div>
	</div>
	</div>
	<div class="sidebar-toggle">
		<div class="sidebar-toggle-line-wrap">
			<span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
			<span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
			<span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
		</div>
	</div>
	<aside id="sidebar" class="sidebar">
		<div class="sidebar-inner">
			<section class="site-overview sidebar-panel  sidebar-panel-active ">
				<div class="site-author motion-element" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
					<img class="site-author-image" src="/upload/image/avatar.png" alt="Jey Zhang" itemprop="image">
					<p class="site-author-name" itemprop="name">Jey Zhang</p>
				</div>
				<p class="site-description motion-element" itemprop="description">Life is Now.</p>
				<nav class="site-state motion-element">
				<div class="site-state-item site-state-posts">
					<a href="/archives">
						<span class="site-state-item-count">27</span>
						<span class="site-state-item-name">posts</span>
					</a>
				</div>
				<div class="site-state-item site-state-categories">
					<a href="/categories">
						<span class="site-state-item-count">8</span>
						<span class="site-state-item-name">categories</span>
					</a>
				</div>
				<div class="site-state-item site-state-tags">
					<a href="/tags">
						<span class="site-state-item-count">48</span>
						<span class="site-state-item-name">tags</span>
					</a>
				</div>
				</nav>
				<div class="links-of-author motion-element">
				<span class="links-of-author-item">
					<a href="http://www.facebook.com/jeyzhang" target="_blank">
					    <i class="fa fa-globe"></i> facebook
					</a>
				</span>
				<span class="links-of-author-item">
					<a href="http://weibo.com/jerrychang0402" target="_blank">
					    <i class="fa fa-globe"></i> weibo
					</a>
				</span>
				<span class="links-of-author-item">
					<a href="http://www.zhihu.com/people/zhangjieup" target="_blank">
					    <i class="fa fa-globe"></i> zhihu
					</a>
				</span>
				<span class="links-of-author-item">
					<a href="https://github.com/jeyzhang" target="_blank">
					    <i class="fa fa-globe"></i> github
					</a>
				</span>
				</div>
				<div class="links-of-author motion-element">
				    <p class="site-author-name">Links</p>
					<span class="links-of-author-item">
						<a href="http://www.yunaitong.cn" target="_blank">Tong</a>
					</span>
					<span class="links-of-author-item">
						<a href="http://www.wildml.com/" target="_blank">WILDML</a>
					</span>
				</div>
			</section>
		</div>
	</aside>
</main>
<footer id="footer" class="footer">
	<div class="footer-inner">
	<script async="" src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
	<div class="copyright">© 
		<span itemprop="copyrightYear">2016</span>
		<span class="with-love">
			<i class="icon-next-heart fa fa-heart"></i>
		</span>
  		<span class="author" itemprop="copyrightHolder">Jey Zhang</span>
	</div>
	<div class="powered-by">
	  Powered by <a class="theme-link" href="http://hexo.io">Hexo</a>
	</div>
	<div class="theme-info">
	  Theme -
		<a class="theme-link" href="https://github.com/iissnan/hexo-theme-next"> NexT</a>
	</div>
	<span id="busuanzi_container_site_pv" style="display: inline;">
	  &nbsp; | &nbsp;Total visited <span id="busuanzi_value_site_pv">112597</span> times.
	</span>
	</div>
</footer>
<div class="back-to-top"></div>
</div>
</body>
</html>