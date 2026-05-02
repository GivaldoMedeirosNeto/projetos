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
		<title>Curso JSP</title>
		
		<style type="text/css">
		
			form{
				position: absolute;
				top: 35%;
				left: 50%;
			}
			
			h1{
				position: absolute;
				top: 38%;
				left: 20%;
			}
		
			h2{
				position: absolute;
				top: 45%;
				left: 19%;
			}
			
			h5{
				position: absolute;
				top: 62%;
				left: 50%;
				color: red;
				border-color: #FF8C00;
			}
			
			h6{
				position: absolute;
				top: 95%;
				left: 20%;
			}
			
		</style>
		
	</head>
	
	<body>
	
		<h1>Bem vindo</h1>
		<h2>Projeto em JSP</h2>
			
		<form class="row g-3 needs-validation" novalidate action="<%= request.getContextPath() %>/ServletLogin" method="post">
		
		<input type="hidden" value="<%= request.getParameter("url")%>" name="url">
		
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label">LOGIN</label>
					<input type="text" class="form-control" name="login" required="required">
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
			        	Informe o LOGIN para acessar o sistema!
			      	</div>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label">Password</label>
					<input type="password" class="form-control" name="pass" required="required">
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
			        	Informe a SENHA para acessar o sistema!
			      	</div>
				</div>
			</div>
			
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Acessar</button>
			</div>
		
		</form>
		
		<h5>${msg}</h5>
		
		<h6>Curso: Formação Java Web Full-Stack e Spring Boot REST API (JDEV Treinamento)</h6>
		
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