<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.Entity.RegisterUser"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@include file="Header.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container-fluid pt-4">
<div class="jumbotron">
<form action ="NoteServlet" method="post">
<%
Session s = HibernateConfiguration.getFactory().openSession();
String email = (String)session.getAttribute("email");
if(email==null || email=="")
{
	response.sendRedirect("Login.jsp");
}
String uquery ="From RegisterUser where email = : e";
Query userQuery =s.createQuery(uquery);
userQuery.setParameter("e",email);
List<RegisterUser> userlist = userQuery.list();
for(RegisterUser robj:userlist)
{%>

<input type="hidden" value=<%=robj.getUser_id()%> name="user_id">
<%}  %>






<label>Title</label>
<input type="text" name="title" class="form-control" required>

<label>Type</label>
<select name="type" class="form-control" required>
<option></option>
<option>JAVA</option>
<option>C PLUS</option>
<option>C</option>
<option>MYSQL</option>
<option>SQL</option>
<option>JS</option>
<option>HTML</option>
<option>AJAX</option>
<option>RUBY</option>
<option>SERVLET & JSP</option>
<option>DBMS</option>
<option>CSS</option>
<option>JQUERY</option>
<option>PYTHON</option>
<option>DS</option>
<option>.NET</option>
<option>JSON</option>
<option>EXCEL</option>
<option>GST</option>
<option>PHP</option>
</select>

<label>Content</label>
<textarea rows="10" cols="10" name="content" class="form-control" required></textarea>

<div class="container pt-2 text-center">
<button type="submit" class="btn btn-primary">Submit</button>
<button type="reset" class="btn btn-danger">Reset</button>
</div>
</form>
</div>
</div>
</body>
</html>

