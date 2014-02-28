package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bs.Validator;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("action")!=null){
			 if(request.getParameter("action").equals("login"))
		{
		Validator valid=new Validator();
		valid.setUserName(request.getParameter("userName"));
		valid.setPassword(request.getParameter("password"));
		if(valid.isValid())
		{
			HttpSession session=request.getSession(true);
			session.setAttribute("userName",valid.getUserName());
			request.getRequestDispatcher("welcome.jsp").forward(request,response);
		}
		else
		{
			request.getRequestDispatcher("error.jsp").forward(request,response);
		}
		}
		else if(request.getParameter("action").equals("logout"))
		{
			HttpSession session=request.getSession(false);
			if(session!=null && session.getAttribute("userName")!=null)
			{
				System.out.println("logout");
				session.setAttribute("username", null);
			session.invalidate();
			request.getRequestDispatcher("logout.jsp").forward(request,response);
			}
			else
			{
				System.out.println("logout1");
				request.getRequestDispatcher("index.jsp").forward(request,response);
				
			}
		}
		}else{
			System.out.println("logout2");
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		
	}


	

}
