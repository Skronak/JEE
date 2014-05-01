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
	<div>
	<br/><div><img src="/img/bot.png"  alt="Comment fonctionne le site" ></img><div>
	
	<br/><br/><div class="go"></div>
	<center><p> Ce site permet de déclarer des incidents sur la ville de Nantes avec une photo associée</p>
	<p>afin de relier l'information vers l'organe administratif compétent</p></center>
	
	<br/><br/>
	<h3>1/ Poster une alerte</h3>
	<p> Pour poster une alerte, vous devrez d'abord vous connecter avec votre compte Gmail.</p>
	<p> Si vous n'etes pas connecté le site vous proposera de le faire au moment du dépot</p></div>
	<img src="/img/post2.png" alt="" />	

	<br/><br/>
	<img src="/img/post.jpg" alt="" />
	<p> Une fois connecté vous pouvez renseigner les différents elements pour déposer une alerte.</p>
	<p> Pour selectionner l'adresse, vous pouvez soit renseigner l'adresse directement dans le champs, soit pointer sur la carte</p>
	<p> Une fois placé le marqueur peut etre déplacé par un tiré-glissé</p></div>
	
	<br/><br/>
	<h3>2/ Consulter et modifier ses alertes</h3>
	<img src="/img/CCC.jpg" alt="" />
	<p> L'onglet "mes alertes" vous permet de visualiser l'ensemble de vos alertes</p>
	<p> Vous pouvez également en supprimer une une ou plusieurs</p>
	
	<br/><br/>
	<h3>3/ Consulter toutes les alertes</h3>	
	<img src="/img/BBB.jpg" alt="" />
	<p> L'onglet toutes les alertes vous permet de consulter l'ensemble des alertes encore actives</p>
	<p> Vous pouvez voter pour chacune d'entre elles une fois en cliquant dans le "+1" présent dans chaque</p>
	<br/><br/>
	<center><p>D'autres fonctionnalités vous attendents mais nous vous laissons les decouvrir par vous même !</p></center>
	<a href=# ><img src="/img/top.png" alt=""></img>Retour en haut</a>	
	</div>
	
</html>
