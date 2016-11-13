<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld"%>
<!DOCTYPE Html>
<html>
<head>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="Cache-Control" content="no-transform">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta name="keywords" content="Hexo,next">
		<link rel="stylesheet" href="static/bootstrap/css/common.css">
		<link rel="stylesheet" type="text/css" href="static/css/jquery.fancybox.css">
		<link type="text/css" rel="stylesheet" href="static/css/embed.default.css">
		<link rel="stylesheet" href="static/css/main.css">
		<link rel="alternate" href="http://ursocute.github.io/atom.xml" title="IT小二" type="application/atom+xml">
		<link rel="shorticon icon" type="image/x-icon" href="http://ursocute.github.io/favicon.ico?v=0.4.5.1">
		<script src="static/js/jquery.min1.10.1.js"></script>
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
	</head>
	
	<script src="./static/js/hm.js"></script>
	<script type="text/javascript" id="hexo.configuration">
		var CONFIG = { scheme: '', sidebar: 'post'};
	</script>
	<title>IT小二️</title>
	<script type="text/javascript" async="" src="static/js/embed.js" charset="UTF-8"></script>
	<style type="text/css"> .fancybox-margin { margin-right: 17px;} </style>
</head>

<body itemscope="" itemtype="http://schema.org/WebPage" lang="zh-Hans">
	<script type="text/javascript">
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script"); 
			hm.src = "//hm.baidu.com/hm.js?f75c9fc55ce711d994ad937b3930c70a";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>

	<div class="container one-column page-home">
		<div class="headband"></div>
		<header id="header" class="header" itemscope="" itemtype="http://schema.org/WPHeader">
			<div class="header-inner">
				<h1 class="site-meta">
					<span class="logo-line-before"><i></i></span> 
					<a href="http://ursocute.github.io/" class="brand" rel="start" style="opacity: 1;"> 
						<span class="logo" style="opacity: 1; top: 0px;"><i class="icon-next-logo"></i></span>
						<span class="site-title" style="opacity: 1; top: 0px; font-size:24">️IT小二</span>
					</a> 
					<span class="logo-line-after"><i></i></span>
					<p></p>
					<p class="site-subtitle" style="opacity: 1; top: 0px; font-size: 13px; color: #999; font-family: initial">I was within and without.</p>
					
				</h1>
				<div class="site-nav-toggle">
					<button>
						<span class="btn-bar"></span> 
						<span class="btn-bar"></span> 
						<span class="btn-bar"></span>
					</button>
				</div>
				<nav class="site-nav">
					<ul id="menu" class="menu ">
						<li class="menu-item menu-item-home" style="opacity: 1; transform: translateY(0px);">
							<a href="http://ursocute.github.io/" rel="section"> 
								<i class="menu-item-icon icon-next-home"></i><br>  
								首页
							</a>
						</li>
						<li class="menu-item menu-item-categories" style="opacity: 1; transform: translateY(0px);">
							<a href="http://ursocute.github.io/categories" rel="section">
								<i class="menu-item-icon icon-next-categories"></i><br> 
								分类
							</a>
						</li>
						<li class="menu-item menu-item-about" style="opacity: 1; transform: translateY(0px);">
							<a href="http://ursocute.github.io/about" rel="section"> 
								<i class="menu-item-icon icon-next-about"></i><br> 
								关于
							</a>
						</li>
						<li class="menu-item menu-item-archives" style="opacity: 1; transform: translateY(0px);">
							<a href="http://ursocute.github.io/archives" rel="section"> 
								<i class="menu-item-icon icon-next-archives"></i><br> 
								归档
							</a>
						</li>
						<li class="menu-item menu-item-tags" style="opacity: 1; transform: translateY(0px);">
							<a href="http://ursocute.github.io/tags" rel="section"> 
								<i class="menu-item-icon icon-next-tags"></i><br> 
								标签
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<main id="main" class="main">
		<div class="main-inner">
			<div id="content" class="content">
				<section id="posts" class="posts-expand">
					<c:forEach items="${page.content}" var="post">
						<article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article" style="opacity: 1; display: block; transform: translateY(0px);">
							<header class="post-header">
								<h1 class="post-title" itemprop="name headline">
									<a class="post-title-link" href="${g.domain}/posts/${post.id}" itemprop="url">${post.title}</a>
								</h1>
								<div class="post-meta">
									<span class="post-time"> 
										发表于 <time datetime="${post.createTime }" > <fmt:formatDate value="${post.createTime}" /></time>
									</span> 
										&nbsp; | &nbsp; 分类于 
									<span  > 
										<a href="#" rel="index"> 
											<span >${post.category.name }</span>
										</a>
									</span> 
									<span class="post-comments-count"> &nbsp; | &nbsp; 
										<a href="http://ursocute.github.io/2016/10/22/passage4/#comments" itemprop="discussionUrl"> 
											<span class="post-comments-count ds-thread-count" >${post.ccount }条评论</span>
										</a>
									</span> 
									<span class="leancloud_visitors" > &nbsp; | &nbsp; 阅读次数 : ${post.rcount }</span>
								</div>
							</header>
							<div class="post-body">
								 <p class="excerpt">${post.excerpt}...<br></p>
								<div class="post-more-link text-center">
									<a class="btn" href="${g.domain}/posts/${post.id}">阅读全文 »  </a>
								</div>
							</div>
							<footer class="post-footer"><div class="post-eof"></div></footer>
						</article>
					</c:forEach>
				</section>
				<nav class="pagination">
					<span class="page-number current">1</span>
					<a class="page-number" href="http://ursocute.github.io/page/2/">2</a>
					<a class="page-number" href="http://ursocute.github.io/page/3/">3</a>
					<a class="extend next" rel="next" href="http://ursocute.github.io/page/2/">»</a>
				</nav>
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
				<section class="site-overview">
					<div class="site-author motion-element" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
						<img class="site-author-image" src="./static/avatar.png" alt="刘愉快" itemprop="image">
						<p class="site-author-name" itemprop="name">刘愉快</p>
					</div>
					<p class="site-description motion-element" itemprop="description">Handsome young men must have something to live on, as well as the plain.</p>
					<nav class="site-state motion-element">
						<div class="site-state-item site-state-posts">
							<a href="http://ursocute.github.io/archives"> 
								<span class="site-state-item-count">24</span> 
								<span class="site-state-item-name">日志</span>
							</a>
						</div>
						<div class="site-state-item site-state-categories">
							<a href="http://ursocute.github.io/categories"> 
								<span class="site-state-item-count">7</span> 
								<span class="site-state-item-name">分类</span>
							</a>
						</div>
						<div class="site-state-item site-state-tags">
							<a href="http://ursocute.github.io/tags"> 
								<span class="site-state-item-count">10</span> 
								<span class="site-state-item-name">标签</span>
							</a>
						</div>
					</nav>
					<div class="feed-link motion-element">
						<a href="http://ursocute.github.io/atom.xml" rel="alternate">
							<i class="menu-item-icon icon-next-feed"></i> RSS
						</a>
					</div>
					<div class="links-of-author motion-element">
						<span class="links-of-author-item"> <a href="http://www.zhihu.com/people/gan-jing-86-70" target="_blank">zhihu</a></span>
						<span class="links-of-author-item"> <a href="http://i.ui.cn/ucenter/140893.html" target="_blank">ui.cn</a></span> 
						<span class="links-of-author-item"> <a href="https://github.com/ursocute" target="_blank">github</a></span> 
						<span class="links-of-author-item"> <a href="http://ursocute.github.io/wanshiqi-s-cv/index.html#/" target="_blank">cv</a></span> 
						<span class="links-of-author-item"> <a href="mailto:ursocute@foxmail.com" target="_blank">e-mail</a></span>
					</div>
					<div class="links-of-author motion-element"></div>
				</section>
			</div>
		</aside>
		</main>

		<footer id="footer" class="footer">
			<div class="footer-inner">
				<div class="copyright"> © &nbsp; 2014 - <span itemprop="copyrightYear">2016</span> 
					<span class="with-love"> <i class="icon-next-heart"></i></span> 
					<span class="author" itemprop="copyrightHolder">刘愉快</span>
				</div>
				<div class="powered-by">由 <a class="theme-link" href="http://hexo.io/">Hexo</a> 强力驱动</div>
				<div class="theme-info">主题 - <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next"> NexT </a></div>
			</div>
		</footer>
		<div class="back-to-top"></div>
	</div>
	
	<script type="text/javascript" src="static/js/index.js"></script>
	<script type="text/javascript">
		var duoshuoQuery = {short_name:"ursocute"};
		(function() {
			var ds = document.createElement('script');
			ds.type = 'text/javascript';ds.async = true;
			ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
			ds.charset = 'UTF-8';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
		})();
	</script>

	<script type="text/javascript" src="./static/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="./static/js/fancy-box.js"></script>
	<script type="text/javascript" src="./static/js/helpers.js"></script>
	<script type="text/javascript" src="./static/js/velocity.min.js"></script>
	<script type="text/javascript" src="./static/js/velocity.ui.min.js"></script>
	<script type="text/javascript" src="./static/js/motion_global.js" id="motion.global"></script>
	<script type="text/javascript" src="./static/js/nav-toggle.js"></script>
	<script type="text/javascript" src="./static/js/fastclick.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function () {
			if (CONFIG.sidebar === 'always') {
				displaySidebar();
			}
			if (isMobile()) {
				FastClick.attach(document.body);
			}
		});
	</script>
	<script type="text/javascript" src="static/js/lazyload.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#posts").find('img').lazyload({
				placeholder: "/images/loading.gif",
				effect: "fadeIn"
			});
		});
	</script>

	<script type="text/javascript">
		function showTime(Counter) {
			var query = new AV.Query(Counter);
			$(".leancloud_visitors").each(function() {
				var url = $(this).attr("id").trim();
				query.equalTo("url", url);
				query.find({
					success: function(results) {
						if (results.length == 0) {
							var content = $(document.getElementById(url)).text() + ': 0';
							$(document.getElementById(url)).text(content);
							return;
						}
						for (var i = 0; i < results.length; i++) {
							var object = results[i];
							var content = $(document.getElementById(url)).text() + ': ' + object.get('time');
							$(document.getElementById(url)).text(content);
						}
					},
					error: function(object, error) {
						console.log("Error: " + error.code + " " + error.message);
					}
				});
			});
		}
	</script>
<div id="ofmeet-extension-installed" style="display: none;"></div></body></html>