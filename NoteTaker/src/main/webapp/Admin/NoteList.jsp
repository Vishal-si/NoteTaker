<%@page import="com.Entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@include file="HeaderAdmin.jsp" %>
<body>

<%@include file="NavbarAdmin.jsp"%>


<%
String adminEmail = (String)session.getAttribute("adminEmail");
if(adminEmail==null || adminEmail=="")
{
	response.sendRedirect("Admin-login.jsp");
} %>

<div class="container-fluid pt-4">
<table class="table table-striped">
<thead class="text-danger bg-light ">
<tr>
<th>Title</th>
<th>Type</th>
<th>Content</th>
<th>Upload Date&Time</th>
<th>Delete</th>
</tr>
</thead>


<!-- Get the note by user_id -->
<%
	Session s = HibernateConfiguration.getFactory().openSession();
	Query q = s.createQuery("From Note");
	
			List<Note> nlist = q.getResultList();
			for(Note nobj:nlist)
			{%>
			<tbody>
			<tr>
			<td><%=nobj.getTitle() %></td>
			<td><%=nobj.getType() %></td>
			<td><textarea class="form-control" readonly cols="60" ><%=nobj.getContent() %></textarea></td>
			<td><%=nobj.getDate() %></td>
			<td><a  class="btn btn-outline-danger" href="DeleteNote.jsp?note_id=<%=nobj.getNote_id()%>">Delete</a></td>
			</tr>
			</tbody>

				
			<%} %>






	













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