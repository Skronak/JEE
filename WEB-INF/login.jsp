<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ page import="com.google.appengine.api.users.*"%>
<jsp:include page="menu.jsp" />

<%
	UserService userService = UserServiceFactory.getUserService();
%>

	<h1>Bienvenue dans mon application</h1>

	<%
		if (userService.getCurrentUser() == null) {
	%>
	<p>
		<a href="<%=userService.createLoginURL("/")%>">Se connecter</a>
	</p>
	<%
		} else {
	%>
	<p>
		Bonjour
		<%=userService.getCurrentUser().getNickname()%></p>
	<p>
		<a href="<%=userService.createLogoutURL("/")%>">Se déconnecter</a>
	</p>
	<% } %>
</body>
</html>