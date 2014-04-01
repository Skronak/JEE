<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.rue.bean.Alerte" %>
<%@ page import="com.rue.pmf.PMF" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<jsp:include page="menu.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Script de googlemap-->
	<script type="text/javascript" src="js/afficher.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="Jaidemarue.css">
	<title>Mes alertes</title>
</head>
<body>
	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="position:absolute; height:100%;width:100%;z-index: 1;"></div>
	
	<!-- Affichage des alertes -->      		
	<div style="background-color:white;float:left; position:relative; height:100%;width:36%;z-index:2">
<%
		List<Alerte> alertes = (List<Alerte>) request.getAttribute("alertes");
		
        if(alertes.isEmpty()) {
%>
<div class="alert alert-info">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <h1>Vous n'avez deposé aucune alerte pour le moment</h1>
</div>

<%
        } else {
%>
            <h1>Vous avez deposé les alertes suivantes :</h1>

            <c:forEach var="alerte" items="${alertes}" >
	
	            <p>
	            <table>
					<tr>
						<td>Adresse:</td>
						<td>${alerte.adresse}</td>
					</tr>
					<tr>
						<td>Date:</td>
						<td>${alerte.date}</td>
					</tr>
					<tr>
						<td>Type:</td>
						<td>${alerte.type}</td>
					</tr>
					<tr>
						<td>Priorité:</td>
						<td>${alerte.priorite}</td>
					</tr>
					<tr>
						<td>Commentaire:</td>
						<td>${alerte.commentaire}</td>
					</tr>
					<tr>
						<td>Votes(s):</td>
						<td>${alerte.vote}</td>
					</tr>
					<!--<tr>	
						<img src="${alerte.image}" alt="..." ">
					</tr>-->
					<td>
						<form method="post" action="/mesAlertes?id=${alerte.key}"> <br>
							<INPUT type="submit" value="Supprimer" class="btn btn-danger btn-large">
				        </form>
			        </td>
	            </table><hr>
            </c:forEach>
	        <hr>
<%	        
	     }
%>
        </body>
</html>