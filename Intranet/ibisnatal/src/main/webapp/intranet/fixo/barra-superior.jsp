<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<nav class="navbar header-navbar pcoded-header">

	<div class="navbar-wrapper">
	
		<div class="navbar-logo">
		
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
				<i class="ti-menu"></i>
			</a>
			
			<a href="<%= request.getContextPath() %>/intranet/index.jsp">
				<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo_intra.png" alt="Theme-Logo" />
			</a>
			
		</div>
	
		<div class="navbar-container container-fluid">
			
			<ul class="nav-left">
			
				<li>
					<div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
				</li>
				
			</ul>
			
			<ul class="nav-right">
			
				<li class="header-notification">
				
					<a href="#!" class="waves-effect waves-light">
						<i class="ti-bell"></i>
						<span class="badge bg-c-red"></span>
					</a>
					
					<ul class="show-notification">
						
						<li>
							<h6>Notificações</h6>
							<label class="label label-danger">Novo</label>
						</li>
						
						<li class="waves-effect waves-light">
							<div class="media">
								<div class="media-body">
									<h5 class="notification-user">Escala</h5>
									<p class="notification-msg">Escala de Maio - Atualizada</p>
									<span class="notification-time">30 min</span>
								</div>
							</div>
						</li>
						
						<li class="waves-effect waves-light">
							<div class="media">
								<div class="media-body">
									<h5 class="notification-user">GRUPOS &amp; EVENTOS</h5>
									<p class="notification-msg">Grupo Unifarma - Lista</p>
									<span class="notification-time">30 min</span>
								</div>
							</div>
						</li>
						
					</ul>
					
				</li>
				
				<li class="user-profile header-notification">
					
					<a href="#!" class="waves-effect waves-light">
						<img src="<%= request.getContextPath() %>/assets/images/faq_man.png" class="img-radius" alt="User-Profile-Image">
						<span>Usuario</span>
						<i class="ti-angle-down"></i>
					</a>
					
					<ul class="show-notification profile-notification">
					
						<li class="waves-effect waves-light">
							<a href="#!">
								<i class="ti-settings"></i> Configuração
							</a>
						</li>
						
						<li class="waves-effect waves-light">
							<a href="auth-normal-sign-in.html">
								<i class="ti-layout-sidebar-left"></i> Logout
							</a>
						</li>
						
					</ul>
					
				</li>
				
			</ul>
			
		</div>
	
	</div>

</nav>