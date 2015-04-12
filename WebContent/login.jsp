<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Bookstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="css/slippry.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/scripts-f0e4e0c2.js"></script>
<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<script type="text/javascript">
	function validate(form) {
		if ($('#UserName').val().length == 0) {
			alert("Please input the user name.");
			return false;
		}

		if ($('#Password').val().length == 0) {
			alert("Please input the password .");
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="header.jsp" flush="true" />
	<!----//End-bottom-header---->
	<!---//End-header---->
	<div class="content login-box">
		<div class="login-main">
			<div class="wrap">
				<h1>LOGIN OR CREATE AN ACCOUNT</h1>
				<div class="login-left">
					<h3>NEW CUSTOMERS</h3>
					<p>By creating an account with our store, you will be able to
						move through the checkout process faster, store multiple shipping
						addresses, view and track your orders in your account and more.</p>
					<a class="acount-btn" href="register.jsp">Creat an Account</a>
				</div>
				<div class="login-right">
					<h3>REGISTERED CUSTOMERS</h3>
					<p>If you have an account with us, please log in.</p>
					<form name="frmLogin" id="frmLogin" action="UserSvr" method="post">
						<div>
							<span>UserName<label>*</label></span><input type="text"
								id="UserName" name="UserName" />
						</div>
						<div>
							<span>Password<label>*</label></span><input type='password'
								id="Password" name="Password">
						</div>
						<input type="hidden" name="Action" value="Login"><input
							type="submit" value="Login" onclick="return validate(this.form)" />
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!---start-footer---->
	<jsp:include page="footer.jsp" flush="true" />
	<!---//End-footer---->
	<!---//End-wrap---->
</body>
</html>

