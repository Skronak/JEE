<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<jsp:include page="menu.jsp"/>
<head>
	<title>Depot d'une alerte</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et qu'elle ne peut pas être redimensionnée par l'utilisateur -->
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<!-- Inclusion de l'API Google MAPS -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
	<!-- Script de geolocalisation-->
	<script type="text/javascript" src="js/geoloc.js"></script>
	<!-- Script de fenetres modals A INCLURE-->
	<script src="js/jquery.js"></script>   
</head>

<body >

<!-- FORMULAIRE -->
<div style="float:left; position:relative; height:100%;width:20%;">
	<form >
	</br>
	<h1>Depot d'une nouvelle alerte</h1>
		<p>Votre adresse</p>
		<input type="text" id="adresse"/>
		<input type="button" value="Localiser sur la carte" onclick="TrouverAdresse();"/>
		
		<p>Type d'evenement à declarer</p>
		<SELECT name="nom" size="1">
			<OPTION>Degradation volontaire
			<OPTION>Biens abimé
			<OPTION>Amélioration souhaité
			<OPTION>Zone dangereuse
			<OPTION>Autre
		</SELECT>
		<p>	Priorité
			<input type="radio" name="souhait" value="riche" id="riche" /><label for="riche">Dès que possible</label> 
			<input type="radio" name="souhait" value="celebre" id="celebre" /><label for="celebre">Peu Urgent</label> 
			<input type="radio" name="souhait" value="celebre" id="celebre" /><label for="celebre">Pour information</label> 
		</p>
		<span id="text_latlng">Pas de coordonnée actuelle</span>
		<br><input type="submit" value="Envoyer" />
	</form>
</div>
<!-- FIN DU FORMULAIRE -->

<div id="map-canvas" style="float:right; position:relative; height:100%;width:80%"></div>
</body>
</html>