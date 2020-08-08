package com.kangrise.xunjian.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.kangrise.xunjian.utils.SysLoadUtils;

public class SysLoadListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		SysLoadUtils.loadEquipFieldColumn();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
