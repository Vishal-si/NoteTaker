<jsp:include page="Header.jsp"></jsp:include>
<body>

<body>

<div class="jumbotron">
<h3 class="text-center">QAnswer...:)</h3>

</div>

<div class="container-fluid pt-2">

<div class="card m-auto" style="width:400px; height:350px">
<div class="card-header text-uppercase bg-primary">Login</div>

<div class="card-body">
<form action="RegisterServlet" method="post">
<input type="hidden" value="login" name="user">

<label>Email</label>
<input type="email" name="email" class="form-control"  required autocomplete="off">

<label>Password</label>
<input type="password" name="password" class="form-control" required><br>

<div class="text-center"><input type="submit" value="SUBMIT" class="btn btn-primary text-center"></div>
</div>



<div class="card-footer bg-light"><a href="Register.jsp" class="btn btn-primary">Create New Account</a></div>

</form>
</div>

</div>
</body>
</html>