package com.itxiaoer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itxiaoer.core.dal.entity.Link;
import com.itxiaoer.core.dal.mapper.BaseMapper;
import com.itxiaoer.core.dal.mapper.LinkMapper;
import com.itxiaoer.core.plugin.PageModel;

@Service
public class LinkService extends BaseService{
  @Autowired
  private LinkMapper linkMapper;
  
  public PageModel<Link> list(int pageIndex,int pageSize){
    PageModel<Link> pageModel=new PageModel<>(pageIndex, pageSize);
    list(pageModel);
    
    return pageModel;
  }

  @Override
  protected BaseMapper getMapper(){
    return linkMapper;
  }

}
