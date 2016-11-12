package com.itxiaoer.service.security;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

/**
 * 登录回调页面控制
 * 
 * @author liuyk
 *
 */
@Component
public class LoginUrlEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		String url = request.getRequestURL().toString();
		Map<String, String[]> parameterMap = request.getParameterMap();
		if (StringUtils.isBlank(url)) {
			url = "/";
		}
		if (parameterMap != null && !parameterMap.isEmpty()) {
			Set<Entry<String, String[]>> entrySet = parameterMap.entrySet();
			for (Entry<String, String[]> entry : entrySet) {
				String[] value = entry.getValue();
				String v = "";
				if (value != null) {
					v = StringUtils.join(value, ",");
				}

				if (url.indexOf("?") == -1) {
					url += "?" + entry.getKey() + "=" + v;
				} else {
					url += "&" + entry.getKey() + "=" + v;
				}
			}
		}
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
		response.sendRedirect(basePath + "/login?return_url=" + URLEncoder.encode(url, "UTF-8"));
	}
}
