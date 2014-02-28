package model.bs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.dao.ConnectDAO;

public class Validator {
	private String userName;
	private String password;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean isValid()
	{
		Connection con=new ConnectDAO().doConnect();
		if(con==null)
		{
			System.out.println("Connection Not Established");
			return false;
		}
		try
		{
			PreparedStatement pst=con.prepareStatement("select * from User_Details where userName=? and password=?");
			pst.setString(1,getUserName());
			pst.setString(2,getPassword());
			ResultSet rs=pst.executeQuery();
			
			if(rs.next())
				return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		try
		{
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return false;
		
	}
}
