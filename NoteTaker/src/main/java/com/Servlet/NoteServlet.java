package com.Servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.Connection.HibernateConfiguration;
import com.Entity.Note;
import com.Entity.RegisterUser;


public class NoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{	
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			
			  Note nobj = new Note(); 
			  nobj.setTitle(title); 
			  nobj.setContent(content);
			  nobj.setType(type);
			  nobj.setDate(new Date());
			  
			  RegisterUser robj =  new RegisterUser();
			  robj.setUser_id(user_id);
			  nobj.setUser_id(robj);
			  
			 
				
			  Session session =  HibernateConfiguration.getFactory().openSession();			  
			  session.beginTransaction(); 
			  session.save(nobj);
			  session.getTransaction().commit(); 
			  session.close();
			  response.sendRedirect("Homepage.jsp");
			 
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println(this.getClass().getName());
			
		}
	
	}

}
