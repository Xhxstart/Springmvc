package com.xhx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	/**
	 * 进入首页返回/page/home.jsp"> 
	 * @return
	 * 
	 * 使用注解@Controller将HomeController类定义为一个Controller,
	 * 并且在方法中通过@RequestMapping(“value”)来指定所需要访问的路径或者方法名。 
	 * SpringMVC可以通过一个@Controller注解将一个POJO转化为处理请求的控制器，
	 * 通过@RequestMapping为控制器指定哪些需要的请求。
	 * ***/
	@RequestMapping("index")
	public ModelAndView index(){
		
		ModelAndView mav = new ModelAndView("home");
		return mav;
		
	} 
}
