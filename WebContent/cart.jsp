<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cart | Online Bookstore</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery.min.js"></script>
<!----start-alert-scroller---->
<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#demo').hide();
		$('.vticker').easyTicker();
	});
</script>
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
<script src="js/menu_jquery.js"></script>
<!-- //End menu -->
<!---move-top-top---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
<!---//move-top-top---->
<!-- Owl Carousel Assets -->
<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/jquery-1.9.1.min.js"></script>
<!-- Owl Carousel Assets -->
<!-- Prettify -->
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() {

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

	});
</script>
<!-- //Owl Carousel Assets -->
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
					<div class="clear"></div>
				</ul>
				<!----details-product-slider--->
				<!-- Include the Etalage files -->
				<link rel="stylesheet" href="css/etalage.css">
				<script src="js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
					jQuery(document)
							.ready(
									function($) {
										$('#etalage')
												.etalage(
														{
															thumb_image_width : 300,
															thumb_image_height : 400,
															source_image_width : 900,
															source_image_height : 1000,
															show_hint : true,
															click_callback : function(
																	image_anchor,
																	instance_id) {
																alert('Callback example:\nYou clicked on an image with the anchor: "'
																		+ image_anchor
																		+ '"\n(in Etalage instance: "'
																		+ instance_id
																		+ '")');
															}
														});
										// This is for the dropdown list example:
										$('.dropdownlist').change(
												function() {
													etalage_show($(this).find(
															'option:selected')
															.attr('class'));
												});

									});
				</script>
				<!----//details-product-slider--->
				<div class="details-left">
					<div class="mainContainer sixteen container">
						<!--Content Block-->
						<section class="content-wrapper">
							<div class="content-container container">
								<div class="col-1-layout">
									<ul class="shopping-cart-table">
										<%
											List<ShoppingCart> lstCart= new ArrayList<ShoppingCart>();
																										
																																																													CartDao cdSession = (CartDao) session.getAttribute("cart");
																																																												if (cdSession != null) {
																																																											lstCart = cdSession.getLstCart();
																																																												}
																																																												
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
													<input type="hidden" name="action" value="remove">
													<input type="hidden" name="isbn"
														value="<%=cart.getISBN()%>"> <a href="#"
														title="Remove"><img src="images/delete_item_btn.png"
														title="Remove" alt="Remove" /></a>
												</form>
											</div>
											<div class="pro-name"><%=cart.getBookItem().getTitle()%></div>
											<div class="pro-qty">
												<form name="frmUpdateQty" action="AddToCartServlet"
													method="POST">
													<input type="text" name="txtQty" value="1" /> <input
														type="hidden" name="isbn" value="<%=cart.getISBN()%>">
													<a href="javascript:;" onclick="parentNode.submit();"
														title="Update"><img src="images/update_item_btn.png"
														title="Update" alt="Update" /></a> <input type="hidden"
														name="action" value="updateQty">
												</form>
											</div>
											<div class="pro-price">$ 26.51</div>
										</li>
										<%
											}//end for
										%>
									</ul>
									<div class="show-option-block">
										<a href="#" title="Show Options">Show Options</a>
									</div>
									<div class="update-shopping-cart">
										<button class="colors-btn">Update Shopping Cart</button>
									</div>
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
												<p>Enter your destnation to get a shipping estimate</p>
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
		<!--- //End-content---->
		<!---start-footer---->
		<jsp:include page="footer.jsp" flush="true" />
		<!---//End-footer---->
		<!---//End-wrap---->
</body>
</html>

