<%@page import="org.hibernate.SQLQuery"%>
<%@page import="com.Entity.RegisterUser"%>
<%@page import="com.Entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@include file="Header.jsp" %>
<body>

<%
String email = (String)session.getAttribute("email");
if(email==null || email=="")
{
	response.sendRedirect("Login.jsp");
}
%>


<jsp:include page="navbar.jsp"></jsp:include>


<div class="container-fluid pt-4">
<div class="jumbotron">
<h4 class="display-4 text-center text-danger">QAnswer.... :)</h4>

<div class="row">
<div class="col-lg-12">
<%

Session s = HibernateConfiguration.getFactory().openSession();

String query = "from Note Order BY date desc";
Query q = s.createQuery(query);
q.setFirstResult(0);
q.setMaxResults(5);
List<Note> list = q.list();
for(Note nobj:list)
{
%>
<div class="card mt-4">
<div class="card-header text-uppercase bg-primary"><p><%=nobj.getTitle()%></p></div>
<img  class="rounded-circle mt-2 ml-2 m" style="width:100px; height:100px" src="image/<%=nobj.getUser_id().getImage() %>"/>			
<div class="card-body"><textarea class="form-control" rows="10" readonly><%=nobj.getContent()%></textarea></div>
<div class= "card-footer text-center bg-info"><%=nobj.getDate()%></div>
<div class="text-danger"><p class="text-right">By <i><%=nobj.getUser_id().getName() %> </i></p></div>
</div>

<%}
s.close();
%>


</div>
</div>

</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>