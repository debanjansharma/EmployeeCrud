package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDAO {

	public Connection doConnect()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
