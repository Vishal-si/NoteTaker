<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="com.Entity.RegisterUser"%>
<%@page import="org.hibernate.Session"%>
<body>
<%
int user_id = Integer.parseInt(request.getParameter("user_id"));
Session s = HibernateConfiguration.getFactory().openSession();
s.beginTransaction();
RegisterUser robj = (RegisterUser)s.get(RegisterUser.class,user_id);
s.delete(robj);
s.getTransaction().commit();
s.close();
response.sendRedirect("UserList.jsp");



%>



</body>
</html>