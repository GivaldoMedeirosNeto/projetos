<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<nav class="navbar header-navbar pcoded-header">

	<div class="navbar-wrapper">
	
		<div class="navbar-logo">		
			<ul class="nav-left">			
				<li>				
					<div class="sidebar_toggle">
						<a href="javascript:void(0)">
							<i class="ti-menu"></i>
						</a>
					</div>
				</li>				
			</ul>
			
		</div>
		
		<div class="page-block">
	
		<div class="navbar-logo">		
			<div class="col-md-16">					
				<div class="page-header-title">
					<h5 class="m-b-10">Intranet - Ibis Natal</h5>
				</div>
			</div>		
		</div>
		
	</div>
		
		<div class="navbar-container container-fluid">
		
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
									<p class="notification-msg">Atualização da escala</p>
									<span class="notification-time">30 min</span>								
								</div>
							</div>
							
						</li>
						
						<li class="waves-effect waves-light">
						
							<div class="media">
								<div class="media-body">
									<h5 class="notification-user">Eventos</h5>
									<p class="notification-msg">Lista do grupo atualizada</p>
									<span class="notification-time">1 hora</span>
								</div>							
							</div>
						
						</li>
						
					</ul>
					
				</li>
				
				<li class="user-profile header-notification">
				
					<a href="#!" class="waves-effect waves-light">
						<span><%= session.getAttribute("usuario") %></span>
						<i class="ti-angle-down"></i>
					</a>
					
					<ul class="show-notification profile-notification">
					
						<li class="waves-effect waves-light">
							<a href="<%= request.getContextPath() %>/ServletLogin?acao=logout">
								<i class="ti-layout-sidebar-left"></i> Logout
							</a>
						</li>
						
						<li class="waves-effect waves-light">
							<a href="#!">
								<i class="ti-settings"></i> Configuração
							</a>
						</li>
					
					</ul>
				
				</li>
				
			</ul>
		
		</div>
	
	</div>

</nav>