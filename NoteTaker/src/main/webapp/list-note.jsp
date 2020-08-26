
<%@page import="com.Entity.RegisterUser"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.Entity.Note"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session.*"%>

<%@include file="Header.jsp" %>
<body>

<%@include file="navbar.jsp"%>


<%
String email = (String)session.getAttribute("email");
if(email==null || email=="")
{
	response.sendRedirect("Login.jsp");
} %>

<div class="container-fluid pt-4">
<table class="table table-striped">
<thead class="text-danger bg-light ">
<tr>
<th>Title</th>
<th>Content</th>
<th>Upload Date&Time</th>
<th>Edit</th>
<th>Delete</th>
</tr>
</thead>


<!-- Get the note by user_id -->
<%
Session s = HibernateConfiguration.getFactory().openSession();
Query query = s.createQuery("From RegisterUser where email = :e");
query.setParameter("e",email);
List<RegisterUser> ulist = query.list();
for(RegisterUser robj:ulist)
{
	int user_id = (Integer)robj.getUser_id();
	Query q = s.createQuery("From Note Where user_id = :u");
	q.setInteger("u", user_id);
	
			List<Note> nlist = q.getResultList();
			for(Note nobj:nlist)
			{%>
			<tbody>
			<tr>
			<td><%=nobj.getTitle() %></td>
			<td><textarea class="form-control" readonly cols="60" ><%=nobj.getContent() %></textarea></td>
			<td><%=nobj.getDate() %></td>
			<td><a class="btn btn-outline-primary" href="Edit.jsp?note_id=<%=nobj.getNote_id()%>">Edit</a></td>
			<td><a  class="btn btn-outline-danger" href="Delete.jsp?note_id=<%=nobj.getNote_id()%>">Delete</a></td>
			</tr>
			</tbody>

				
			<%} }%>






	













</table>
</div>

<!-- /* Query q = s.createQuery("from Note");
List<Note> list = q.list();
for(Note obj:list)
{
out.println(obj.getTitle());	
	
} */
/* 
Note obj =(Note)s.get(Note.class, 9288);
out.println(obj.getTitle());
out.println(obj.getContent());
 */	
 -->

</body>
</html>