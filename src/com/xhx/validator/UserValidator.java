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
