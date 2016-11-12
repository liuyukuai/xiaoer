package com.itxiaoer.web.backend.form.validator;

import com.itxiaoer.core.dal.entity.Category;
import com.itxiaoer.core.plugin.MapContainer;
import com.itxiaoer.core.util.StringUtils;

public class CategoryFormValidator{

  public static MapContainer validateInsert(Category category){
    MapContainer form = new MapContainer();
    if(StringUtils.isBlank(category.getName())){
      form.put("msg", "分类名称不能为空");
    }

    return form;
  }

}
