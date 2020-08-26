<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<body>

<%@include file="NavbarAdmin.jsp" %>

<div class="container mt-4"> 
<div class="card" style="width:600px height:500px">

<div class="card-header text-uppercase bg-primary">Create Account</div>
<div class="card-body">
<form action="../AdminServlet" method="post">
<input type="hidden" name="admin" value="register">

<label>Name</label> 
<input type="text" name="adminName" class="form-control" required autocomplete="off">

<label>Email</label>
<input type="email" name="adminEmail" class="form-control" required autocomplete="off">

<label>Password</label>
<input type="password" name="adminPassword" class="form-control" required autocomplete="off">

<label>Date Of Birth</label>
<input type="date" name="adminDob" class="form-control" required autocomplete="off">

<label>Phone Number</label>
<input type="text" name="adminPhone" class="form-control" required autocomplete="off"><br>

<div class="text-center">
<input type="submit"  value="SUBMIT" class="btn btn-primary">
<input type="reset"  value="RESET" class="btn btn-danger">

</div>


</form>
</div>
</div>
</div>

</body>
</html>