<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ 
   page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>JSP List Category Records</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="js/jquery.min.js"></script>
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
</head>
<body>
	<FORM action="ShowCategory" method="post">
		<INPUT type="submit" name="Submit" value="Show">
	</FORM>
	<div class="header-bottom">
		<div class="wrap">
			<!-- start header menu -->
			<ul class="megamenu skyblue">
				<%-- begin JSP scriptlet to create list of category --%>
				<%
					CategoryDao cateDao = new CategoryDao(true);
					// obtain an Iterator to the set of keys in the List
					Iterator<Category> itCate = cateDao.getLstCategory().iterator();
					Category currCate;
					boolean isRoot = false;
					// use the Iterator to get each Category
					while (itCate.hasNext()) {
						currCate = (Category) itCate.next();

						if (currCate.getCategoryName().startsWith("A")
								|| currCate.getCategoryName().startsWith("B")) {
							if (!isRoot) {
				%>
				<li class="grid"><a class="color2" href="#">A, B</a>
					<div class="megapanel">
						<div class="row">
							<%
								isRoot = true;
										} //end of is Root
							%>
							<div class="col1">
								<div class="h_nav">
									<h4><%=currCate.getCategoryName()%></h4>
									<ul>
										<%
											Iterator<Subcategory> subIterator = cateDao.getSubCategory(
															currCate.getCategoryID()).iterator();
													while (subIterator.hasNext()) {
														Subcategory currSub = (Subcategory) subIterator.next();
														%>
															<li><a href=""><%=currSub.getSubCategoryName()%></a></li>
														<%
													}//end of while subIterator.hasNext()
										%>
									</ul>
								</div>
							</div>
							<%
								}//end of if getCategoryName A,B

								}// itCate.hasNext()
							%>
							<div class="col1 men">
								<div class="sports-pic">
									<img src="images/reading1.jpg" title="" />
								</div>
							</div>
						</div>
					</div>
					</li>
			</ul>
		</div>
	</div>
	<div align="center">
		<table border="1" cellpadding="5" Style="width: 100%">
			<caption>
				<h2>List of Category</h2>
			</caption>
			<tr>
				<th>ID</th>
				<th>Name</th>
			</tr>
			<c:forEach items="${categorylist.getLstCategory()}" var="Category">
				<tr>
					<td><c:out value="${Category.getCategoryID()}" /></td>
					<td><c:out value="${Category.getCategoryName()}" /></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<div align="center">
		<table border="1" cellpadding="5" Style="width: 100%">
			<caption>
				<h2>List of Category with method 2</h2>
			</caption>
			<tr>
				<th>ID</th>
				<th>Name</th>
			</tr>
			<c:forEach items="${categorylist.lstCategory}" var="cat">
				<tr>
					<td><c:out value="${cat.categoryID}" /></td>
					<td><c:out value="${cat.categoryName}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
	<!-- 	<div align="left"> -->
	<!-- 		<h2>List of Category with method 3</h2> -->
	<!-- 		<nav> -->
	<!-- 			<ul> -->
	<%-- 				<c:forEach items="${categorylist.lstCategory}" var="cat"> --%>
	<%-- 					<li><a href="#${cat.categoryID}">${cat.categoryName}</a></li> --%>
	<%-- 				</c:forEach> --%>
	<!-- 			<ul> -->
	<!-- 		</nav> -->
	<!-- 		<h2>List of SubCategory with method 3</h2> -->
	<!-- 		<nav> -->
	<!-- 			<ul> -->
	<%-- 				<c:forEach items="${categorylist.getSubCategory()}" var="cat"> --%>
	<%-- 					<li><a href="#${cat.categoryID}">${cat.categoryName}</a></li> --%>
	<%-- 				</c:forEach> --%>
	<!-- 			<ul> -->
	<!-- 		</nav> -->
	<!-- 	</div> -->
</body>
</html>