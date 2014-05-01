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
	<link rel="stylesheet" href="Jaidemarue.css">
	<title>Les alertes</title>
</head>
<body>
	<jsp:include page="modal.jsp"/>
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
			<hr/>	
	<c:forEach var="alerte" items="${alertes}" varStatus="count">			
		<div>
		<img src="img/${count.count}.jpg" style="width: 300px; height: 250px;" />
		</div>
		<div>
			<p>Proprietaire: ${alerte.owner}</p>
			<p>Adresse  : ${alerte.adresse}</p>
			<p>Date 	: ${alerte.date}</p>
			<p>Type 	: ${alerte.type}</p>
			<p>Commentaire: ${alerte.commentaire}</p>
			<p>Votes	: ${alerte.vote}</p>		
		</div>
	</c:forEach>
					</tr><jsp:include page="modal.jsp" />
			</div>
				
	<%
						}
					%>
	
	</body>
	</html>