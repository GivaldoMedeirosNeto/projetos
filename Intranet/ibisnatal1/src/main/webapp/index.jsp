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
		<link rel="stylesheet" href="style.css">
		
		<title>Ibis Intranet</title>
		
	</head>
	
	<body>
	
		<h1>Bem vindo</h1>
		<h2>Intranet Ibis Natal</h2>
			
		<form class="row g-3 needs-validation" novalidate action="ServletLogin" method="post">
		
		<input type="hidden" value="<%= request.getParameter("url")%>" name="url">
		
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label">LOGIN</label>
					<input type="text" class="form-control" name="login" required="required">
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
			        	Informe o LOGIN para o acesso a intranet!
			      	</div>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label">Password</label>
					<input type="password" class="form-control" name="pass" required="required">
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
			        	Informe a SENHA para o acesso a intranet!
			      	</div>
				</div>
			</div>
			
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Acessar</button>
			</div>
		
		</form>
		
		<h5>${msg}</h5>
				
		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous">
		</script>
	
		<script type="text/javascript">
		
			// Example starter JavaScript for disabling form submissions if there are invalid fields
			(function () {
			  'use strict'
	
			  // Fetch all the forms we want to apply custom Bootstrap validation styles to
			  var forms = document.querySelectorAll('.needs-validation')
	
			  // Loop over them and prevent submission
			  Array.prototype.slice.call(forms)
			    .forEach(function (form) {
			      form.addEventListener('submit', function (event) {
			        if (!form.checkValidity()) {
			          event.preventDefault()
			          event.stopPropagation()
			        }
	
			        form.classList.add('was-validated')
			      }, false)
			    })
			})()
		
		</script>
	
	</body>
	
</html>