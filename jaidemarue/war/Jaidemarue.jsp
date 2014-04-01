<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>J'aide ma rue . com</title>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
	<link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="Jaidemarue.css" type="text/css" media="screen"/>
</head>

<body>
	<h1> Street's guardian . com</h1>
	<hr>
	
	<div class="go"><img src="/img/go.png" alt="" /></div>
	<%
		UserService userService = UserServiceFactory.getUserService();
		if (userService.getCurrentUser() == null) {
	%>
	<div class="gauche">
		<a href="<%=userService.createLoginURL("/lesalertes")%>"><button type="button" class="btn btn-success btn-lg">Se connecter</button></a>
	</div>
	<div class="droite">
		<a href="lesalertes"><button type="button" class="btn btn-primary btn-lg">Accéder directement au site</button></a>
	</div>
	<%
		} else {
	%>
	<div class="middle">
		<a href="lesalertes"><button type="button" class="btn btn-primary btn-lg">Accéder directement au site</button></a>
	</div>
	<%
		}
	%>
	
</body>
</html>
