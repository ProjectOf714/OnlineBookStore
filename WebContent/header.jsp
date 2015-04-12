<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Header - Online Bookstore</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.vticker').easyTicker();	
	});
	
	function submitSearch(myfield, e) {
		var keycode;
		if (window.event)
			keycode = window.event.keyCode;
		else if (e)
			keycode = e.which;
		else
			return true;
	
		if (keycode == 13) {
			myfield.form.submit();
			return false;
		} else
			return true;
	}

	<!---cart-tonggle-script---->
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
	<!---//cart-tonggle-script---->
</script>
</head>
<body>
	<!---start-header---->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="top-header-left">
					<ul>
						<li><a class="cart" href="#"><span id="clickme"> </span></a></li>
						<!---start-cart-bag---->
						<div id="cart">
							<%
								List<ShoppingCart> lstCart = new ArrayList<ShoppingCart>();
								CartDao cdSession = (CartDao) session.getAttribute("cart");
								if (cdSession != null) {
									lstCart = cdSession.getLstCart();
								}
								if (lstCart == null || lstCart.isEmpty()) {
									out.println("Your Cart is Empty <span>(0)</span>");
								} else {
									out.println(String
											.format("Your have %d books in the cart.<a class=\"cart\" href=\"cart.jsp\">view</a>",
													lstCart.size()));

								}//end of lstCart
							%>
						</div>
						<li><a class="info" href="#"><span> </span></a></li>
					</ul>
				</div>
				<!---end-cart-bag---->
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
						<li><a href="login.jsp">Login</a><span> </span></li>
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
					<a class="logo" href="index.jsp"><span> </span></a>
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