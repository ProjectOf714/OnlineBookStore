<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>JSP List Category Records</title>
</head>
<body>
	<header>
		<h1>The most important heading on this page</h1>
		<p>With some supplementary information</p>
	</header>
	<nav>
		<ul>
			<li><a href="#html5">HTML5</a></li>
			<li><a href="#css3">CSS3</a></li>
			<li><a href="#jquery">jQuery</a></li>
			<ul>
	</nav>

	<FORM action="ShowCategory" method="get">
		<INPUT type="submit" name="Submit" value="Show">
	</FORM>
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
</body>
</html>