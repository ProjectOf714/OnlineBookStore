<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<%
	BookInfo currentBook = new BookInfo();
	Object objISBN = request.getParameter("isbn");
	if (objISBN != null && objISBN != "") {
		BookDao bd = new BookDao();
		int isbn = Integer.valueOf(objISBN.toString());
		currentBook = bd.getBookByISBN(isbn);
		if (currentBook == null) {
	currentBook=new BookInfo();
		}
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<title><%=currentBook.getTitle()%> | Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/scripts-f0e4e0c2.js"></script>
<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<!-- Owl Carousel Assets -->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css">
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
<!----details-product-slider--->
<!-- Include the Etalage files -->
<link href="css/etalage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.etalage.min.js"></script>
<!-- Include the Etalage files -->
<script>
	$(function() {
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
<!----//details-product-slider--->
<!--- start-rate---->
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
	<!--- start-content---->
	<div class="content details-page">
		<!---start-product-details--->
		<div class="product-details">
			<div class="wrap">
				<ul class="product-head">
					<li><a href="index.jsp">Home</a> <span>::</span></li>
					<li class="active-page"><a href="#">Product Page</a></li>
					<!-- 					<div class="clear"></div> -->
				</ul>
				<div class="details-left">
					<div class="details-left-slider">
						<ul id="etalage">
							<li><img class="etalage_thumb_image"
								src="images/product-slide/<%=currentBook.getImage1Thumb()%>" />
								<img class="etalage_source_image"
								src="images/product-slide/<%=currentBook.getImage1Large()%>" /></li>
							<li><img class="etalage_thumb_image"
								src="images/product-slide/<%=currentBook.getImage2Thumb()%>" />
								<img class="etalage_source_image"
								src="images/product-slide/<%=currentBook.getImage2Large()%>" /></li>
						</ul>
					</div>
					<div class="details-left-info">
						<div class="details-right-head">
							<h1><%=currentBook.getTitle()%></h1>
							<ul class="pro-rate">
								<li>Author: <%=currentBook.getAuthor()%></li>
							</ul>
							<ul class="pro-rate">
								<li><a class="product-rate" href="#"> <label> </label></a>
									<span><%=currentBook.getRating()%> custome reviews</span></li>
							</ul>
							<p class="product-detail-info">
								<%=currentBook.getDescription_P1()%></p>

							<div class="product-more-details">
								<ul class="price-avl">
									<li class="price"><span>$41.99</span><label>$<%=currentBook.getPrice()%></label></li>
									<li class="stock"><i>In stock (<%=currentBook.getStockQuantity()%>)
									</i></li>
									<div class="clear"></div>
								</ul>
								<ul class="prosuct-qty">
									<span>Quantity:</span>
									<select>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
									</select>
								</ul>
								<form name="frmAddToCate" action="AddToCartServlet"
									method="POST">
									<input type="hidden" name="isbn"
										value="<%=currentBook.getISBN()%>"> <input
										type="hidden" name="action" value="add"> <input
										type="submit" name="btnAddCart" value="add to cart" />
								</form>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="details-right">
					<a href="WebDesign-Products.html">SEE MORE</a>
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
					<div id="verticalTab">
						<ul class="resp-tabs-list">
							<li>Information</li>
							<li>Comments</li>
							<li>Deal Records</li>
							<li>Price Trends</li>
						</ul>
						<div class="resp-tabs-container vertical-tabs">
							<div>
								<h3>Information</h3>
								<h1>Product Details</h1>
								<p>Series:Missing Manual</p>
								<p>
									Paperback:
									<%=currentBook.getPaperback()%></p>
								<p>
									Publisher:
									<%=currentBook.getPublisher()%></p>
								<p>Language: English</p>
								<p>
									ISBN:
									<%=currentBook.getISBN()%></p>
								<p>
									Product Dimensions:
									<%=currentBook.getProductDimensions()%></p>
								<p>
									Shipping Weight:
									<%=currentBook.getShippingWeight()%></p>
								<h1>About the author</h1>
								<p>David Pogue is the anchor columnist for Yahoo Tech,
									having been groomed for the position by 13 years as the tech
									columnist for the New York Times. He's also a monthly columnist
									for Scientific American, host of science shows on PBS's "NOVA,"
									and two-time Emmy-winning correspondent for "CBS Sunday
									Morning." With over 3 million books in print, David is one of
									the world's bestselling how-to authors. He wrote or co-wrote
									seven books in the "for Dummies" series (including Macs, Magic,
									Opera, and Classical Music); in 1999, he launched his own
									series of complete, funny computer books called the Missing
									Manual series, which now includes 120 titles.</p>
								<h1>From the Publisher</h1>
								<strong>What's Inside 'OS X Yosemite: The Missing
									Manual'</strong>
								<p>OS X is an impressive technical achievement; many experts
									call it the best personal-computer operating system on earth.</p>
								<p>OS X Yosemite is the 10th major version of Apple&rsquo;s
									Unix-based operating system. It&rsquo;s got very little in
									common with the original Mac operating system, the one that saw
									Apple through the 1980s and 1990s. Apple dumped that in 2001,
									when CEO Steve Jobs decided it was time for a change. Apple had
									just spent too many years piling new features onto a software
									foundation originally poured in 1984. Programmers and customers
									complained of the &ldquo;spaghetti code&rdquo; the Mac OS had
									become. So underneath OS X&rsquo;s classy, translucent desktop
									is Unix, the industrial-strength, rock-solid OS that drives
									many a Web site and university. It&rsquo;s not new by any
									means; in fact, it&rsquo;s decades old and has been polished by
									generations of programmers.</p>
								<p>OS X Yosemite: The Missing Manual is divided into six
									parts, each containing several chapters:</p>
								<p>Part One: The OS X Desktop covers everything you see on
									the screen when you turn on an OS X computer: folders, windows,
									icons, the Dock, the Sidebar, Spotlight, Dashboard, Spaces,
									Mission Control, Launchpad, Time Machine, menus, scroll bars,
									the Trash, aliases, the a menu, and so on.</p>
								<p>Part Two: Programs in OS X is dedicated to the
									proposition that an operating system is little more than a
									launchpad for programs&mdash;the actual applications you use:
									email programs, Web browsers, word processors, graphics suites,
									and so on. These chapters describe how to work with
									applications in OS X&mdash;how to open them, switch among them,
									swap data between them, and use them to create and open files.</p>
								<p>Part Three: The Components of OS X is an item-by-item
									discussion of the software nuggets that make up this operating
									system&mdash;the 30-ish panels of System Preferences and the
									50-some programs in your Applications and Utilities folders.</p>
								<p>Part Four: The Technologies of OS X treads in more
									advanced territory, like networking and file sharing. These
									chapters also cover the visual talents of OS X (fonts,
									printing, graphics) and its multimedia gifts (sound, speech,
									movies).</p>
								<p>Part Five: OS X Online covers all the Internet features
									of OS X, including the Mail email program and the Safari Web
									browser; Messages for instant messaging and audio or video
									chats; Internet sharing; Apple&rsquo;s free, online iCloud
									services; and connecting to and controlling your Mac from
									across the wires&mdash;FTP, SSH, VPN,and so on.</p>
								<p class="a-spacing-base">Part Six: Appendixes. This
									book&rsquo;s appendixes include guidance on installing this
									operating system; a troubleshooting handbook; a Windows-to-Mac
									dictionary (to help Windows refugees find the new locations of
									familiar features in OS X); and a thorough master list of all
									the keyboard shortcuts and trackpad/mouse gestures in Yosemite.</p>
							</div>

							<div>
								<h3>Comments</h3>
								<h4>There are no customer comments yet.</h4>
							</div>
							<div>
								<h3>Deal Records</h3>
								<h4>There are no deal records yet.</h4>
							</div>
							<div>
								<h3>Price Trends</h3>
								<h4>There are no price trends yet.</h4>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<!--- start-similar-products--->
					<div class="similar-products">
						<div class="similar-products-left">
							<h3>SIMILAR PRODUCTS</h3>
							<p>What Other Items Do Customers Buy After Viewing This Item?</p>
						</div>
						<div class="similar-products-right">
							<!-- start content_slider -->

							<div id="owl-demo" class="owl-carousel">
								<%
									BookDao bd = new BookDao();
									bd.getBookByRate();
									List<BookInfo> lstBook = bd.getLstBookInfo();
									for (BookInfo book : lstBook) {
										if (book.getISBN() == currentBook.getISBN())
											continue;
								%>
								<div class="item"
									onclick="location.href='details.jsp?isbn=<%=book.getISBN()%>';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href="details.jsp?isbn=<%=book.getISBN()%>"><img
												src="images/<%=book.getProductImage()%>"
												title="product-name" /></a>
											<p>
												<a href="details.jsp?isbn=<%=book.getISBN()%>"><%=book.getTitle()%></a>
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
								</div>
								<%
									}//end for
								%>
								<div class="item" onclick="location.href='details.html';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href="#"><img src="images/WebDesign-Product2.jpg"
												title="product-name" /></a>
											<p>
												<a href="#">HTML and CSS: Design and Build Websites</a> <a
													href=""><small>Author: </small>Jon Duckett</a>
											</p>
										</div>
										<div class="product-info">
											<div class="product-info-cust">
												<a href="details.html">Details</a>
											</div>
											<div class="product-info-price">
												<a href="details.html">$ 17.39</a>
											</div>
											<div class="clear"></div>
										</div>
										<div class="more-product-info">
											<span> </span>
										</div>
									</div>
								</div>
								<div class="item" onclick="location.href='details.html';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href=""><img src="images/WebDesign-Product3.jpg"
												title="product-name" /></a>
											<p>
												<a href="">Growth Hacker Marketing: A Primer on the
													Future of PR, Marketing, and Advertising</a> <a href=""><small>Author:
												</small>Ryan Holiday</a>
											</p>
										</div>
										<div class="product-info">
											<div class="product-info-cust">
												<a href="details.html">Details</a>
											</div>
											<div class="product-info-price">
												<a href="details.html">$ 8.75</a>
											</div>
											<div class="clear"></div>
										</div>
										<div class="more-product-info">
											<span> </span>
										</div>
									</div>
								</div>
								<div class="item" onclick="location.href='details.html';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href=""><img src="images/WebDesign-Product4.jpg"
												title="product-name" /></a>
											<p>
												<a href="">The Art of Social Media: Power Tips for Power
													Users</a> <a href=""><small>Author: </small>Guy Kawasaki</a>
											</p>
										</div>
										<div class="product-info">
											<div class="product-info-cust">
												<a href="details.html">Details</a>
											</div>
											<div class="product-info-price">
												<a href="details.html">$ 19.23</a>
											</div>
											<div class="clear"></div>
										</div>
										<div class="more-product-info">
											<span> </span>
										</div>
									</div>
								</div>
								<div class="item" onclick="location.href='details.html';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href=""><img src="images/WebDesign-Product5.jpg"
												title="product-name" /></a>
											<p>
												<a href="">The Age of Cryptocurrency: How Bitcoin and
													Digital Money Are Challenging the Global Economic Order</a> <a
													href=""><small>Arthor: </small>Michael J, Casey</a>
											</p>
										</div>
										<div class="product-info">
											<div class="product-info-cust">
												<a href="details.html">Details</a>
											</div>
											<div class="product-info-price">
												<a href="details.html">$ 19.46</a>
											</div>
											<div class="clear"></div>
										</div>
										<div class="more-product-info">
											<span> </span>
										</div>
									</div>
								</div>
								<div class="item" onclick="location.href='details.html';">
									<div class="product-grid fade sproduct-grid">
										<div class="product-pic">
											<a href=""><img src="images/WebDesign-Product7.jpg"
												title="product-name" /></a>
											<p>
												<a href="">Don't Make Me Think, Revisited: A Common
													Sense Approach to Web Usability (3rd Edition)</a> <a href=""><small>Author:
												</small>Steve Krug</a>
											</p>
										</div>
										<div class="product-info">
											<div class="product-info-cust">
												<a href="details.html">Details</a>
											</div>
											<div class="product-info-price">
												<a href="details.html">$ 30.02</a>
											</div>
											<div class="clear"></div>
										</div>
										<div class="more-product-info">
											<span> </span>
										</div>
									</div>
								</div>
							</div>
							<!----//End-img-cursual---->
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!--- //End-similar-products--->
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

