<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<%
	//Set CategoryDao to session
	CategoryDao cateDao = (CategoryDao) session
	.getAttribute("categorylist");
	if (cateDao == null) {
		cateDao = new CategoryDao(true);
		session.setAttribute("categorylist", cateDao);
	}

	Object cateID = request.getAttribute("choosedCategoryID");
	Object subCateID = request.getAttribute("choosedSubCategoryID");
	if (cateID == null)  {
	  cateID = request.getParameter("cateID");
	}
	
	if (subCateID == null)  {
		subCateID = request.getParameter("subCateID");
	}
	
	int choosedCategoryID=0;
	int choosedSubCategoryID=0;
	if (cateID != null && subCateID != null) {
		choosedCategoryID = Integer.valueOf(cateID
		.toString());
		choosedSubCategoryID =Integer.valueOf(subCateID.toString());
		String cateName = cateDao.GetCateName(choosedCategoryID);
		String subCatename = cateDao.GetSubCateName(
		choosedCategoryID,
		choosedSubCategoryID);
%>
<title><%=cateName%> | <%=subCatename%> | Products</title>
<%
	} else {
%>
<title>Products</title>
<%
	} // end if
%>

<link rel="icon" type="image/x-icon" href="images/icon.jpg" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<div class="content product-box-main">
		<div class="wrap">
			<div class="content-left">
				<div class="content-left-top-brands">
					<h3>Categories</h3>
					<ul>
						<%
							if (choosedCategoryID > 0) {
								Iterator<Subcategory> subIterator = cateDao.getSubCategory(
										choosedCategoryID).iterator();
								while (subIterator.hasNext()) {
									Subcategory currSub = (Subcategory) subIterator.next();
						%>
						<li><a
							href="product.jsp?cateID=<%=currSub.getCategoryID()%>&subCateID=<%=currSub.getSubCategoryID()%>"><%=currSub.getSubCategoryName()%></a></li>
						<%
							}//end of while subIterator.hasNext()							
							}//end if
						%>
						<li><a href="">General Management</a></li>
						<li><a href="">Programming</a></li>
						<li><a href="">User Experience</a></li>
						<li><a href="">Usability</a></li>
						<li><a href="">User Generated Content</a></li>
						<li><a href="">Web Design</a></li>
						<li><a href="">Web Marketing</a></li>
						<li><a href="">Web Services</a></li>
						<li><a href="">Web Analytics</a></li>
					</ul>
				</div>
			</div>
			<div class="content-right product-box">
				<div class="product-box-head">
					<div class="product-box-head-left">
						<h3>
							Products <span>(11354)</span>
						</h3>
					</div>
					<div class="product-box-head-right">
						<ul>
							<li><span>Sort ::</span><a href=""> </a></li>
							<li><label> </label> <a href="product.jsp?SortItem=Popular">
									Popular</a></li>
							<li><label> </label> <a href="product.jsp"> New</a></li>
							<li><label> </label> <a href=""> Discount</a></li>
							<li><span>Price ::</span><a
								href="product.jsp?SortItem=PriceASC">Low </a><a
								href="product.jsp?SortItem=PriceDESC">High</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="product-grids">
					<%
						String strSortItem = request.getParameter("SortItem");
						BookDao bd = new BookDao();

						List<BookInfo> lstBook = bd.getBookBySubcategory(
								choosedSubCategoryID, strSortItem);
						int index = 1;

						for (BookInfo book : lstBook) {
							if (index % 3==0) {
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
					<!----start-load-more-products---->
					<div class="loadmore-products">
						<a href="">Loadmore Books</a>
					</div>
					<!----//End-load-more-products---->
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

