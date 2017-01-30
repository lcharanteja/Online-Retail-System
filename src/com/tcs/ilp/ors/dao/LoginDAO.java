package com.tcs.ilp.ors.dao;

import java.sql.SQLException;

import com.tcs.ilp.ors.bean.LoginBean;

public interface LoginDAO {
	public String login(LoginBean log) throws ClassNotFoundException,SQLException;
	public String loginStatus(LoginBean log) throws ClassNotFoundException,SQLException;
}
