<%@page import="com.Entity.RegisterUser"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
<body>

<jsp:include page="navbar.jsp"></jsp:include>


<div class="container mt-3">
<%
String email =(String)session.getAttribute("email");
if(email==null || email=="")
{
	response.sendRedirect("Login.jsp");
}

Session s = HibernateConfiguration.getFactory().openSession();
Query query = s.createQuery("From RegisterUser WHERE email = : e");
query.setParameter("e",email);
List<RegisterUser> rlist = query.getResultList();
for(RegisterUser robj :rlist)
{
%>
<div class="card m-auto" style="width:250px; height:350px;">
<div class="card-header text-center text-uppercase"><i><%=robj.getName() %></i></div>
<div class="card-body">
<img class="rounded-circle ml-2 " src="image/<%=robj.getImage() %>" style="width:200px; height:150px;"/></br>
<input class="form-control" type="text" value=<%=robj.getEmail()%> readonly> <br>
<input class="form-control" type="text" value=<%=robj.getContact()%> readonly>
</div>

</div>


<%}%>
</div>
</body>
</html>