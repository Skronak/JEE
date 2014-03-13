<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Création d'une alerte</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="Nantes.css"/>" />
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    </head>
    <body>
        <div>
        	<p class="bg-danger">${ form.resultat }</p>
            <form method="post" action="<c:url value="/alerte"/>">
               <fieldset>
                    <legend>Informations alerte</legend>
                    <c:import url="inc_alerte_form.jsp" />
                </fieldset>
                <input type="submit" class="btn btn-primary" value="Valider"/>
                <input type="reset" class="btn btn-default" value="Remettre à zéro" /> <br />
            </form>
        </div>
    </body>
</html>