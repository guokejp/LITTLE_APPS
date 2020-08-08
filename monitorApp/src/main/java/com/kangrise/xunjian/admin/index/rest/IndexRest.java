package com.kangrise.xunjian.admin.index.rest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kangrise.xunjian.admin.equip.service.impl.IEquipInfoService;

@Controller
@RequestMapping("admin/index/indexRest")
public class IndexRest 
{
	final Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private IEquipInfoService equipInfoService;//设备
	


}
