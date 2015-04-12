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
<!--- start-rate---->
<script type="text/javascript" src="js/jstarbox.js"></script>
<link href="css/jstarbox.css" rel="stylesheet" type="text/css" />
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
	<!--- start-content---->
	<div class="content">
		<div class="wrap">
			<div class="content-left"></div>
			<div class="content-right">
				<div class="product-grids">
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

