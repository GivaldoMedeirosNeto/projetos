<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Intranet Ibis</title>
	</head>
	
	<body>
	
		<h1>Bem vindo a Intranet Ibis Natal</h1>
		
		<form action="ServletLogin" method="post">
		
			Nome: <input type="text" name="nome">
			Login: <input type="text" name="login">
			Senha: <input type="text" name="pass">
			
			<input type="submit" value="enviar">
		
		</form>
	
	</body>

</html>