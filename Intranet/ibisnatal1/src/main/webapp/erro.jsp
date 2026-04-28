<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<!-- Bootstrap CSS -->
    	<link
    		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    		rel="stylesheet"
    		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous"
		>
		
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="style-erro.css">
		
		<title>Intranet Ibis Natal</title>
		
	</head>
	
	<body>
	
		<h1>Erro do Sistema</h1>
			
		<form class="row g-3" action="ServletLogin" method="post">		
			<%out.print(request.getAttribute("msg"));%>		
		</form>
		
		<h4>Entre em Contato com o Suporte.</h4>
		
		<!-- Option 1: Bootstrap Bundle with Popper -->
	    <script
	    	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	    	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	    	crossorigin="anonymous">
	    </script>
		
	
	</body>
	
</html>