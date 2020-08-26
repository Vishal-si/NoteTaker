<%@page import="com.Entity.RegisterUser"%>
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
<th>Id</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Joined Date</th>
<th>Remove</th>
</tr>
</thead>


<!-- Get the note by user_id -->
<%
	Session s = HibernateConfiguration.getFactory().openSession();
	Query q = s.createQuery("From RegisterUser");
	
			List<RegisterUser> nlist = q.getResultList();
			for(RegisterUser robj:nlist)
			{%>
			<tbody>
			<tr>
			<td><%=robj.getUser_id() %></td>
			<td><%=robj.getName() %></td>
			<td><%=robj.getEmail() %></td>
			<td><%=robj.getContact() %></td>
			<td><%=robj.getJoindate() %></td>
			<td><a  class="btn btn-outline-danger" href="DeleteUserByAdmin.jsp?user_id=<%=robj.getUser_id()%>">Delete</a></td>
			</tr>
			</tbody>

				
			<%} %>



</table>
</div>


</body>
</html>