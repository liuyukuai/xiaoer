package com.itxiaoer.web.backend.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.itxiaoer.biz.OptionManager;
import com.itxiaoer.biz.PostManager;
import com.itxiaoer.core.dal.constants.PostConstants;
import com.itxiaoer.core.dal.entity.Post;
import com.itxiaoer.core.plugin.MapContainer;
import com.itxiaoer.core.plugin.PageModel;
import com.itxiaoer.core.util.JsoupUtils;
import com.itxiaoer.core.util.PostTagHelper;
import com.itxiaoer.core.util.StringUtils;
import com.itxiaoer.core.util.ValidateSupport;
import com.itxiaoer.service.CategoryService;
import com.itxiaoer.service.PostService;
import com.itxiaoer.service.vo.PostVO;
import com.itxiaoer.web.backend.form.validator.PostFormValidator;
import com.itxiaoer.web.support.WebContextFactory;

@Controller(value = "adminPostController")
@RequestMapping("/backend/posts")
@RequiresRoles(value = { "admin", "editor" }, logical = Logical.OR)
public class PostController {
	@Autowired
	private PostManager postManager;
	@Autowired
	private OptionManager optionManager;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PostService postService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		PageModel<PostVO> pageModel = postManager.listPost(page, 15);
		model.addAttribute("page", pageModel);
		model.addAttribute("categorys", categoryService.list());
		return "backend/post/list";
	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public Object insert(Post post, String tags) {
		MapContainer form = PostFormValidator.validatePublish(post);
		if (!form.isEmpty()) {
			return form.put("success", false);
		}

		post.setId(optionManager.getNextPostid());
		post.setCreator(WebContextFactory.get().getUser().getId());
		post.setCreateTime(new Date());
		post.setLastUpdate(post.getCreateTime());

		/* 由于加入xss的过滤,html内容都被转义了,这里需要unescape */
		String content = HtmlUtils.htmlUnescape(post.getContent());
		post.setContent(ValidateSupport.process(JsoupUtils.filter(content)));
		String cleanTxt = JsoupUtils.plainText(content);
		post.setExcerpt(cleanTxt.length() > PostConstants.EXCERPT_LENGTH
				? cleanTxt.substring(0, PostConstants.EXCERPT_LENGTH) : cleanTxt);

		postManager.insertPost(post, PostTagHelper.from(post, tags, post.getCreator()));
		return new MapContainer("success", true);
	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.PUT)
	public Object update(Post post, String tags) {
		MapContainer form = PostFormValidator.validateUpdate(post);
		if (!form.isEmpty()) {
			return form.put("success", false);
		}

		/* 由于加入xss的过滤,html内容都被转义了,这里需要unescape */
		String content = HtmlUtils.htmlUnescape(post.getContent());
		post.setContent(ValidateSupport.process(JsoupUtils.filter(content)));
		String cleanTxt = JsoupUtils.plainText(content);
		post.setExcerpt(cleanTxt.length() > PostConstants.EXCERPT_LENGTH
				? cleanTxt.substring(0, PostConstants.EXCERPT_LENGTH) : cleanTxt);

		post.setType(PostConstants.TYPE_POST);
		post.setLastUpdate(new Date());
		postManager.updatePost(post, PostTagHelper.from(post, tags, WebContextFactory.get().getUser().getId()));
		return new MapContainer("success", true);
	}

	@ResponseBody
	@RequestMapping(value = "/fast", method = RequestMethod.PUT)
	public Object fast(Post post, String tags) {
		MapContainer form = PostFormValidator.validateFastUpdate(post);
		if (!form.isEmpty()) {
			return form.put("success", false);
		}

		Post old = postService.loadById(post.getId());
		if (old == null) {
			return form.put("success", false).put("msg", "非法请求");
		}

		post.setContent(ValidateSupport.process(old.getContent()));
		post.setExcerpt(old.getExcerpt());

		post.setType(PostConstants.TYPE_POST);
		post.setLastUpdate(new Date());
		postManager.updatePost(post, PostTagHelper.from(post, tags, WebContextFactory.get().getUser().getId()), true);
		return new MapContainer("success", true);
	}

	@ResponseBody
	@RequestMapping(value = "/{postid}", method = RequestMethod.DELETE)
	public Object remove(@PathVariable("postid") String postid) {
		postManager.removePost(postid, PostConstants.TYPE_POST);
		return new MapContainer("success", true);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(String pid, Model model) {
		if (!StringUtils.isBlank(pid)) {
			model.addAttribute("post", postManager.loadReadById(pid));
		}

		model.addAttribute("categorys", categoryService.list());
		return "backend/post/edit";
	}

}
