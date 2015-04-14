<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Bookstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
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

		if ($('#Email').val().length == 0) {
			alert("The Email is cant't be empty");
			return false;
		}

		if ($('#Address').val().length == 0) {
			alert("The Address is cant't be empty");
			return false;
		}

		if ($('#Password').val().length == 0
				|| $('#Password2').val().length == 0) {
			alert("Please input the password and confirm password.");
			return false;
		}

		if ($('#Password').val() != $('#Password2').val()) {
			alert("The password don't match the confirm password.");
			return false;
		}

		return true;
	}

	$(function() {
		$('#UserName').change(
				function() {
					if ($('#UserName').val().length == 0) {
						$('#checkHistUserName').text(
								"please input the user name").css({
							"color" : "red",
							"background-color" : "yellow"
						});
					} else {
						$.ajax({
							url : 'UserSvr',
							data : {
								Action : "CheckUserName",
								UserName : $('#UserName').val()
							},
							error : function() {
								alert("error occured!!!");
							},
							success : function(data) {
								$('#checkHistUserName').html(data).css("color",
										"blue");
							}
						});
					}
				});

		$('#Email').change(
				function() {
					if ($('#Email').val().length == 0) {
						$('#checkHistEmail').html(
								"The Email is cant't be empty").css({
							"color" : "#ffoo11",
							"background" : "blue"
						});
					} else {
						$.post("UserSvr", "Action=CheckEmail&Email="
								+ $('#Email').val(), function(data) {
							$('#checkHistEmail').html(data).css({
								"color" : "blue",
								"background-color" : "inherit"
							});
						});
					}
				});
	});
</script>
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="header.jsp" flush="true" />
	<!----//End-bottom-header---->
	<!---//End-header---->
	<!--- start-content---->
	<div class="content login-box">
		<div class="login-main">
			<div class="wrap">
				<h1>CREATE AN ACCOUNT</h1>
				<div class="register-grids">
					<form name="frmRegister" action="UserSvr" method="post">
						<div class="register-top-grid">
							<h3>PERSONAL INFORMATION</h3>
							<div>
								<span>User Name<label>*</label></span> <input type="text"
									id="UserName" name="UserName" />
								<p id="checkHistUserName" class="hint"></p>
							</div>
							<div>
								<span>Address<label>*</label></span> <input type="text"
									id="Address" name="Address" />
							</div>
							<div>
								<span><i>Email</i><label>*</label></span> <input type="text"
									id="Email" name="Email" />
								<p id="checkHistEmail" class="hint"></p>
							</div>
							<a class="news-letter" href="#"> <label class="checkbox"><input
									type="checkbox" name="Newsletter" value="1"><i> </i>Sign
									Up for Newsletter</label>
							</a>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
						<div class="register-bottom-grid">
							<h3>LOGIN INFORMATION</h3>
							<div>
								<span>Password<label>*</label></span> <input type='password'
									id="Password" name="Password">
							</div>
							<div>
								<span>Confirm Password<label>*</label></span> <input
									type='password' id="Password2" name="Password2">
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
						<input type="hidden" name="Action" value="Register"> <input
							type="submit" value="submit" onclick="return validate(this.form)" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!---start-footer---->
	<jsp:include page="footer.jsp" flush="true" />
	<!---//End-footer---->
	<!---//End-wrap---->
</body>
</html>

