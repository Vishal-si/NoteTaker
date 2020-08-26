<%@page import="com.Entity.Note"%>
<%@page import="com.Connection.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>

<body>
<%
int note_id = Integer.parseInt(request.getParameter("note_id"));
Session s = HibernateConfiguration.getFactory().openSession();
s.beginTransaction();
Note nobj = (Note)s.get(Note.class,note_id);
s.delete(nobj);
s.getTransaction().commit();
s.close();
response.sendRedirect("NoteList.jsp");



%>
</body>
</html>