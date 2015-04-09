<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Bookstore</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script type="application/x-javascript"> -->	
// 	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
<!-- </script> -->
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
<!--script src="js/menu_jquery.js"></script-->
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
</script>
<!---//move-top-top---->
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="header.jsp" flush="true" />	
	<!---//End-header---->
	<!----start-image-slider---->
	<div class="img-slider">
		<div class="wrap">
			<ul id="jquery-demo">
				<li><a href="#slide1"> <img src="images/slide-1.jpg" alt="" />
				</a>
					<div class="slider-detils">
						<h3>
							Hottest TV Show <label>Original Books</label>
						</h3>
						<span>Watching The TV, Reading The Book</span> <a
							class="slide-btn" href="details.html"> Shop Now</a>
					</div></li>
				<li><a href="#slide2"> <img src="images/slide-2.jpg" alt="" />
				</a>
					<div class="slider-detils">
						<h3>
							Take Textbooks Home<label>50% Off</label>
						</h3>
						<span>Welcome New Year, Welcome New Semister</span> <a
							class="slide-btn" href="details.html"> Shop Now</a>
					</div></li>
				<li><a href="#slide3"> <img src="images/slide-3.jpg" alt="" />
				</a>
					<div class="slider-detils">
						<h3>
							Share You Reading Notes<label>80% Off</label>
						</h3>
						<span>You Share, You Get</span> <a class="slide-btn"
							href="details.html"> Shop Now</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<!----//End-image-slider---->
	<!----start-price-rage--->
	<!----//End-price-rage--->
	<!--- start-content---->
	<div class="content">
		<div class="wrap">
			<div class="content-left">
				<div class="content-left-top-grid">
					<h3>Popular In Books</h3>
					<div class="content-left-bottom-grids">
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;Best Books of The Month</a>
							</h5>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;Books Made into Movies</a>
							</h5>
							<span>&nbsp;Read it before you see it</span>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;100 Books to Read in a Lifetime</a>
							</h5>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;Best Books of 2014</a>
							</h5>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;Award Winners</a>
							</h5>
						</div>
					</div>
				</div>
				<br />
				<div class="content-left-bottom-grid">
					<h3>More In Books</h3>
					<div class="content-left-bottom-grids">
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;100 Biographies & Memoirs to Read in a
									Lifetime</a>
							</h5>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;100 Children's Books to Read in a Lifetime</a>
							</h5>
						</div>
						<div class="content-left-bottom-grid1">
							<h5>
								<a href="">&nbsp;Popular Books on Facebook</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="content-right">
				<div class="product-grids">
					<!--- start-rate---->
					<script src="js/jstarbox.js"></script>
					<link rel="stylesheet" href="css/jstarbox.css" type="text/css"
						media="screen" charset="utf-8" />
					<script type="text/javascript">
						jQuery(function() {
							jQuery('.starbox')
									.each(
											function() {
												var starbox = jQuery(this);
												starbox
														.starbox(
																{
																	average : starbox
																			.attr('data-start-value'),
																	changeable : starbox
																			.hasClass('unchangeable') ? false
																			: starbox
																					.hasClass('clickonce') ? 'once'
																					: true,
																	ghosting : starbox
																			.hasClass('ghosting'),
																	autoUpdateAverage : starbox
																			.hasClass('autoupdate'),
																	buttons : starbox
																			.hasClass('smooth') ? false
																			: starbox
																					.attr('data-button-count') || 5,
																	stars : starbox
																			.attr('data-star-count') || 5
																})
														.bind(
																'starbox-value-changed',
																function(event,
																		value) {
																	if (starbox
																			.hasClass('random')) {
																		var val = Math
																				.random();
																		starbox
																				.next()
																				.text(
																						' '
																								+ val);
																		return val;
																	}
																})
											});
						});
					</script>
					<!---//End-rate---->
					<!---caption-script---->
					<!---//caption-script---->
					<div onClick="location.href='details.html';"
						class="product-grid fade">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (29)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product1.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Dead Wake: The Last Crossing of the Lusitania</a> <a
									href=""><small>Author: </small> Erik Larson </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 16.99</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div onClick="location.href='details.html';"
						class="product-grid fade">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (23)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product2.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Better Than Before: Mastering the Habits of Our
									Everyday Lifes</a> <a href=""><small>Author: </small> Gretchen
									Rubin </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 15.60</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div onClick="location.href='details.html';"
						class="product-grid fade last-grid">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (29)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product3.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Go Set a Watchman: A Novel</a> <a href=""><small>Author:
								</small> Harper Lee </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 16.79</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div onClick="location.href='details.html';"
						class="product-grid fade">
						<div class="product-grid-head">
							<ul class="grid-social">
								<div class="block">
									<div class="starbox small ghosting"></div>
									<span> (11)</span>
								</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product4.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Eat. Nourish. Glow.: 10 easy steps for losing
									weight, looking younger & feeling healthier</a> <a href=""><small>Author:
								</small> Amelia Freer </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 24.99</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div onClick="location.href='details.html';"
						class="product-grid fade">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (8)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product5.jpg"
								title="product-name" /></a>
							<p>
								<a href="">The Stranger</a> <a href=""><small>Author:
								</small> Harlan Coben </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 16.77</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div onClick="location.href='details.html';"
						class="product-grid fade last-grid">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (0)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/product6.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Make Me: A Jack Reacher Novel</a> <a href=""><small>Author:
								</small> Lee Child </a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 17.37</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--- //End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp" flush="true" />
	<!---//End-footer---->
	<!---//End-wrap---->
</body>
</html>

