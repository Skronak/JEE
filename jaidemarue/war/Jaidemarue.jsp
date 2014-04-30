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
	<div style="margin-top:150px;" onclick="backtobottom();"><img src="/img/bot.png"  alt="Comment fonctionne le site" ></img><a class="backtotop" href="#" onclick="backtobottom();">&nbsp;&nbsp;Pour savoir commenter utiliser le site cliquer ici</a></div>
	
	<br/><br/><div class="go"><img src="/img/post2.png" alt="" /></div>
	<p>Pour poster une alerte vous devez d'abord vous connecter. Pour cela vous devais posséder un compte Gmail.</p>
	<p>Si vous n'etes pas connecté le site vous proposera de le faire au moment du dépot</p></div>

	<br/><br/><div class="go"><img src="/img/post.png" alt="" /></div>
	<p>Une fois connecté vous pouvez renseigner les différents elements pour déposer une alerte.</p>
	<p>Pour selectionner l'adresse, vous pouvez soit renseigner l'adresse directement dans le champs, soit pointer sur la carte</p>
	<p>Une fois placé le marqueur peut etre déplacé par un tiré-glissé</p></div>
		
	<br/><br/><div style="margin-top:150px;" onclick="backtotop();"><img src="/img/top.png"  alt="Remonter en haut" ></img><a class="backtotop" href="#" onclick="backtotop();">&nbsp;&nbsp;Retour haut de page</a></div></body>


<script>
	var timeOut;
	function backtotop() {
		  clearTimeout(timeOut);
		  if (document.body.scrollTop!==0 || document.documentElement.scrollTop!==0){
		    window.scrollBy(0,5);
		    timeOut=setTimeout('backtotop()',20);
		  }
		  else clearTimeout(timeOut);
		}
	function backtobottom() {
		  clearTimeout(timeOut);
		  if (document.body.scrollBottom!==0 || document.documentElement.scrollBottom!==0){
		    window.scrollBy(0,5);
		    timeOut=setTimeout('backtobottom()',20);
		  }
		  else clearTimeout(timeOut);
		}
</script>
</html>
