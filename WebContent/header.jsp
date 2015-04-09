<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ 
   page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Header - Online Bookstore</title>
</head>
<body>
	<!---start-header---->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="top-header-left">
					<ul>
						<!---cart-tonggle-script---->
						<script type="text/javascript">
							$(function() {
								var $cart = $('#cart');
								$('#clickme').click(function(e) {
									e.stopPropagation();
									if ($cart.is(":hidden")) {
										$cart.slideDown("slow");
									} else {
										$cart.slideUp("slow");
									}
								});
								$(document.body).click(function() {
									if ($cart.not(":hidden")) {
										$cart.slideUp("slow");
									}
								});
							});
						</script>
						<!---//cart-tonggle-script---->
						<li><a class="cart" href="#"><span id="clickme"> </span></a></li>
						<!---start-cart-bag---->
						<div id="cart">
							Your Cart is Empty <span>(0)</span>
						</div>
						<!---start-cart-bag---->
						<li><a class="info" href="#"><span> </span></a></li>
					</ul>
				</div>
				<div class="top-header-center">
					<div class="top-header-center-alert-left">
						<h3>FREE DELIVERY</h3>
					</div>
					<div class="top-header-center-alert-right">
						<div class="vticker">
							<ul>
								<li>Applies to orders of $50 or more. <label>Returns
										are always free.</label></li>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="top-header-right">
					<ul>
						<%
							UserInfo currentUser = (UserInfo) session
									.getAttribute("CurrentUserInfo");
							if (currentUser == null || currentUser.getUsername() == null) {
						%>
						<li><a href="login.html">Login</a><span> </span></li>
						<li><a href="register.jsp">Join</a></li>
						<%
							} else {
						%>
						<li><a href="">Welcome <%=currentUser.getUsername()%></a></li>
						<%
							}//end of if
						%>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!----start-mid-head---->
		<div class="mid-header">
			<div class="wrap">
				<div class="mid-grid-left">
					<form id="SearchFrm" name="SearchFrm" action="Search" method="post">
						<input type="text" Name="SearchKeyword"
							placeholder="What Are You Looking for?"
							onKeyPress="return submitSearch(this,event)" />
					</form>
				</div>
				<div class="mid-grid-right">
					<a class="logo" href="index.html"><span> </span></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!----//End-mid-head---->
		<!----start-bottom-header---->
		<jsp:include page="menu.jsp" flush="true" />
		<!----//End-bottom-header---->
	</div>
	<!---//End-header---->
</body>
</html>