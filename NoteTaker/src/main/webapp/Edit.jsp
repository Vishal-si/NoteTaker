<%@page import="com.Entity.Note"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<body>

<%@include file="navbar.jsp" %>


<%
String email = (String)session.getAttribute("email");
if(email==null || email=="")
{
	response.sendRedirect("Login.jsp");
}
int note_id =Integer.parseInt(request.getParameter("note_id"));
Session s = HibernateConfiguration.getFactory().openSession();
Note nobj = (Note)s.get(Note.class,note_id);
 
 %>
 <div class="container-fluid pt-4">
 <div class="jumbotron">
 
 <form action="UpdateNote" method="post">
 
 <input type="hidden" value=<%=note_id%> name="note_id">

<label>Title</label>
<textarea name="title" class="form-control"><%=nobj.getTitle()%></textarea>
 


<label>Content</label>
<textarea rows="10" cols="10" name="content" class="form-control"><%=nobj.getContent()%></textarea>

<div class="container text-center pt-2">
<button type="submit" class="btn btn-primary">Submit</button>
<button  type="reset" class="btn btn-danger">Reset</button>
</div>
</form>
</div>
</div>
</body>
</html>