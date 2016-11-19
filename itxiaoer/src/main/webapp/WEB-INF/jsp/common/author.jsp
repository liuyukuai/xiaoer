<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<header id="sidebar" class="panel-cover  sidebar sidebar-active panel-cover--collapsed" style="background-image: url(../static/images/background-cover.jpg)">
	<div class="panel-main">
		<div class="panel-main__inner panel-inverted">
			<div class="panel-main__content">
				<a href="<%=basePath %>/blog" title="前往主页" class="blog-button">
				<img src="${pageContext.request.contextPath}/static/images/avatar.jpg" width="80" class="panel-cover__logo logo"></a>
				<h1 class="panel-cover__title panel-title">
					<a href="<%=basePath %>/blog" title="快乐的鱼摆摆" class="blog-button">快乐的鱼摆摆</a>
				</h1>
				<span class="panel-cover__subtitle panel-subtitle">I was within and without.</span>
				<hr class="panel-cover__divider">
				<p class="panel-cover__description">Handsome young men must have something to live on, as well as the plain.</p>
				<hr class="panel-cover__divider panel-cover__divider--secondary">
				<div class="navigation-wrapper">
					<div>
						<nav class="cover-navigation cover-navigation--primary">
							<ul class="navigation">
								<li class="navigation__item"><a href="<%=basePath %>/blog" title="访问博客" class="blog-button">博客</a></li>
								<li class="navigation__item"><a href="<%=basePath %>" target="_blank" title="我的项目">项目</a></li>
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