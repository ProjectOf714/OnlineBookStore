<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Architecture | Products</title>
<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
</script>
<!----webfonts---->

<!----//webfonts---->
<!----start-alert-scroller---->
<script src="js/jquery.min.js"></script>
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
<!---slider---->
<link rel="stylesheet" href="css/slippry.css">
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
<script>
	jQuery('#jquery-demo').slippry({
		// general elements & wrapper
		slippryWrapper : '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
		// options
		adaptiveHeight : false, // height of the sliders adapts to current slide
		useCSS : false, // true, false -> fallback to js if no browser support
		autoHover : false,
		transition : 'fade'
	});
</script>
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
</head>
<body>
	<!---start-wrap---->
	<!---start-header---->
	<jsp:include page="header.jsp" flush="true" />
	<!---//End-header---->
	<!----start-image-slider---->
	<div class="content product-box-main">
		<div class="wrap">
			<div class="content-left">
				<div class="content-left-top-brands">
					<h3>Categories</h3>
					<ul>
						<li><a href="">Buildings</a></li>
						<li><a href="">Criticism</a></li>
						<li><a href="">Decoration & Ornament</a></li>
						<li><a href="">Drafting & Presentation</a></li>
						<li><a href="">Historic Preservation</a></li>
						<li><a href="">History</a></li>
						<li><a href="">Individual Architects & Firms</a></li>
						<li><a href="">Interior Design</a></li>
						<li><a href="">Landscape</a></li>
						<li><a href="">Project Planning & Management</a></li>
						<li><a href="">Regional</a></li>
						<li><a href="">Systainability & Green Design</a></li>
						<li><a href="">Urban & Land Use Planning</a></li>
					</ul>
				</div>
			</div>
			<div class="content-right product-box">
				<div class="product-box-head">
					<div class="product-box-head-left">
						<h3>
							Products <span>(1203)</span>
						</h3>
					</div>
					<div class="product-box-head-right">
						<ul>
							<li><span>Sort ::</span><a href=""> </a></li>
							<li><label> </label> <a href=""> Popular</a></li>
							<li><label> </label> <a href=""> New</a></li>
							<li><label> </label> <a href=""> Discount</a></li>
							<li><span>Price ::</span><a href="">Low </a><a href="">High</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="product-grids">
					<!--- start-rate---->
					<script src="js/jstarbox.js"></script>
					<link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" />
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
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (63)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product1.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Barbara Westbrook: Gracious Rooms</a> <a href=""><small>Author:
								</small>Barbara Westbrook</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 32.72</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (26)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product2.jpg"
								title="product-name" /></a>
							<p>
								<a href="">India Hicks: Island Style</a> <a href=""><small>Author:
								</small>India Hicks</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 29.61</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade last-grid"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (23)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product3.jpg"
								title="product-name" /></a>
							<p>
								<a href="">The Future of Architecture in 100 Buildings (TED
									Books)</a> <a href=""><small>Author: </small>Marc Kushner</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 11.45</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (12)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product4.jpg"
								title="product-name" /></a>
							<p>
								<a href="">San Francisco: A Map of Perceptions</a> <a href=""><small>Author:
								</small>Andrea Ponsi</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 17.45</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (46)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product5.jpg"
								title="product-name" /></a>
							<p>
								<a href="">BIG, HOT TO COLD: An Odyssey of Architectural
									Adaption</a> <a href=""><small>Arthor: </small>Bjarke Ingels</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 33.48</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade last-grid"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (79)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product6.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Tactical Urbanism: Short-term Action for
									Long-term Change</a> <a href=""><small>Author: </small>Mike
									Lydon</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 18.48</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (46)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product7.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Private Gardens of Paries</a> <a href=""><small>Author:
								</small>Bruno de Laubadere</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 26.21</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (46)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product8.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Nantucket Cottages and Gardens: Charming Spaces
									on the Faraway Isle</a> <a href=""><small>Author: </small>Leslie
									Linsley</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 24.92</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="product-grid fade last-grid"
						onclick="location.href='details.html';">
						<div class="product-grid-head">
							<div class="block">
								<div class="starbox small ghosting"></div>
								<span> (46)</span>
							</div>
						</div>
						<div class="product-pic">
							<a href=""><img src="images/Architecture-Product9.jpg"
								title="product-name" /></a>
							<p>
								<a href="">Windsor Smith Homefront: Design for Modern Living
								</a> <a href=""><small>Author: </small>Windsor Smith</a>
							</p>
						</div>
						<div class="product-info">
							<div class="product-info-cust">
								<a href="details.html">Details</a>
							</div>
							<div class="product-info-price">
								<a href="details.html">$ 32.72</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="more-product-info">
							<span> </span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<!----start-load-more-products---->
				<div class="loadmore-products">
					<a href="">Loadmore Books</a>
				</div>
				<!----//End-load-more-products---->
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

