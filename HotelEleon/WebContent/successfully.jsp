<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="myCss.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>

<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a>Hotel Eleon</a>
				</h1>
				<div id="menu">
					<ul>
						<li class="active"><a href="#" accesskey="1" title="">Homepage</a></li>
						<li><a href="booking.html" accesskey="2" title="">RESERVE YOUR ROOM</a></li>
						<li><a href="#" accesskey="5" title="">Contact Us</a></li>
						<li><a href="#" accesskey="3" title="">About Us</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<c:if test="${isBooked }">
	
<h1 id="success">Success</h1>

</c:if>

<c:if test="${not isBooked }">
	
<h1 id="success">Room is not booked!</h1>

</c:if>

</body>
</html>