package com.itxiaoer.core.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.itxiaoer.core.plugin.PageModel;

public class NextTag extends AbstartTagSupport{
  private static final long serialVersionUID = 1L;

  @Override
  public int doStartTag() throws JspException{
    PageModel<?> model = getPagination().getModel();
    
    if(model.getPageIndex() < model.getTotalPage()){
      setPageAttribute(model.getPageIndex() + 1);
      return TagSupport.EVAL_BODY_INCLUDE;
    }else{
      return TagSupport.SKIP_BODY;
    }
  }

}
