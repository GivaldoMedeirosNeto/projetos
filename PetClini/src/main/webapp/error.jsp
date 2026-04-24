<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
	
	<head>
		<title>Erro PetClini</title>
		<jsp:include page="/principal/head.jsp"></jsp:include>
	</head>

	<body>
		<div id="pcoded" class="pcoded">
			<div class="pcoded-overlay-box"></div>
			<div class="pcoded-container navbar-wrapper">
				
				<nav class="navbar header-navbar pcoded-header">
					<div class="navbar-wrapper">
						<div class="navbar-logo">
							<div class="mobile-search waves-effect waves-light">
								<div class="header-search">
									<div class="main-search morphsearch-search">
										<div class="input-group"></div>
									</div>
								</div>
							</div>
							<div>
							
							</div>
							<a href="<%= request.getContextPath() %>/index.jsp">
								<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo03-01.png" alt="Theme-Logo" />
							</a>
							<a class="mobile-options waves-effect waves-light">
								<i class="ti-more"></i>
							</a>
						</div>
						<div class="navbar-container container-fluid">
							<ul class="nav-right">
								<li>
									<div class="sidebar_toggle">
										<a href="javascript:void(0)"><i class="ti-menu"></i></a>
									</div>
								</li>
								<li>
									<a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
										<i class="ti-fullscreen"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				
				<div class="pcoded-main-container-login">
					
					<div class="left-container">
						<div class="pcoded-wrapper">		
							<form class="md-float-material form-material"
								action ="<%=request.getContextPath() %>/login" method="post">
								<h3>Contate o Suporte do Sistema</h3>
								<br><br>
								<h5>Mensagem de Erro</h4>								
	                           	<%
	                           	  out.println(request.getAttribute("msg"));
	                           	%>
	                       	</form>
						</div>
						
						<a href="<%= request.getContextPath() %>/acesso/login.jsp">Acessar o Sistema</a>
											
					</div>
					
					<div class="right-container">
						<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo02-02.gif" alt="Logo" />
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;suporte@petclini.vet.br</h3>
					</div>
					
						
					
				</div>
				
			</div>			
		</div>      
	    <!-- Required Jquery -->
			<jsp:include page="/principal/javascript.jsp"></jsp:include>
	</body>
</html>


