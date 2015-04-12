<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Bookstore</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<!----start-alert-scroller---->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<!----start-alert-scroller---->
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<!-- //End menu -->
<!---slider---->
<link rel="stylesheet" href="css/slippry.css">
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
<!----start-pricerage-seletion---->
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<!----//End-pricerage-seletion---->
<!---move-top-top---->
<script type="text/javascript" src="js/move-top.js"></script>
<!--script type="text/javascript" src="js/easing.js"></script-->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.vticker').easyTicker();
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});

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
<!---//move-top-top---->
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
							<span>UserName<label>*</label></span> <input type="text"
								id="UserName" name="UserName" />
						</div>
						<div>
							<span>Password<label>*</label></span> <input type='password'
								id="Password" name="Password">
						</div>
						<input type="hidden" name="Action" value="Login"> <input
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

