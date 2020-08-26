package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.Connection.HibernateConfiguration;
import com.Entity.Note;

/**
 * Servlet implementation class UpdateNote
 */
public class UpdateNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try
		{
			PrintWriter out = response.getWriter();
			int note_id = Integer.parseInt(request.getParameter("note_id").trim());
			String title= request.getParameter("title");
			String content=request.getParameter("content");
			
			Session s =HibernateConfiguration.getFactory().openSession();
			s.beginTransaction();
			Note note = (Note)s.get(Note.class, note_id);
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
			
			s.save(note);
			s.getTransaction().commit();
			s.close();
			response.sendRedirect("list-note.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println(this.getClass().getName());
		}
	}

}
