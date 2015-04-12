<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ 
   page language="java"
	import="onlinebookstore.dao.*,onlinebookstore.entity.*, java.util.*"
	session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Menu-Online Bookstore</title>
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
</head>
<body>
	<div class="header-bottom">
		<div class="wrap">
			<%
				Object errMsg = session.getAttribute("errorMessage");
				if (errMsg != null) {
			%>
			<div style="color: #FF0000;"><%=errMsg.toString()%></div>
			<%
				}//if errMsg
			%>

			<!-- start header menu -->
			<ul class="megamenu skyblue">
				<%-- begin JSP scriptlet to create list of category --%>
				<%
					//Set CategoryDao to session
					CategoryDao cateDao = (CategoryDao) session
							.getAttribute("categorylist");
					if (cateDao == null) {
						cateDao = new CategoryDao(true);
						session.setAttribute("categorylist", cateDao);
					}
				%>
				<%
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
										<li><a
											href="ShowCategory?cateID=<%=currSub.getCategoryID()%>&subCateID=<%=currSub.getSubCategoryID()%>"><%=currSub.getSubCategoryName()%></a></li>
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
							<div class="col1 main">
								<div class="bussiness-pic">
									<img src="images/reading1.jpg" title="" />
								</div>
							</div>
						</div>
					</div></li>
				<%-- end JSP scriptlet to create list of category --%>
				<li class="active grid"><a class="color4" href="#">C</a>
					<div class="megapanel">
						<div class="row">
							<%
								for (Category cate : cateDao.getLstCategory()) {
									if (cate.getCategoryName().equals("Computer & Technology")) {
							%>
							<div class="col1">
								<div class="h_nav">
									<h4>Computer &amp; Technology</h4>
									<ul>
										<%
											Iterator<Subcategory> subIterator = cateDao.getSubCategory(
															cate.getCategoryID()).iterator();
													while (subIterator.hasNext()) {
														Subcategory currSub = (Subcategory) subIterator.next();
														//if (currSub.getSubCategoryName().equals("Architecture")) {
										%>
										<li><a
											href="ShowCategory?cateID=<%=currSub.getCategoryID()%>&subCateID=<%=currSub.getSubCategoryID()%>"><%=currSub.getSubCategoryName()%></a></li>

										<%
											}//end of while subIterator.hasNext()
										%>
									</ul>
								</div>
							</div>
							<%
								}//if
								}//for
							%>
							<div class="col1">
								<div class="h_nav">
									<h4>Children's Books</h4>
									<ul>
										<li><a href="">Action &amp; Adventure</a></li>
										<li><a href="">Activities, Crafts &amp; Games</a></li>
										<li><a href="">Animals</a></li>
										<li><a href="">Arts, Music &amp; Photography</a></li>
										<li><a href="">Biographies</a></li>
										<li><a href="">Cars, Trains &amp; Things to do</a></li>
										<li><a href="">Children Cookbooks</a></li>
										<li><a href="">Classics</a></li>
										<li><a href="">Comics &amp; Graphic Novels</a></li>
										<li><a href="">Computer &amp; Technology</a></li>
										<li><a href="">Early Learning</a></li>
										<li><a href="">Education &amp; Reference</a></li>
										<li><a href="">Fairy Tales, Folk Tales &amp; Myths</a></li>
										<li><a href="">Geography &amp; Culture</a></li>
										<li><a href="">Growing Up &amp; Facts of Life</a></li>
										<li><a href="">History</a></li>
										<li><a href="">Literature &amp; Fiction</a></li>
										<li><a href="">Mysteries &amp; Detectives</a></li>
										<li><a href="">Religions</a></li>
										<li><a href="">Science Fiction &amp; Fantasy</a></li>
										<li><a href="">Science, Nature &amp; How it works</a></li>
										<li><a href="">Sports &amp; Outdoors</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Christian Books &amp; Bibles</h4>
									<ul>
										<li><a href="">Bibles</a></li>
										<li><a href="">Bibles Covers</a></li>
										<li><a href="">Bible Study &amp; Reference</a></li>
										<li><a href="">Biographics</a></li>
										<li><a href="">Catholicism</a></li>
										<li><a href="">Children's &amp; Teens</a></li>
										<li><a href="">Christian Living</a></li>
										<li><a href="">Churches &amp; Church Leadership</a></li>
										<li><a href="">Education</a></li>
										<li><a href="">History</a></li>
										<li><a href="">Literature &amp; Fiction</a></li>
										<li><a href="">Mistory &amp; Evangelism</a></li>
										<li><a href="">Protestantism</a></li>
										<li><a href="">Romance</a></li>
										<li><a href="">Theology</a></li>
										<li><a href="">Worship &amp; Devotion</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Comics &amp; Graphies</h4>
									<ul>
										<li><a href="">Action &amp; Adventure Manga</a></li>
										<li><a href="">Art of Comics and Manga</a></li>
										<li><a href="">Biographies &amp; History Graphic
												Novel</a></li>
										<li><a href="">Comic Books</a></li>
										<li><a href="">Comic Strips</a></li>
										<li><a href="">Fantasy Graphic Novels</a></li>
										<li><a href="">Graphic Novels</a></li>
										<li><a href="">History &amp; Price Guides</a></li>
										<li><a href="">How To Create Comics &amp; Manga</a></li>
										<li><a href="">Manga</a></li>
										<li><a href="">Media Tie-In Graphic Novels</a></li>
										<li><a href="">Publishers</a></li>
										<li><a href="">Romance Manga</a></li>
										<li><a href="">Science Fiction Graphic Novels</a></li>
										<li><a href="">Superheroes</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Cood Books, Food &amp; Wine</h4>
									<ul>
										<li><a href="">Asian Cooking</a></li>
										<li><a href="">Baking</a></li>
										<li><a href="">Beverage &amp; Wine</a></li>
										<li><a href="">Canning &amp; Preserving</a></li>
										<li><a href="">Celetrities &amp; TV shows</a></li>
										<li><a href="">Cooking Education &amp; Reference</a></li>
										<li><a href="">Cooking Methods</a></li>
										<li><a href="">Cooking by Ingredient</a></li>
										<li><a href="">Desserts</a></li>
										<li><a href="">Entertaining &amp; Holidays</a></li>
										<li><a href="">Italian Cooking</a></li>
										<li><a href="">Kitchen Appliances</a></li>
										<li><a href="">Main Courses &amp; Side Dishes</a></li>
										<li><a href="">Outdoor Cooking</a></li>
										<li><a href="">Prefessional Cooking</a></li>
										<li><a href="">Quick &amp; Easy</a></li>
										<li><a href="">Regional &amp; Intertional</a></li>
										<li><a href="">Special Diet</a></li>
										<li><a href="">U.S. Cooking</a></li>
										<li><a href="">Vegetarian &amp; Vegan</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Crafts, Hobbies &amp; Home</h4>
									<ul>
										<li><a href="">Antiques &amp; Collections</a></li>
										<li><a href="">Crafts &amp; Hobbies</a></li>
										<li><a href="">Entertaing</a></li>
										<li><a href="">Gardening &amp; Landscape Design</a></li>
										<li><a href="">Home Improvement &amp; Design</a></li>
										<li><a href="">Pets &amp; Animal Care</a></li>
										<li><a href="">Sustainable Living</a></li>
										<li><a href="">Weddings</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 main">
								<div class="bussiness-pic">
									<img src="images/reading2.jpg" title="" />
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color5" href="#">D, E, F, G, H</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Education &amp; Teaching</h4>
									<ul>
										<li><a href="">Higher &amp; Continuing</a></li>
										<li><a href="">Education</a></li>
										<li><a href="">Schools &amp; Teaching</a></li>
										<li><a href="">Studing &amp; Working</a></li>
										<li><a href="">Test Preparation</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4>Engineering &amp; Transportation</h4>
									<ul>
										<li><a href="">Automative</a></li>
										<li><a href="">Engineering</a></li>
										<li><a href="">Transporation</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Health, Fitness &amp; Dieting</h4>
									<ul>
										<li><a href="">Addiction &amp; Recovery</a></li>
										<li><a href="">Aging</a></li>
										<li><a href="">Alternative Medician</a></li>
										<li><a href="">Beauty, Grooming &amp; Style</a></li>
										<li><a href="">Children's Health</a></li>
										<li><a href="">Diets &amp; Weight Loss</a></li>
										<li><a href="">Diseases &amp; Physical Ailments</a></li>
										<li><a href="">Exercise &amp; Fitness</a></li>
										<li><a href="">Men's Health</a></li>
										<li><a href="">Mental Health</a></li>
										<li><a href="">Nutrition</a></li>
										<li><a href="">Psychology &amp; Counseling</a></li>
										<li><a href="">Reference</a></li>
										<li><a href="">Safety &amp; First Aid</a></li>
										<li><a href="">Sexual Health</a></li>
										<li><a href="">Teen Health</a></li>
										<li><a href="">Women's Health</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>History</h4>
									<ul>
										<li><a href="">Africa</a></li>
										<li><a href="">Americas</a></li>
										<li><a href="">Arctic &amp; Antarctica</a></li>
										<li><a href="">Asia</a></li>
										<li><a href="">Australia &amp; Oceania</a></li>
										<li><a href="">Europe</a></li>
										<li><a href="">Middle East</a></li>
										<li><a href="">Russia</a></li>
										<li><a href="">United States</a></li>
										<li><a href="">World</a></li>
										<li><a href="">Acient Civilizations</a></li>
										<li><a href="">Military</a></li>
										<li><a href="">Historical Study &amp; Educational
												Resources</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Humor &amp; Entertainment</h4>
									<ul>
										<li><a href="">Humor</a></li>
										<li><a href="">Movies</a></li>
										<li><a href="">Performing Arts</a></li>
										<li><a href="">Pop Culture</a></li>
										<li><a href="">Puzzles &amp; Games</a></li>
										<li><a href="">Radio</a></li>
										<li><a href="">Sheet Music &amp; Scores</a></li>
										<li><a href="">Television</a></li>
										<li><a href="">Trivia &amp; Fun Facts</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 main">
								<div class="bussiness-pic">
									<img src="images/reading3.jpg" title="" />
								</div>
							</div>
						</div>

					</div></li>
				<li><a class="color6" href="#">I, G, K, L, M</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Law</h4>
									<ul>
										<li><a href="">Administrative Law</a></li>
										<li><a href="">Biographies</a></li>
										<li><a href="">Constitutional Law</a></li>
										<li><a href="">Criminal Law</a></li>
										<li><a href="">Dictionaries Law</a></li>
										<li><a href="">Environmental &amp; Natural Resource
												Law</a></li>
										<li><a href="">Estating Planning</a></li>
										<li><a href="">Ethics &amp; Professional
												Responsibility</a></li>
										<li><a href="">Family Law</a></li>
										<li><a href="">Foreign &amp; International Law</a></li>
										<li><a href="">Health &amp; Medical Law</a></li>
										<li><a href="">Intellectual Property</a></li>
										<li><a href="">Law Practive</a></li>
										<li><a href="">Legal Education</a></li>
										<li><a href="">Legal History</a></li>
										<li><a href="">Legal Self-Help</a></li>
										<li><a href="">Legal THeory &amp; Systems</a></li>
										<li><a href="">Media &amp; the Law</a></li>
										<li><a href="">Phiosophy</a></li>
										<li><a href="">Rules &amp; Procedures</a></li>
										<li><a href="">Specialties</a></li>
										<li><a href="">Tax Law</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Literature &amp; Fiction</h4>
									<ul>
										<li><a href="">Action &amp; Adventure</a></li>
										<li><a href="">African American</a></li>
										<li><a href="">Ancient &amp; Medieval Literature</a></li>
										<li><a href="">British &amp; Irish</a></li>
										<li><a href="">Classics</a></li>
										<li><a href="">Contemporary</a></li>
										<li><a href="">Erotica</a></li>
										<li><a href="">Essays &amp; Correspondence</a></li>
										<li><a href="">Foreign Language Fiction</a></li>
										<li><a href="">Genre Fiction</a></li>
										<li><a href="">Historical Fiction</a></li>
										<li><a href="">History &amp; Criticism</a></li>
										<li><a href="">Humor &amp; Satire</a></li>
										<li><a href="">Literary</a></li>
										<li><a href="">Mythology &amp; Folk Toles</a></li>
										<li><a href="">Poetry</a></li>
										<li><a href="">Short Stories &amp; Anthologies</a></li>
										<li><a href="">United States</a></li>
										<li><a href="">Woman's Fiction</a></li>
										<li><a href="">World Literature</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Medical Books</h4>
									<ul>
										<li><a href="">Administration &amp; Medicine
												Economics</a></li>
										<li><a href="">Allied Health Professions</a></li>
										<li><a href="">Basic Sciences</a></li>
										<li><a href="">Dentisty</a></li>
										<li><a href="">History</a></li>
										<li><a href="">Medical Informatics</a></li>
										<li><a href="">Medicine</a></li>
										<li><a href="">Nursing</a></li>
										<li><a href="">Pharmacology</a></li>
										<li><a href="">Psychology</a></li>
										<li><a href="">Research</a></li>
										<li><a href="">Veterinary Medicine</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Mystery, Thriller &amp; Suspense</h4>
									<ul>
										<li><a href="">Mystery</a></li>
										<li><a href="">Thrillers &amp; Suspense Writibg</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 book">
								<div class="bussiness-pic">
									<img src="images/reading4.jpg" title="" />
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color7" href="#">N, O, P, Q, R</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Parenting &amp; Relationships</h4>
									<ul>
										<li><a href="">Adoption</a></li>
										<li><a href="">Aging Parents</a></li>
										<li><a href="">Babysiting, Day Care &amp; Child Care</a></li>
										<li><a href="">Familities</a></li>
										<li><a href="">Family Health</a></li>
										<li><a href="">Family Relations</a></li>
										<li><a href="">Fertility</a></li>
										<li><a href="">Humor</a></li>
										<li><a href="">Marriage &amp; Adult Relationships</a></li>
										<li><a href="">Parenting</a></li>
										<li><a href="">Pregnancy &amp; Childbirth</a></li>
										<li><a href="">Reference</a></li>
										<li><a href="">Special Needs</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4>Politics &amp; Social Sciences</h4>
									<ul>
										<li><a href="">Anthropology</a></li>
										<li><a href="">Archaeology</a></li>
										<li><a href="">Philosophy</a></li>
										<li><a href="">Politics &amp; Government</a></li>
										<li><a href="">Social Sciences</a></li>
										<li><a href="">Sociology</a></li>
										<li><a href="">Woman's Study</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Reference</h4>
									<ul>
										<li><a href="">Almances &amp; Yearbooks</a></li>
										<li><a href="">Atlases &amp; Maps</a></li>
										<li><a href="">Carreers</a></li>
										<li><a href="">Catalogs &amp; Directories</a></li>
										<li><a href="">Consumer Guides</a></li>
										<li><a href="">Dictionaries &amp; Theasuruses</a></li>
										<li><a href="">Encyclopedias &amp; Subject Guides</a></li>
										<li><a href="">English as a Second Language</a></li>
										<li><a href="">Etiquette</a></li>
										<li><a href="">Foreign Language Study &amp; Reference</a></li>
										<li><a href="">Genealogy</a></li>
										<li><a href="">Quotations</a></li>
										<li><a href="">Survival &amp; Emergency Preparedness</a></li>
										<li><a href="">Test Preparation</a></li>
										<li><a href="">Words, Language &amp; Grammar</a></li>
										<li><a href="">Writing Research &amp; Publishing
												Guides</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Religion and Spirituality</h4>
									<ul>
										<li><a href="">Agnosticism</a></li>
										<li><a href="">Atheism</a></li>
										<li><a href="">Buddhism</a></li>
										<li><a href="">Christian Books &amp; Bibles</a></li>
										<li><a href="">Earch-Based Religions</a></li>
										<li><a href="">Fiction</a></li>
										<li><a href="">Hinduism</a></li>
										<li><a href="">Islam</a></li>
										<li><a href="">Judaism</a></li>
										<li><a href="">New Age</a></li>
										<li><a href="">Occult</a></li>
										<li><a href="">Other Eastern Religions &amp; Sacred
												Texts</a></li>
										<li><a href="">Religious Art</a></li>
										<li><a href="">Religious Studies</a></li>
										<li><a href="">Spirituality</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Romance</h4>
									<ul>
										<li><a href="">African American</a></li>
										<li><a href="">Anthologies</a></li>
										<li><a href="">Contemporary</a></li>
										<li><a href="">Erotica</a></li>
										<li><a href="">Fantasy</a></li>
										<li><a href="">Gay Romance</a></li>
										<li><a href="">Githic</a></li>
										<li><a href="">Historical</a></li>
										<li><a href="">Holidays</a></li>
										<li><a href="">Inspirational</a></li>
										<li><a href="">Lesbian Romance</a></li>
										<li><a href="">Military</a></li>
										<li><a href="">Multicultural</a></li>
										<li><a href="">New Adult &amp; College</a></li>
										<li><a href="">Paranormal</a></li>
										<li><a href="">Pegency</a></li>
										<li><a href="">Romantic Comedy</a></li>
										<li><a href="">Romantic Suspense</a></li>
										<li><a href="">Science Fiction</a></li>
										<li><a href="">Sports</a></li>
										<li><a href="">Time Travel</a></li>
										<li><a href="">Vampires</a></li>
										<li><a href="">Western</a></li>
										<li><a href="">Writing</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 tech">
								<div class="tech-pic">
									<img src="images/reading5.png" title="" />
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color8" href="#">S</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Science &amp; Math</h4>
									<ul>
										<li><a href="">Agricultural Science</a></li>
										<li><a href="">Archaeology</a></li>
										<li><a href="">Astronomy &amp; Space Science</a></li>
										<li><a href="">Behavioral Science</a></li>
										<li><a href="">Chemistry</a></li>
										<li><a href="">Earth Science</a></li>
										<li><a href="">Environment</a></li>
										<li><a href="">Essays &amp; Commentary</a></li>
										<li><a href="">Evolution</a></li>
										<li><a href="">Experiments Instruments &amp;
												Measurements</a></li>
										<li><a href="">History &amp; Philosogy</a></li>
										<li><a href="">Mathematics</a></li>
										<li><a href="">Nature &amp; Ecology</a></li>
										<li><a href="">Physis</a></li>
										<li><a href="">Reference</a></li>
										<li><a href="">Research</a></li>
										<li><a href="">Science for Kids</a></li>
										<li><a href="">Technology</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Science Fiction &amp; Fantasy</h4>
									<ul>
										<li><a href="">Fantasy</a></li>
										<li><a href="">Gaming</a></li>
										<li><a href="">Science Fiction</a></li>
										<li><a href="">Writing</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Self-Help</h4>
									<ul>
										<li><a href="">Abuse</a></li>
										<li><a href="">Anger Management</a></li>
										<li><a href="">Communication &amp; Social Skills</a></li>
										<li><a href="">Creativity</a></li>
										<li><a href="">Death &amp; Grief</a></li>
										<li><a href="">Dreams</a></li>
										<li><a href="">Eating Disorders</a></li>
										<li><a href="">Emotions</a></li>
										<li><a href="">Handwriting Analysis</a></li>
										<li><a href="">Happiness</a></li>
										<li><a href="">Hypnosis</a></li>
										<li><a href="">Inner Child</a></li>
										<li><a href="">Journal Writing</a></li>
										<li><a href="">Memory Improvement</a></li>
										<li><a href="">Mid-Life</a></li>
										<li><a href="">Motivational</a></li>
										<li><a href="">New Age</a></li>
										<li><a href="">Personal Transformation</a></li>
										<li><a href="">Relationships</a></li>
										<li><a href="">Self-Esteem</a></li>
										<li><a href="">Sex</a></li>
										<li><a href="">Spiritual</a></li>
										<li><a href="">Stress Management</a></li>
										<li><a href="">Time Management</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Sports &amp; Outdoors</h4>
									<ul>
										<li><a href="">Baseball</a></li>
										<li><a href="">Basketball</a></li>
										<li><a href="">Biographies</a></li>
										<li><a href="">Coaching</a></li>
										<li><a href="">Extreme Sports</a></li>
										<li><a href="">Field Guides</a></li>
										<li><a href="">Football (American)</a></li>
										<li><a href="">Golf</a></li>
										<li><a href="">Hiking &amp; Camping</a></li>
										<li><a href="">Hockey</a></li>
										<li><a href="">Hunting &amp; Fishing</a></li>
										<li><a href="">Individual Sports</a></li>
										<li><a href="">Miscellaneous</a></li>
										<li><a href="">Mountaineering</a></li>
										<li><a href="">Nature Travel</a></li>
										<li><a href="">Other Team Sports</a></li>
										<li><a href="">Outdoor Recreation</a></li>
										<li><a href="">Racket Sports</a></li>
										<li><a href="">Rodeos</a></li>
										<li><a href="">Soccer</a></li>
										<li><a href="">Softball</a></li>
										<li><a href="">Survival Skills</a></li>
										<li><a href="">Training</a></li>
										<li><a href="">Water Sports</a></li>
										<li><a href="">Winter Sports</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 tech">
								<div class="tech-pic">
									<img src="images/reading6.jpg" title="" />
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color8" href="#">T and Others</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Teens</h4>
									<ul>
										<li><a href="">Art, Music &amp; Photography</a></li>
										<li><a href="">Biographies</a></li>
										<li><a href="">Education &amp; Reference</a></li>
										<li><a href="">Historical Fiction</a></li>
										<li><a href="">Hobbies &amp; Thrills</a></li>
										<li><a href="">Literature &amp; Fiction</a></li>
										<li><a href="">Mysteries &amp; Thrills</a></li>
										<li><a href="">Personal Health</a></li>
										<li><a href="">Religion &amp; Spirituality</a></li>
										<li><a href="">Romance</a></li>
										<li><a href="">Science Fiction &amp; Fantasy</a></li>
										<li><a href="">Social Issues</a></li>
										<li><a href="">Sports &amp; Outdoors</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Textbooks</h4>
									<ul>
										<li><a href="">Business &amp; Finance</a></li>
										<li><a href="">Communication &amp; Journalism</a></li>
										<li><a href="">Computer Science</a></li>
										<li><a href="">Education</a></li>
										<li><a href="">Engineering</a></li>
										<li><a href="">Humanities</a></li>
										<li><a href="">Law</a></li>
										<li><a href="">Medicine &amp; Health</a></li>
										<li><a href="">Sciences</a></li>
										<li><a href="">Reference</a></li>
										<li><a href="">Science &amp; Mathematics</a></li>
										<li><a href="">Social Sciences</a></li>
										<li><a href="">Test Prep &amp; Study Guides</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Travels</h4>
									<ul>
										<li><a href="">Adventure Travel</a></li>
										<li><a href="">Food, Lodging &amp; Transportation</a></li>
										<li><a href="">Pictorial</a></li>
										<li><a href="">Reference</a></li>
										<li><a href="">Specialty Travel</a></li>
										<li><a href="">Travel Writing</a></li>
										<li><a href="">Africa</a></li>
										<li><a href="">Asia</a></li>
										<li><a href="">Australia &amp; South Pacific</a></li>
										<li><a href="">Canada</a></li>
										<li><a href="">Caribbean</a></li>
										<li><a href="">Central America</a></li>
										<li><a href="">Europe</a></li>
										<li><a href="">Mexico</a></li>
										<li><a href="">Middle East</a></li>
										<li><a href="">Polar Regions</a></li>
										<li><a href="">South America</a></li>
										<li><a href="">United States</a></li>
									</ul>
								</div>
							</div>
							<div class="col1 tech">
								<div class="tech-pic">
									<img src="images/reading7.jpg" title="" />
								</div>
							</div>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</body>
</html>