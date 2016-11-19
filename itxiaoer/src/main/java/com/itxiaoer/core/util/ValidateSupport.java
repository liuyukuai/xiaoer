package com.itxiaoer.core.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;

import com.itxiaoer.core.plugin.PageModel;

/**
 * 公共支持类
 * 
 * @author liuyk
 *
 */
public class ValidateSupport {

	private static Logger logger = Logger.getLogger(ValidateSupport.class);

	/**
	 * 拷贝集合对象
	 */
	public <T, R> List<R> result(Class<R> clazz, List<T> src) {
		if (src == null) {
			return null;
		}
		List<R> rs = new ArrayList<R>();
		try {
			for (T t : src) {
				R r = clazz.newInstance();
				BeanUtils.copyProperties(t, r);
				rs.add(r);
			}
		} catch (InstantiationException e) {
			logger.error("拷贝对象失败", e);
		} catch (IllegalAccessException e) {
			logger.error("拷贝对象失败", e);
		}
		return rs;
	}

	/**
	 * 拷贝单个对象
	 */
	public <T, R> R result(Class<R> clazz, T src) {
		if (clazz == null) {
			return null;
		}
		if (src == null) {
			return null;
		}
		try {
			R r = clazz.newInstance();
			BeanUtils.copyProperties(src, r);
			return r;
		} catch (InstantiationException e) {
			logger.error("拷贝对象失败", e);
		} catch (IllegalAccessException e) {
			logger.error("拷贝对象失败", e);
		}
		return null;
	}

	public static int processLimit(String limit) {
		if (StringUtils.isBlank(limit)) {
			return 1;
		}
		try {
			int parseInt = Integer.parseInt(limit);
			return parseInt < 1 ? 1 : (parseInt > Integer.MAX_VALUE ? 1 : parseInt);
		} catch (Exception e) {
			return 1;
		}
	}

	public static int processPageSize(String page) {
		if (StringUtils.isBlank(page)) {
			return PageModel.PAGE_SIZE;
		}
		try {
			int parseInt = Integer.parseInt(page);
			return parseInt < 0 ? PageModel.PAGE_SIZE : (parseInt > Integer.MAX_VALUE ? PageModel.PAGE_SIZE : parseInt);
		} catch (Exception e) {
			return PageModel.PAGE_SIZE;
		}
	}

	public static String process(byte[] bytes) {
		if (bytes == null || bytes.length == 0) {
			return "";
		}

		try {
			return new String(bytes, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}

	public static byte[] process(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}

		try {
			return str.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
