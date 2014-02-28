package model.bs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.dao.ConnectDAO;
import model.entity.Employee_3908489;

public class EmployeeCRUD {
	public int addEmployee(Employee_3908489 obj)
	{
		int row=0;
		Connection con=new ConnectDAO().doConnect();
		if(con==null)
		{
			System.out.println("Connection did not established");
			return row;
		}
		try
		{
			PreparedStatement pst=con.prepareStatement("insert into employee_3908489 values(?,?,?,?)");
			pst.setString(1,obj.getEmpNo());
			pst.setString(2,obj.getEmpName());
			pst.setString(3,obj.getJob());
			pst.setString(4,obj.getMgrId());
			row=pst.executeUpdate();
			con.close();
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
		return row;
	}
	public static ArrayList<Employee_3908489> view()throws SQLException{
		Connection con=new ConnectDAO().doConnect();
		ArrayList<Employee_3908489> list=new ArrayList<Employee_3908489>();
		try{
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from Employee_3908489 order by empno");
		while(rs.next()){
			
			Employee_3908489 ss = new Employee_3908489();
	            ss.setEmpNo(rs.getString("empno"));
	            ss.setEmpName(rs.getString("empname"));
	            ss.setJob(rs.getString("job"));
	            ss.setMgrId(rs.getString("mgrid"));
	            list.add(ss);
				
			
		}
		con.close();
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}
	public int updateEmployee(Employee_3908489 obj){
		int row=0;
		Connection con=new ConnectDAO().doConnect();
		if(con==null)
		{
			System.out.println("Connection did not established");
			return row;
		}
		try
		{
			PreparedStatement pst=con.prepareStatement("update employee_3908489 set empname=?,job=?,mgrid=? where empno=?");
			pst.setString(4,obj.getEmpNo());
			pst.setString(1,obj.getEmpName());
			pst.setString(2,obj.getJob());
			pst.setString(3,obj.getMgrId());
			row=pst.executeUpdate();
			con.close();
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
		return row;
	}
	public int deleteEmployee(Employee_3908489 obj){
		int row=0;
		Connection con=new ConnectDAO().doConnect();
		if(con==null)
		{
			System.out.println("Connection did not established");
			return row;
		}
		try
		{
			PreparedStatement pst=con.prepareStatement("delete from employee_3908489 where empno=?");
			pst.setString(1,obj.getEmpNo());
			row=pst.executeUpdate();
			con.close();
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
		return row;
	}
}
