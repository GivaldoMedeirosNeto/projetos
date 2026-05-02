<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

	<head>
	
		<title>Projeto Intra 2.0</title>
		
		<meta charset="ISO-8859-1">		
		
		<link rel="stylesheet" href="config-sys/css/login.css">
		
	</head>
	
	<body>
	
		<div class="container">
	
	        <figure>
	            <img src="config-sys/img/login-logo.jpg" alt="Imagem exemplo">
	        </figure>
	
	        <main>
	        	<div class="login-container">
	            
	            	<h1>Projeto 2.0</h1>
	            
			        <form action="LoginServlet" method="post" class="login-box">
			
			            <h2>Login</h2>
			
			            <input type="text" name="login" placeholder="Usuário" required>
			
			            <input type="password" name="senha" placeholder="Senha" required>
			
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