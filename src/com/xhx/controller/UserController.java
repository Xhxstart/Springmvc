package com.xhx.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;





import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xhx.mapper.UserMapper;
import com.xhx.ssm.po.User;
import com.xhx.ssm.po.User.First;
import com.xhx.ssm.po.User.Second;
import com.xhx.validator.UserValidator;
//import com.xhx.validator.UserValidator;

@Controller
public class UserController {

	@Qualifier("userValidator")
	private static ApplicationContext ac;
//	private UserValidator userValidator;
	UserController (){
		ac = new ClassPathXmlApplicationContext("classpath:spring/beans.xml");
	}
	/***
	 * 用户登录
	 * <p>注解配置，只允许post方法提交
	 * 
	 * return
	 * @throws Exception 
	 * ***/
	@RequestMapping(value="/login")
	public ModelAndView login(@Validated({ First.class} ) @ModelAttribute("user") User user,Errors errors,ModelAndView mav) throws Exception {
		//创建usermapper对象,mybatis自动生成Mapper代理对象
		UserMapper userMapper = (UserMapper) ac.getBean("userMapper");
		Integer row_Fr,row_To,kensu,count,currentpage;		
		mav.addObject("user",user);
		//userValidator.validate(user, errors);
		if(errors.hasErrors()){			
			mav.setViewName("home");
		}
		else {
			mav.setViewName("010LD");
			if (user!=null){ 
				kensu = (user.getKENSU()!=null) ? user.getKENSU():10 ;
				user.setKENSU(kensu);
				count = (userMapper.findPageCountByName(user)!=0) ? userMapper.findPageCountByName(user):1;
				if (count>0){
					currentpage  = (user.getCURRENTPAGE()!=null ) ? user.getCURRENTPAGE():1 ;
				}
				else currentpage = 1;
				
				row_Fr = (currentpage-1) * kensu;
				row_To = currentpage * kensu;
				
				user.setCURRENTPAGE(currentpage);
				user.setGET_ROW_FR(row_Fr);
				user.setGET_ROW_TO(row_To);
				user.setPAGECOUNT(count%kensu==0 ? count/kensu:count/kensu+1);
				List<String> num = new ArrayList<String>();
				num.add("1");
				num.add("2");
				num.add("a");
				num.add("b");
				user.setNum(num);
				List<User> userlist = userMapper.findUserByName(user);			
				//内部其实把model 通过request.setAttribute(modelName, modelValue); 放入的 
				mav.addObject("userlist",userlist);
			}		
		}

		//mav.addObject("password",password);
		//mav.addObject("username",username);
		return mav;
	}
	/***
	 * 検索
	 * <p>注解配置，只允许post方法提交
	 * 
	 * return
	 * @throws Exception 
	 * ***/
	@RequestMapping(value="/search")
	public ModelAndView search(User user,Errors errors,ModelAndView mav) throws Exception {
		//创建usermapper对象,mybatis自动生成Mapper代理对象
		UserMapper userMapper = (UserMapper) ac.getBean("userMapper");
		Integer row_Fr,row_To,kensu,count,currentpage;		
		mav.addObject("user",user);
		//userValidator.validate(user, errors);
		if(errors.hasErrors()){			
			mav.setViewName("010LD");
		}
		else {
			mav.setViewName("010LD");
			kensu = (user.getKENSU()!=null) ? user.getKENSU():10 ;
			user.setKENSU(kensu);
			count = userMapper.findPageCountByName(user);
			if (count>0){
				currentpage  = (user.getCURRENTPAGE()!=null ) ? user.getCURRENTPAGE():1 ;				
				row_Fr = (currentpage-1) * kensu;
				row_To = currentpage * kensu;
				
				user.setCURRENTPAGE(currentpage);
				user.setGET_ROW_FR(row_Fr);
				user.setGET_ROW_TO(row_To);
				user.setPAGECOUNT(count%kensu==0 ? count/kensu:count/kensu+1);
				List<User> userlist = userMapper.findUserByName(user);			
				//内部其实把model 通过request.setAttribute(modelName, modelValue); 放入的
	
				mav.addObject("userlist",userlist);
			}
			else {
				mav.addObject("message","該当条件下情報がありません！");
				mav.addObject("userlist",null);
			}		
		}

		//mav.addObject("password",password);
		//mav.addObject("username",username);
		return mav;
	}
	
	/**
	 * @param SHAIN_CD 社员ID
	 * @param @Validated({ First.class,Second.class } )分组验证
	 * @param user
	 * */
	@RequestMapping(value="/inser")
	public ModelAndView inser(String SHAIN_CD,String NEW_FLG, @Validated({ First.class,Second.class } )  @ModelAttribute("user") User user,Errors errors,ModelAndView mav ,HttpSession session) throws Exception {
		//创建usermapper对象,mybatis自动生成Mapper代理对象
		UserMapper userMapper = (UserMapper) ac.getBean("userMapper");
		String message = "message";
		if(errors.hasErrors()){
			mav.addObject(message,"該当ユーザー情報を修正してください！");
		}
		else{
			if(!"0".equals(NEW_FLG) && userMapper.findUserById(SHAIN_CD) == null){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式	
				user.setINS_TM(new Date());
				user.setMUKOU_FLG("0");
				try {
					userMapper.addUser(user);
				} catch (Exception e) {
					mav.addObject(message,"ユーザー情報登録が失敗しました！");
				}
				mav.addObject(message,"ユーザー情報登録成功しました！");
			}
			else{
				user = userMapper.findUserById(SHAIN_CD);
				mav.addObject(message,"該当ユーザー情報を変更してください！");
			}
		}
		mav.addObject("user",user);
		mav.setViewName("020MD");
			
		//mav.addObject("password",password);
		//mav.addObject("username",username);
		return mav;
	}
	
	@RequestMapping(value="Update")
	public ModelAndView Update(String SHAIN_CD, User user,ModelAndView mav ,HttpSession session) throws Exception {
		//创建usermapper对象,mybatis自动生成Mapper代理对象
		UserMapper userMapper = (UserMapper) ac.getBean("userMapper");
		user = userMapper.findUserById(SHAIN_CD);
		mav.addObject("user",user);
		mav.setViewName("030ED");
			
		//mav.addObject("password",password);
		//mav.addObject("username",username);
		return mav;
	}
	
	
	
}
