<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="Header.jsp"></jsp:include>
<body>

<%@include file="navbar.jsp" %>




<div class="container mt-4"> 
<div class="card" style="width:600px height:500px">
<div class="card-header text-uppercase bg-primary">Create Account</div>

<div class="card-body">
<form action="UserRegister" method="post" enctype="multipart/form-data">
<input type="hidden" value="register" name="user">
<label>Name</label>
<input type="text" name="name" class="form-control" required autocomplete="off">

<label>Email</label>
<input type="email" name="email" class="form-control" required autocomplete="off">

<label>Password</label>
<input type="password" name="password" class="form-control" required>

<label>Confirm Password</label>
<input type="password" name="cfmpassword" class="form-control" required>

<label>Date of Birth</label>
<input type="date" name="dob" class="form-control" required autocomplete="off">

<label>Phone number</label>
<input type="text" name="phone" class="form-control" required autocomplete="off">

<label>Profile image</label>
<input type="file" name="image" class="form-control" required><br>

<div class="text-center">
<input type="submit"  value="SUBMIT" class="btn btn-primary">
<input type="reset"  value="RESET" class="btn btn-danger">

</div>

</div>

</form>
</div>

</div>
</body>
</html>