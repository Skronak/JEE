<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.rue.bean.Alerte" %>
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
			int a=0;
			List<Alerte> alertes = (List<Alerte>) request.getAttribute("alertes");
			for (Alerte alerte : alertes) {
				a++;
		%>
			<%if (a==3) { %>
			<div class="row">
			<% } %>
			  <div class="col-sm-6 col-md-4">
				 <div class="thumbnail">
			      <img src="<%=alerte.getImage()%>" alt="...">
			      <div class="caption">
			        <h3><%=alerte.getOwner()%></h3>
			        <p><table>
					<tr>
						<td>Adresse:</td>
						<td><%=alerte.getAdresse()%></td>
					</tr>
					<tr>
						<td>Date:</td>
						<td><%=alerte.getDate()%></td>
					</tr>
					<tr>
						<td>Type:</td>
						<td><%=alerte.getType()%></td>
					</tr>
					<tr>
						<td>Priorité:</td>
						<td><%=alerte.getPriorite()%></td>
					</tr>
					<tr>
						<td>Commentaire:</td>
						<td><%= alerte.getCommentaire()%></td>
					</tr>
					<tr>
						<td>Vote(s): </td>
						<td><%= alerte.getVote()%></td>
					</tr>
					<tr>
						<td>Coordonnées:</td>
						<td><%= alerte.getCoord()%></td>
					</tr>
				</table>
			        <p style="text-align: left;float:left;margin-right:5%;"><a href="#" class="btn btn-primary" role="button">Localiser</a></p>
			        
			        <!--  On test l'existence du cookie sur le vote pour savoir si on a deja voté -->
			        <p style="text-align: left;"><a href="/addVote?id=<%=alerte.getKey()%>" class="btn btn-Info" role="button">+1</a></span>
			        <!-- Fin du test -->
			        </p>
			      </div>
			    </div>
			</div>
		<%if (a==3) { %>
		</div>
		<% }
	}
	%>
</div>
</body>
</html>