package com.tcs.ilp.ors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.ilp.ors.bean.LoginBean;
import com.tcs.ilp.ors.util.DatabaseUtil;

public class LoginImpl implements LoginDAO{
		Connection con= null;
		PreparedStatement pstmt= null;
		int rowsAffected=0;
		
	
	public String login(LoginBean log) throws ClassNotFoundException,SQLException{
		// TODO Auto-generated method stub

			String role=null;
		con=DatabaseUtil.getConnection();
		pstmt=con.prepareStatement("select role from  login_team3 where emailid=? AND password=?");
	
		pstmt.setString(1, log.getLoginId());
		pstmt.setString(2, log.getPassword());
		ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
        	
    		 role=rs.getString("role");
        }
                DatabaseUtil.closeStatement(pstmt);
        		DatabaseUtil.closeConnection(con);
			return role;	
 	}
	
	public String loginStatus(LoginBean log) throws ClassNotFoundException,SQLException{
		// TODO Auto-generated method stub

			String status=null;
		con=DatabaseUtil.getConnection();
		pstmt=con.prepareStatement("select status from  customer_team3 where email=? AND password=?");
		
		pstmt.setString(1, log.getLoginId());
		pstmt.setString(2, log.getPassword());
		ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
        	
                	status=rs.getString(1);
        }
                DatabaseUtil.closeStatement(pstmt);
        		DatabaseUtil.closeConnection(con);
			return status;	
 	}
}
