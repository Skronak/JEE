<%@ page pageEncoding="UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
	<head>
	<%
		UserService userService = UserServiceFactory.getUserService();
	%>
		<%@ page import="com.google.appengine.api.users.*"%>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<!-- Optional theme -->
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
		<!-- Script de fenetres modals A INCLURE-->
		<script src="js/jquery.js"></script>   
	</head>
	<body>
		<div id="header">
			<nav class="navbar navbar-inverse" role="navigation" style="margin-bottom:0px;">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/jaidemarue.html"><span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a href="/creerAlerte"><span
						class="glyphicon glyphicon-envelope"> Poster une alerte</span></a></li>
				<li><a href="/mesAlertes"><span
						class="glyphicon glyphicon-folder-open"> Mes alertes</span></a></li>
				<li><a href="/map"><span class="glyphicon glyphicon-globe">
							Map</span></a></li>
							
				<%if (userService.getCurrentUser() == null) {%>
					<li><a href="<%= userService.createLoginURL("/creerAlerte") %>"><span class="glyphicon glyphicon-user">
							Login</span></a></li>
				<%} else {%>		
					<li><a href="<%=userService.createLogoutURL("/creerAlerte")%>"><span class="glyphicon glyphicon-user"><%=userService.getCurrentUser().getNickname()%></span></a></li>
				<% } %>			
			</ul>
			</nav>
		</div>