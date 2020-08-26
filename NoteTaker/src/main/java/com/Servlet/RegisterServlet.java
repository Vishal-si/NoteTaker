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

import com.Entity.RegisterUser;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Session s = HibernateConfiguration.getFactory().openSession();
		Map<String, String[]> reqobj = request.getParameterMap();
		if (reqobj.get("user")[0].equals("register")) {
			if (!reqobj.get("password")[0].equals(reqobj.get("cfmpassword")[0])) {

				out.println("<h3>Authenciation error</h3>");
				out.println("<p>password mis-match</p>");
			} else {
				RegisterUser robj = new RegisterUser();
				robj.setName(reqobj.get("name")[0]);
				robj.setEmail(reqobj.get("email")[0]);
				robj.setPassword(reqobj.get("password")[0]);
				robj.setDob(Date.valueOf(reqobj.get("dob")[0]));
				robj.setContact(reqobj.get("phone")[0]);
				robj.setJoindate(new java.util.Date());

				s.beginTransaction();

				s.save(robj);

				s.getTransaction().commit();
				s.close();
				response.sendRedirect("Login.jsp");
			}
		} else if (reqobj.get("user")[0].equals("login")) {
			
			
			String query = "From RegisterUser Where email = :e AND password =: p";
			Query q = s.createQuery(query);
			q.setParameter("e", reqobj.get("email")[0]);
			q.setParameter("p", reqobj.get("password")[0]);
			List<RegisterUser> list = q.list();
			for (RegisterUser robj : list) {
				String email = robj.getEmail();
				String password = robj.getPassword();
				   if (reqobj.get("email")[0].equals(email) && reqobj.get("password")[0].equals(password)) 
				   {
					   HttpSession session = request.getSession(true);
					   session.setAttribute("email",reqobj.get("email")[0]);
					   response.sendRedirect("Homepage.jsp");
				   }
			}	

		} else {
			out.println("Authenciation error");
		}
	}
}
