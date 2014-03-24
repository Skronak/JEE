<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.datastore.*"%>
<%@ page import="java.util.List"%>
<jsp:include page="menu.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Script de googlemap-->
	<script type="text/javascript" src="js/afficher.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="Jaidemarue.css">
	<title>Les alertes</title>
</head>
<body>
	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="float:top; position:absolute; height:63%;width:100%;z-index: 1;"></div>
	
	<!-- Affichage des alertes -->      		
	<div style="background-color:white;margin-top:40%;float:bottom; position:absolute; height:100%;width:100%;z-index:2">
	<h1>Liste des alertes :</h1>
	<%
		List<Entity> alertes = (List<Entity>) request
				.getAttribute("alertes");
		for (Entity alerte : alertes) {
	%>
	<p>
	<table>
		<tr>
			<td><strong><%=alerte.getProperty("auteur")%></strong></td>
		</tr>
		<tr>
			<td>Adresse:</td>
			<td><%=alerte.getProperty("adresse")%></td>
		</tr>
		<tr>
			<td>Date:</td>
			<td><%=alerte.getProperty("date")%></td>
		</tr>
		<tr>
			<td>Type:</td>
			<td><%=alerte.getProperty("type")%></td>
		</tr>
		<tr>
			<td>Statut:</td>
			<td><%=alerte.getProperty("statut")%></td>
		</tr>
		<tr>
			<td>Priorité:</td>
			<td><%=alerte.getProperty("priorite")%></td>
		</tr>
		<tr>
			<td>Commentaire:</td>
			<td><%= alerte.getProperty("commentaire") %></td>
		</tr>
	</table>
	</p>
	<%
}
%>
	</div>
</body>
</html>