
<%@page import="com.Entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<jsp:include page="Header2.jsp"></jsp:include>

<jsp:include page="navbar2.jsp"></jsp:include>

<%
String type = request.getParameter("type");
%>

<div class="container-fluid pt-4">
<div class="jumbotron">
<h3 class="text-center text-danger text-uppercase"><%=type%></h3>

<div class="row">
<div class="col-lg-12">
<%
Session s = HibernateConfiguration.getFactory().openSession();
Query q = s.createQuery("FROM Note WHERE type=:t");
q.setParameter("t", type);
List<Note> nlist = q.getResultList();
for(Note nobj:nlist)
{
	%>
	<div class="card mt-4">
	<div class="card-header text-uppercase bg-primary"><p><%=nobj.getTitle()%></p></div>
	<img  class="rounded-circle mt-2 ml-2" style="width:100px; height:100px" src="../image/<%=nobj.getUser_id().getImage() %>"/>			
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

</body>
</html>