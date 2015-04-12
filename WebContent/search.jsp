<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Bookstore</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<!--- start-content---->
	<div class="content">
		<div class="wrap">
			<div class="content-left"></div>
			<div class="content-right">
				<div class="product-grids">
					<!--- start-rate---->
					<script src="js/jstarbox.js"></script>
					<link rel="stylesheet" href="css/jstarbox.css" type="text/css"
						media="screen" />
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
					<%
						List<BookInfo> lstBook = new ArrayList<BookInfo>();

						BookDao bdSession = (BookDao) session.getAttribute("serachResult");
						if (bdSession != null) {
							lstBook = bdSession.getLstBookInfo();
						}
						int index = 1;
						for (BookInfo book : lstBook) {
							if (index % 3 == 0) {
					%>
					<div class="product-grid fade last-grid"
						onclick="location.href='details.jsp?isbn=<%=book.getISBN()%>';">
						<%
							} else {
						%>
						<div class="product-grid fade"
							onclick="location.href='details.jsp?isbn=<%=book.getISBN()%>';">
							<%
								}// if index
							%>
							<div class="product-grid-head">
								<div class="block">
									<div class="starbox small ghosting"></div>
									<span> (<%=book.getRating()%>)
									</span>
								</div>
							</div>
							<div class="product-pic">
								<a href="details.jsp?isbn=<%=book.getISBN()%>"><img
									src="images/<%=book.getProductImage()%>" title="product-name" /></a>
								<p>
									<a href="details.jsp?isbn=<%=book.getISBN()%>"> <%=book.getTitle()%></a>
									<a href="details.jsp?isbn=<%=book.getISBN()%>"><small>Author:
									</small><%=book.getAuthor()%></a>
								</p>
							</div>
							<div class="product-info">
								<div class="product-info-cust">
									<a href="details.jsp?isbn=<%=book.getISBN()%>.html">Details</a>
								</div>
								<div class="product-info-price">
									<a href="details.jsp?isbn=<%=book.getISBN()%>.html">$ <%=book.getPrice()%></a>
								</div>
								<div class="clear"></div>
							</div>
							<div class="more-product-info">
								<span> </span>
							</div>
						</div>
						<%
							index++;
							}//end for
						%>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
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

