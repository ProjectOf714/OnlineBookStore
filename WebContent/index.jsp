<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
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
<!---slider---->
<link href="css/slippry.css" rel="stylesheet" type="text/css">
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
<!---slider---->
<!--- start-Rate---->
<script type="text/javascript" src="js/jstarbox.js"></script>
<link href="css/jstarbox.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript">
	$(function() {
		$('.starbox')
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
											function(event, value) {
												if (starbox.hasClass('random')) {
													var val = Math.random();
													starbox.next().text(
															' ' + val);
													return val;
												}
											})
						});
	});
</script>
<!---//End-rate---->

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
								<a href="">&nbsp;100 Biographies &amp; Memoirs to Read in a
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
					<%
						BookDao bd = new BookDao();
						bd.getBookByRate();
						List<BookInfo> lstBook = bd.getLstBookInfo();

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
									<a href="details.jsp?isbn=<%=book.getISBN()%>">Details</a>
								</div>
								<div class="product-info-price">
									<a href="details.jsp?isbn=<%=book.getISBN()%>">$ <%=book.getPrice()%></a>
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

