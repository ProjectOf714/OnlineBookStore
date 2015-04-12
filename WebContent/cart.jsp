<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<%
	List<ShoppingCart> lstCart= new ArrayList<ShoppingCart>();
	CartDao cdSession = (CartDao) session.getAttribute("cart");
	if (cdSession == null) {
		UserInfo currentUser = (UserInfo) session
		.getAttribute("CurrentUserInfo");
		if (currentUser != null && currentUser.getUsername() != "") {
	cdSession = new CartDao();
	cdSession.RetrieveByUserID(currentUser);
	// set session attribute "cart"
	session.setAttribute("cart", cdSession);
		}
	}
	
	if (cdSession != null) {
		lstCart = cdSession.getLstCart();
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cart | Online Bookstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="css/slippry.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<!-- Owl Carousel Assets -->
<link href="css/owl.carousel.css" rel="stylesheet">
<!-- Owl Carousel Assets -->
<!-- Prettify -->
<script src="js/owl.carousel.js"></script>
<script>
	$(function() {
		$("#owl-demo").owlCarousel({
			items : 3,
			lazyLoad : true,
			autoPlay : true,
			navigation : true,
			navigationText : [ "", "" ],
			rewindNav : false,
			scrollPerPage : false,
			pagination : false,
			paginationNumbers : false,
		});

		$('#etalage')
				.etalage(
						{
							thumb_image_width : 300,
							thumb_image_height : 400,
							source_image_width : 900,
							source_image_height : 1000,
							show_hint : true,
							click_callback : function(image_anchor, instance_id) {
								alert('Callback example:\nYou clicked on an image with the anchor: "'
										+ image_anchor
										+ '"\n(in Etalage instance: "'
										+ instance_id + '")');
							}
						});
		// This is for the dropdown list example:
		$('.dropdownlist').change(function() {
			etalage_show($(this).find('option:selected').attr('class'));
		});

	});
</script>
<!-- //Owl Carousel Assets -->
<!-- Include the Etalage files -->
<link rel="stylesheet" href="css/etalage.css" type='text/css'>
<script src="js/jquery.etalage.min.js"></script>
<!-- Include the Etalage files -->
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="header.jsp" flush="true" />
	<!---//End-header---->
	<!--- start-content---->
	<div class="content details-page">
		<!---start-product-details--->
		<div class="product-details">
			<div class="wrap">
				<ul class="product-head">
					<li><a href="index.jsp">Home</a> <span>::</span></li>
					<li class="active-page"><a href="#">Cart Page</a></li>
					<!-- 					<div class="clear"></div> -->
				</ul>
				<div class="details-left">
					<div class="mainContainer sixteen container">
						<!--Content Block-->

						<section class="content-wrapper">
							<div class="content-container container">
								<div class="col-1-layout">
									<ul class="shopping-cart-table">
										<%
											for (ShoppingCart cart : lstCart) {
										%>
										<li>
											<div class="img-box">
												<img src="images/<%=cart.getBookItem().getProductImage()%>"
													title="" alt="" />
											</div>
										</li>
										<li>
											<div class="remove-item-btn">
												<form name="frmRemove" action="AddToCartServlet"
													method="POST">
													<input type="hidden" name="Action" value="remove">
													<input type="hidden" name="isbn"
														value="<%=cart.getISBN()%>"> <a
														href="javascript:;" onclick="parentNode.submit();"
														title="Remove"><img src="images/delete_item_btn.png"
														title="Remove" alt="Remove" /></a>
												</form>
											</div>
											<div class="pro-name"><%=cart.getBookItem().getTitle()%></div>
											<div class="pro-qty">
												<form name="frmUpdateQty" action="AddToCartServlet"
													method="POST">
													<input type="text" name="txtQty"
														value="<%=cart.getQuantity()%>" /> <input type="hidden"
														name="isbn" value="<%=cart.getISBN()%>"> <a
														href="javascript:;" onclick="parentNode.submit();"
														title="Update"><img src="images/update_item_btn.png"
														title="Update" alt="Update" /></a> <input type="hidden"
														name="Action" value="updateQty">
												</form>
											</div>
											<div class="pro-price">$ 26.51</div>
										</li>
										<%
											}//end for
										%>
									</ul>
									<!-- 									<div class="show-option-block"> -->
									<!-- 										<a href="#" title="Show Options">Show Options</a> -->
									<!-- 									</div> -->
									<!-- 									<div class="update-shopping-cart"> -->
									<!-- 										<button class="colors-btn">Update Shopping Cart</button> -->
									<!-- 									</div> -->
									<div class="shopping-cart-collaterals">
										<div class="cart-box">
											<div class="box-title">Discount Codes</div>
											<div class="box-content">
												<p>Enter your coupon code if you have one.</p>
												<input type="text" />
											</div>

											<button class="colors-btn" title="Apply Coupon">Apply
												Coupon</button>
										</div>
										<div class="cart-box">
											<div class="box-title">Estimate Shipping and Tax</div>
											<div class="box-content">
												<p>Enter your destination to get a shipping estimate</p>
												<ul>
													<li><label>Country<em>*</em></label> <select>
															<option>China</option>
															<option>United States</option>
													</select></li>
													<li><label>State/Province</label> <select>
															<option>BeiJing</option>
															<option>Hong Kong</option>
															<option>Macau</option>
													</select></li>
													<li><label>Zip/Postal Code</label> <input type="text" />
													</li>
												</ul>
											</div>
											<button class="colors-btn" title="Get a Quote">Get a
												Quote</button>
										</div>
									</div>
									<div class="shopping-cart-totals">
										<div class="subtotal-row">
											<div class="left">Subtotal</div>
											<div class="right">$1,000,00</div>
										</div>
										<div class="grand-row">
											<div class="left">Grand Total</div>
											<div class="right">$1,000.00</div>
										</div>
										<ul class="checkout-types">
											<li><button class="colors-btn"
													title="Proceed to Checkout">Proceed to Checkout</button></li>
										</ul>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</section>
					</div>
					<div class="clear"></div>
				</div>
				<!----product-rewies---->
				<div class="product-reviwes">
					<div class="wrap">
						<!--vertical Tabs-script-->
						<!---responsive-tabs---->
						<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
						<script type="text/javascript">
							$(document).ready(function() {
								$('#horizontalTab').easyResponsiveTabs({
									type : 'default', //Types: default, vertical, accordion           
									width : 'auto', //auto or any width like 600px
									fit : true, // 100% fit in a container
									closed : 'accordion', // Start closed if in accordion view
									activate : function(event) { // Callback function if tab is switched
										var $tab = $(this);
										var $info = $('#tabInfo');
										var $name = $('span', $info);
										$name.text($tab.text());
										$info.show();
									}
								});

								$('#verticalTab').easyResponsiveTabs({
									type : 'vertical',
									width : 'auto',
									fit : true
								});
							});
						</script>
						<!---//responsive-tabs---->
						<!--//vertical Tabs-script-->
						<!--vertical Tabs-->
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
				<!--//vertical Tabs-->
				<!----//product-rewies---->
				<!---//End-product-details--->
			</div>
		</div>
	</div>
	<!--- //End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp" flush="true" />
	<!---//End-footer---->
	<!---//End-wrap---->
</body>
</html>

