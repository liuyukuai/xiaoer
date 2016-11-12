package com.itxiaoer.service.vo;

import java.util.Calendar;
import java.util.Date;

import com.itxiaoer.core.dal.constants.OptionConstants;
import com.itxiaoer.core.plugin.ApplicationContextUtil;
import com.itxiaoer.service.OptionsService;

/**
 * view中使用的的对象
 * 
 * @author zhou
 *
 */
public class Global{
  private String domain;

  public Global(String domain){
    this.domain = domain;
  }

  public String getTitle(){
    return getOptionValue(OptionConstants.TITLE);
  }

  public String getSubtitle(){
    return getOptionValue(OptionConstants.SUBTITLE);
  }

  public String getDescription(){
    return getOptionValue(OptionConstants.DESCRIPTION);
  }
  
  public String getKeywords(){
    return getOptionValue(OptionConstants.KEYWORDS);
  }

  public boolean isAllowComment(){
    return Boolean.parseBoolean(getOptionValue(OptionConstants.ALLOW_COMMENT));
  }

  public int getYear(){
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date());
    return calendar.get(Calendar.YEAR);
  }

  public String getDomain(){
    return domain;
  }

  private static String getOptionValue(String name){
    OptionsService optionsService = ApplicationContextUtil.getBean(OptionsService.class);
    return optionsService.getOptionValue(name);
  }

}
