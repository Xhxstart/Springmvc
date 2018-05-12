package com.xhx.validator;

import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.xhx.ssm.po.User;

@Repository("userValidator")
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(clazz);
	}
	
	//使用sprig的Validation自定义验证规则
	/*有时候默认的规则可能还不够，有时候还需要自定义规则，
	比如屏蔽关键词验证是非常常见的一个功能，比如在发帖时帖子中不允许出现admin等关键词。*/
	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		User user =(User)target;
		try {
			ValidationUtils.rejectIfEmpty(errors, user.getClass().getField("SHAIN_NM").getName(), null,"登录名不能为空");
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ValidationUtils.rejectIfEmpty(errors, "KAISHA_CD", null,"密码不能为空");
		
		if(user.getSHAIN_NM().length()>10){
			errors.rejectValue("shain_nm", null,"用户名不能超过10字符");
		}
	}

}
