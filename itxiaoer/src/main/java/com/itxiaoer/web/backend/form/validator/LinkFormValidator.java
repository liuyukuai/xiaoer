package com.itxiaoer.web.backend.form.validator;

import com.itxiaoer.core.dal.entity.Link;
import com.itxiaoer.core.plugin.MapContainer;
import com.itxiaoer.core.util.CommRegular;
import com.itxiaoer.core.util.StringUtils;

public class LinkFormValidator{

  public static MapContainer validateInsert(Link link){
    MapContainer form = new MapContainer();
    if(StringUtils.isBlank(link.getName())){
      form.put("name", "需填写链接名称");
    }else if(StringUtils.isBlank(link.getUrl()) || !link.getUrl().matches(CommRegular.DOMAIN)){
      form.put("url", "链接格式不正确");
    }

    return form;
  }

  public static MapContainer validateUpdate(Link link){
    MapContainer form = validateInsert(link);
    if(StringUtils.isBlank(link.getId())){
      form.put("msg", "ID不合法");
    }

    return form;
  }

}
