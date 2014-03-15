<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.datastore.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>
<head>
<title>Formulaire alerte</title>
<meta charset="utf-8" />
</head>

<body>
	<h2>Vous avez remarqué des dégradations non loin de chez vous fait
		nous en part</h2>
	<form action="/page" method="post">
		<p>
			<label>Adresse : <input type="text" name="adresse" /></label>
		</p>
		<p>
			<label>Code postal : <input type="text" name="cp" /></label>
		</p>
		<p>
			<label>Ville : <input type="text" name="ville" /></label>
		</p>
		<p>
			<label>Type de dégradation : <input type="text" name="type" /></label>
		</p>
		<p>
			<label>Votre message : <textarea name="message"
					style="width: 200px; height: 100px;"></textarea></label>
		</p>
		<p>
			<input type="submit" />
		</p>
	</form>

	<h1>Liste des alértes :</h1>
	<p>
		<em>(et c'est stocké dans le Datastore !)</em>
	</p>
	<%
		List<Entity> messages = (List<Entity>) request
				.getAttribute("messages");
		for (Entity message : messages) {
	%>
	<p>
		<strong><%=message.getProperty("name")%></strong> a écrit :

		<%=message.getProperty("message")%>
	</p>
	<%
}
%>
</body>
</html>