<%@page import="com.Entity.RegisterUser"%>
<%@page import="com.Entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.query.Query"%>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<body>
<jsp:include page="NavbarAdmin.jsp"></jsp:include>

<div class="container-fluid pt-4">
<div class="jumbotron">
<h4 class="display-4 text-center text-danger">DashBoard <br></h4>

<div class="row border border-danger">
<%

String adminEmail = (String)session.getAttribute("adminEmail");
if(adminEmail==null || adminEmail=="")
{
	response.sendRedirect("Admin-login.jsp");
}


Session s = HibernateConfiguration.getFactory().openSession();
Query query = s.createQuery("From Note");
int nlist = 0;
int number=0;
List<Note> list= query.getResultList();
for(Note nobj :list)
{
	 nlist = nobj.getNote_id();
	 number++;
}

%>
<div class="card mt-2 ml-3 mb-2 mr-1" style="width:300px; height:400px">
<div class="card-header bg-info text-uppercase text-center">Number of Notes</div>
<div class="card-body">
<div class="container text-center">
<img src="../image/wp4207184.jpg" class="img-thumbnail " alt="image.jpg" style="width:200px; height:150px"/>
<p class="text-uppercase">number of notes current:<br><b><%=number%></b></p>
<a href="NoteList.jsp" class="btn btn-primary"> CHECK</a>
</div>
</div>
<div class="card-footer bg-primary"></div>
</div>


<%
Query query2 = s.createQuery("From RegisterUser");
int ulist = 0;
int user_number=0;
List<RegisterUser> rlist= query2.getResultList();
for(RegisterUser robj :rlist)
{
	 ulist = robj.getUser_id();
	 user_number++;
}

%>
<div class="card mt-2 ml-3 mb-2  mr-1" style="width:300px; height:400px">
<div class="card-header bg-info text-uppercase text-center">Number of User</div>
<div class="card-body">
<div class="container text-center">
<img src="../image/235-2350682_new-svg-image-small-user-login-icon-hd.png" class="img-thumbnail " alt="image.jpg" style="width:200px; height:150px"/>
<p class="text-uppercase">number of user current:<br><b><%=user_number%></b></p>
<a href="UserList.jsp" class="btn btn-primary"> CHECK</a>
</div>
</div>
<div class="card-footer bg-primary"></div>
</div>


<div class="card mt-2 ml-3 mb-2  mr-1" style="width:300px; height:400px">
<div class="card-header bg-info text-uppercase text-center">Add New Admin</div>
<div class="card-body">
<div class="container text-center">
<img src="../image/235-2350682_new-svg-image-small-user-login-icon-hd.png" class="img-thumbnail " alt="image.jpg" style="width:200px; height:150px"/>
<p class="text-uppercase">Add new admin for this application<br><b>Click below</b></p>
<a href="AdminRegister.jsp" class="btn btn-primary"> Click Me</a>
</div>
</div>
<div class="card-footer bg-primary"></div>
</div>


<div class="card mt-2 ml-2 mb-2  mr-1" style="width:300px; height:400px">
<div class="card-header bg-info text-uppercase text-center">Delete Admin</div>
<div class="card-body">
<div class="container text-center">
<img src="../image/235-2350682_new-svg-image-small-user-login-icon-hd.png" class="img-thumbnail " alt="image.jpg" style="width:200px; height:150px"/>
<p class="text-uppercase">Delete System admin<br><b>Click below</b></p>
<a href="" class="btn btn-primary">Click Me</a>
</div>
</div>
<div class="card-footer bg-primary"></div>
</div>



</div>
</div>












</body>
</html>