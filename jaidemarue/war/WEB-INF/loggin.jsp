	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
	<jsp:include page="menu.jsp"/>
	<head>
		<%@ page pageEncoding="UTF-8" %>
		<%@ page import="com.google.appengine.api.users.*"%>
	</head>
	<body>
		<%UserService userService = UserServiceFactory.getUserService();%>
		<h1>Vous devez etre connecté avant de pouvoir déposer une alerte</h1>
		<hr>
		<a href="<%= userService.createLoginURL("/creerAlerte") %>" class="btn btn-default btn-primary btn-lg"><span class="glyphicon glyphicon-user"></span> Connection</a>
    </body>
</html>