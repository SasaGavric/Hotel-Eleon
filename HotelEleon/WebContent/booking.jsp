<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  
<!DOCTYPE html>

<html lang="en">
<head>
<title>Hotel Eleon | Booking</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Adamina_400.font.js"></script>
<script type="text/javascript" src="js/jquery.jqtransform.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script:700" rel="stylesheet">
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="all">
<![endif]-->
</head>
<body id="page3">
	<div class="bg1">
		<div class="bg2">
			<div class="main">
				<!-- header -->
				<header>
					<h1>Hotel <span id="title">Eleon</span></h1>
					<div class="department">
						<br> <span>Freephone: &nbsp; +7 495 1556261</span>
					</div>
				</header>
				<div class="box">
					
						<ul id="menu">
							<li><a href="index.html">About Us</a></li>
							<li><a href="services.html">Services</a></li>
							<li class="active"><a href="HotelControllerServlet?command=BOOKING_PAGE">Booking</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="contact.html">Contact Us</a></li>
						</ul>
					
					<!-- header end -->
					<!-- content -->
					<article id="content">
						<div class="box1">
							<div class="wrapper">
							<c:if test="${availableRooms }">
								<form action="HotelControllerServlet" id="form1" method="POST"
									onsubmit="if (!(confirm('Are you sure you want to book this room'))) return false">
									<input type="hidden" name="command" value="BOOK" />
									<h2>Book a Room</h2>
									<fieldset>
										<div class="row">
											<input type="text" name="firstName" required="required" maxlength="25"
												class="input"> First Name:
										</div>
										<div class="row">
											<input type="text" name="lastName" required="required" maxlength="25"
												class="input"> Last Name:
										</div>
										<div class="row">
											<input type="text" name="email" required="required" maxlength="30"
												class="input"> E-Mail Address:
										</div>
										<div class="row">
											<input type="text" name="phone" required="required" maxlength="20"
												class="input"> Phone:
										</div>
										<div class="row">

											Check in: <input type="date" name="checkIn"
												required="required" class="input" >
										</div>
										<div class="row">
											Check out: <input type="date" name="checkOut"
												required="required" class="input" >
										</div>

										<div class="row">
											Available Room Types: <select name="roomType">
											<c:forEach var="roomTypes" items="${availableTypes }" >
												<option value="${roomTypes}">${roomTypes}</option>
											</c:forEach>
											</select>
										</div>

										<div class="row_textarea">
											Additional Comments:
											<textarea cols="1" rows="1" name="comment"></textarea>
											
										</div>


										<div class="wrapper">
											<input type="submit" value="Book" class="button1">
										</div>
									</fieldset>
								</form>
								<div class="col2 pad">
									<h2>
										<img src="images/title_marker1.jpg" alt="">
										Rooms
									</h2>
									<div class="wrapper line1">
										<div class="col3">
											<figure class="pad_bot3">
												<img src="images/page3_img1.jpg" alt="">
											</figure>
											<p class="pad_bot1">
												<strong class="color3">Classic Room</strong>
											</p>
											<ul>
											<li>26sqm/280sqft-45sqm/484sqft</li>
											<li>Air-conditioned</li>
											<li>Connecting rooms are available (for some rooms)</li>
											<li>Living/sitting area</li>
											<li>Windows soundproof, may be opened</li>	
											<li>Ceilings, high</li>
											</ul>
											<ul class="list2">
												<li><span>1</span>Rooms</li>
												<li><span>1</span>Beds</li>
											</ul>

										</div>
										<div class="col3 pad_left2">
											<figure class="pad_bot3">
												<img src="images/silver room.png" alt="">
											</figure>
											<p class="pad_bot1">
												<strong class="color3">Silver Room</strong>
											</p>
											<ul>
											<li>26sqm/280sqft-45sqm/484sqft</li>
											<li>Air-conditioned</li>
											<li>Mini bar</li>
											<li>King size bed</li>
											<li>Connecting rooms are available (for some rooms)</li>
											<li>Living/sitting area</li>
											<li>Windows soundproof, may be opened</li>	
											<li>Ceilings, high</li>
											</ul>
											<ul class="list2">
												<li><span>2</span>Rooms</li>
												<li><span>3</span>Beds</li>
											</ul>

										</div>
										<div class="col3">
											<figure class="pad_bot3">
												<img src="images/gold room.png" alt="">
											</figure>
											<p class="pad_bot1">
												<strong class="color3">Gold Room</strong>
											</p>
											<ul>
											<li>46sqm/280sqft-45sqm/484sqft</li>
											<li>Air-conditioned</li>
											<li>Mini bar</li>
											<li>King size bed</li>
											<li>Jacuzzi bathtub</li>
											<li>Security safe</li>
											<li>Windows soundproof, may be opened</li>	
											<li>Ceilings, high</li>
											</ul>
											<ul class="list2">
												<li><span>3</span>Rooms</li>
												<li><span>4</span>Beds</li>
											</ul>

										</div>
									</div>
								</div>
								</c:if>
								<c:if test="${not availableRooms }">
									<h2 id="sorry">We are very sorry but all rooms are booked</h2>
								</c:if>
							</div>
						</div>
						<div class="pad">
							<div class="wrapper line3">
								<div class="col2">
									<h2>About Booking</h2>
									<p class="pad_bot1">
										<strong class="color2">Chose one of our 3 luxurious room types </strong>
									</p>

									<div class="wrapper">
										<figure class="left marg_right1">
											<img src="images/page3_img3.jpg" alt="">
										</figure>
										<p class="pad_bot1">
											<strong class="color2">Fill out online form</strong>
										</p>
										<p class="pad_bot2">When You book room you need to check in hotel on reception with your <br>id card or passport.</p>
									</div>


								</div>
								<div class="col1 pad_left1">
									<h2>Booking Info</h2>
									<p class="pad_bot1">
										<strong class="color2">All other information You can get on our reception</strong>
									</p>
									


								</div>
							</div>
						</div>
					</article>
					<!--content end-->
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<!-- footer -->
		<footer>
			<div class="col2">
				Copyright &copy; <a href="#">Domain Name</a> All Rights Reserved |
				Design by <a target="_blank" href="https://github.com/SasaGavric">Sasa
					Gavric</a>

			</div>
			<div class="col1 pad_left1">
				<ul id="icons">
					<li><a href="https://www.facebook.com/sasa.gavric.3"
						class="normaltip"><img src="images/icon2.jpg" alt=""></a></li>
					<li><a href="#" class="normaltip"><img
							src="images/icon4.jpg" alt=""></a></li>
					<li><a href="#" class="normaltip"><img
							src="images/icon1.jpg" alt=""></a></li>
				</ul>
			</div>
			<!-- {%FOOTER_LINK} -->
		</footer>
		<!-- footer end -->
	</div>
	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>