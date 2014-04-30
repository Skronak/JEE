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
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<title>Les alertes</title>
</head>
<body>
	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="float:top; position:absolute; height:63%;width:100%;z-index: 1;"></div>
	
	<!-- Affichage des alertes -->      		
	<div style="background-color:white;margin-top:40%;float:bottom; position:absolute; height:100%;width:100%;z-index:2">
<%
		List<Alerte> alertes = (List<Alerte>) request.getAttribute("alertes");
		
        if(alertes.isEmpty()) {
%>
	<div class="alert alert-info">
	  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	  <h1>Il n'y a eu aucun vote pour le moment</h1>
	</div>
	<%
	        } else {
	%>
			<h1>TOP 5 des alertes les plus plébiscitées :</h1>	
			<table id="tableau" summary="Classement Blogspot par Wikio - Mai 2010">
			<thead>
			
			<tfoot>
				<tr>
					<td colspan="5">TOP 5 des alertes - Street's Guardian - 2014</td>
				</tr>
			</tfoot>
			<tr >
					<th scope="col">Utilisateur</th>
					<th scope="col">Date</th>
					<th scope="col">Adresse</th>
					<th scope="col">Type</th>
					<th scope="col">Commentaires</th>
					<th scope="col">Votes</th>
				</tr>
			</thead>
			
	          <c:forEach var="alerte" items="${alertes}" >
					<tbody>
						<tr>
							<td>${alerte.owner}</td>
							<td>${alerte.date}</td>
							<td>${alerte.adresse}</td>
							<td>${alerte.type}</td>
							<td>${alerte.commentaire}</td>
							<td>${alerte.vote}</td>
							<br>
				</c:forEach>
				</tbody>
			</table>
				
	<%	        
		     }
	%>
	
	</body>
	</html>