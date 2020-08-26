<%@page import="com.Entity.Note"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int note_id = Integer.parseInt(request.getParameter("note_id"));
Session s = HibernateConfiguration.getFactory().openSession();
s.beginTransaction();
Note nobj = (Note)s.get(Note.class,note_id);
s.delete(nobj);
s.getTransaction().commit();
s.close();
response.sendRedirect("list-note.jsp");
%>
</body>
</html>