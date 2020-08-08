package com.kangrise.xunjian.rest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class PcExceptionHandler {
	final Log log = LogFactory.getLog(this.getClass());
	
	@ExceptionHandler
	public ModelAndView handleException(Exception e) {
		e.printStackTrace();
		log.error(e);
		ModelAndView anv = new ModelAndView();
		anv.setViewName("redirect:/500.jsp");
		
		return anv;
	}
}
