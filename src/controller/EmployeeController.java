package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bs.EmployeeCRUD;
import model.entity.Employee_3908489;

/**
 * Servlet implementation class EmployeeController
 */
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("userName")==null)
			request.getRequestDispatcher("index.jsp").forward(request,response);
		
		String action=request.getParameter("action");
		if(action.equals("add"))
		{
			String url=null;
			Employee_3908489 obj=new Employee_3908489();
			obj.setEmpNo(request.getParameter("empNo"));
			obj.setEmpName(request.getParameter("empName"));
			obj.setJob(request.getParameter("job"));
			obj.setMgrId(request.getParameter("mgrId"));
			EmployeeCRUD obj1=new EmployeeCRUD();
			int row=obj1.addEmployee(obj);
			if(row==1)
			{
				url="addEmployeeSuccess.jsp";
			}
			else
			{
				url="addEmployeeError.jsp";
			}
			request.getRequestDispatcher(url).forward(request,response);
		}
		else if(action.equals("view")){
			ArrayList<Employee_3908489> list = null;
			try {
				list = EmployeeCRUD.view();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list",list);
			request.getRequestDispatcher("view.jsp").forward(request, response);
		}
		else if(action.equals("update")){
			String url="";
			Cookie[] ck=request.getCookies();
			for(Cookie c:ck){
				if(c.getName().equals("Delete")){
					url="deleteEmployee.jsp";
					
				}else{
					url="updateEmployee.jsp";
					
				}
			}
				request.getRequestDispatcher(url).forward(request, response);
			
			
		}
		else if(action.equals("doupdate")){
			String url=null;
			Employee_3908489 obj=new Employee_3908489();
			obj.setEmpNo(request.getParameter("empNo"));
			obj.setEmpName(request.getParameter("empName"));
			obj.setJob(request.getParameter("job"));
			obj.setMgrId(request.getParameter("mgrId"));
			EmployeeCRUD obj1=new EmployeeCRUD();
			int row=obj1.updateEmployee(obj);
			if(row==1)
			{
				
				url="updateEmployeeSuccess.jsp";
			}
			else
			{
				url="updateEmployeeError.jsp";
			}
			request.getRequestDispatcher(url).forward(request,response);
		}
		else if(action.equals("dodelete")){
			String url=null;
			Employee_3908489 obj=new Employee_3908489();
			obj.setEmpNo(request.getParameter("empNo"));
			obj.setEmpName(request.getParameter("empName"));
			obj.setJob(request.getParameter("job"));
			obj.setMgrId(request.getParameter("mgrId"));
			EmployeeCRUD obj1=new EmployeeCRUD();
			int row=obj1.deleteEmployee(obj);
			if(row==1)
			{
				
				url="deleteEmployeeSuccess.jsp";
			}
			else
			{
				url="deleteEmployeeError.jsp";
			}
			request.getRequestDispatcher(url).forward(request,response);
		}
		
	}

}
