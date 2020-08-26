<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<body style="background-image: url('../image/wp4207184.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">


<div class="container-fluid pt-2">
<div class="card m-auto"  style="width:400px; height:350px">
<div class="card-header text-uppercase bg-primary">Login</div>


<div class="card-body bg-info" >
<form action="../AdminServlet" method="post">
<input type="hidden" name="admin" value="login">
<label>Login Id</label>
<input type="email" class="form-control" name="adminEmail" required autocomplete="off">
<label>Password</label>
<input type="password" class="form-control" name="adminPassword" required> <br>

<div class="container text-center">
<input class="btn btn-primary active" type="submit" value="SUBMIT">
<input class="btn btn-danger" type="reset" value="RESET">
</div>

</div>

</form>
</div>
</div>
</body>
</html>