package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.Connection.HibernateConfiguration;
import com.Entity.AdminEntity;
import com.Entity.RegisterUser;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out =response.getWriter();
		response.setContentType("text/html");
		Map<String, String[]> reqobj = request.getParameterMap();
		Session s = HibernateConfiguration.getFactory().openSession();
		
		if(reqobj.get("admin")[0].equals("login"))
		{
			
				
				
				String query = "From AdminEntity Where adminEmail = :e AND adminPassword =: p";
				Query q = s.createQuery(query);
				q.setParameter("e", reqobj.get("adminEmail")[0]);
				q.setParameter("p", reqobj.get("adminPassword")[0]);
				List<AdminEntity> list = q.list();
				for (AdminEntity aobj : list) {
					String email = aobj.getadminEmail();
					String password = aobj.getAdminPassword();
					   if (reqobj.get("adminEmail")[0].equals(email) && reqobj.get("adminPassword")[0].equals(password)) 
					   {
						   HttpSession session = request.getSession(true);
						   session.setAttribute("adminEmail",reqobj.get("adminEmail")[0]);
						   response.sendRedirect("Admin/AdminHomepage.jsp");
					   }
				}	

			
			
			
		}
		
		
		else if(reqobj.get("admin")[0].equals("register"))
		{
			AdminEntity aobj = new AdminEntity();
			aobj.setAdminName(reqobj.get("adminName")[0]);
			aobj.setadminEmail(reqobj.get("adminEmail")[0]);
			aobj.setAdminPassword(reqobj.get("adminPassword")[0]);
			aobj.setAdminDob(Date.valueOf(reqobj.get("adminDob")[0]));
			aobj.setAdminPhone(reqobj.get("adminPhone")[0]);
			
			
			
			s.beginTransaction();
			s.save(aobj);
			
			s.getTransaction().commit();
			s.close();
			response.sendRedirect("Admin/Admin-login.jsp");
			
		}
		
	}

}
