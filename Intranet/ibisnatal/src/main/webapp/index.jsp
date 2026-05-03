<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

	<head>	
		<title>Intranet - Ibis Natal</title>		

		<!-- Meta -->
		<meta charset="ISO-8859-1">
		<meta name="description" content="Intranet Ibis Natal" />
		<meta name="author" content="GSMN: Givaldo Medeiros Neto" />
		<meta name="keywords" content="bootstrap, java, html, css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
		<!-- Favicon icon -->
		<link rel="icon" href="<%= request.getContextPath() %>/assets/images/logo.ico" type="image/x-icon">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/login.css">		
	</head>
	
	<body>
	
		<div class="container">
	
	        <figure class="img-login"><img src="assets/images/logo-ibis.png" class="img-login"></figure>
	
	        <main>
	        	<div class="login-container">
	            
	            	<h1>Ibis Natal - Intranet</h1>
	            
			        <form action="LoginServlet" method="post" class="login-box">
			
			            <h2>Login</h2>
			
			            <input type="text" name="login" placeholder="Usuário" required>			
			            <input type="password" name="senha" placeholder="Senha" required>
			            <input type="text" name="codHotel" placeholder="codHotel" required>
			
			            <button type="submit">Acessar</button>
			
			        </form>
			    </div>
	            
	        </main>
	
	    </div>

	    <footer>
	    	<p>© 2026 Desenvolvido por <a href="https://gsmn.dev.br" target="_blank" rel="noopener">GSMN Tecnologia
	    	</a> - Todos os direitos reservados.</p>
	    </footer>
		
	</body>
	
</html>