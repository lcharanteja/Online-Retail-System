package com.tcs.ilp.ors.service;

import java.sql.SQLException;

import com.tcs.ilp.ors.bean.LoginBean;
import com.tcs.ilp.ors.dao.LoginImpl;

public class LoginService {
	LoginImpl impl=new LoginImpl();
	public String login(LoginBean log) throws ClassNotFoundException,
	SQLException {
		return impl.login(log);
	}
	public String loginStatus(LoginBean log) throws ClassNotFoundException,SQLException{
		return impl.loginStatus(log);
	}
}
