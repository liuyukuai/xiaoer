package com.itxiaoer.core;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/**
 * 
 * 常量类
 * 
 * @author liuyk
 *
 */
public final class Constants {
	private Constants() {
	}

	/**
	 * 程序默认字符集
	 */
	public static final Charset ENCODING_UTF_8 = StandardCharsets.UTF_8;
	/**
	 * 定义统一Locale.CHINA,程序中所有和Locale相关操作均默认使用此Locale
	 */
	public static final Locale LOCALE_CHINA = Locale.CHINA;

	public static final String COOKIE_CONTEXT_ID = "c_id";

	public static final String COOKIE_USER_NAME = "un";

	/**
	 * csrf表单提交token名称
	 */
	public static final String CSRF_TOKEN = "CSRFToken";
	/**
	 * csrf的cookie名称
	 */
	public static final String COOKIE_CSRF_TOKEN = "x-csrf-token";

	public static class Role {
		public static final String ADMIN = "ROLE_ADMIN";
		public static final String COMMON = "ROLE_COMMON";
	};

}
