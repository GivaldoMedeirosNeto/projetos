<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
				<i class="ti-menu"></i>
			</a>
			<a href="<%=request.getContextPath() %>/index.jsp">
				<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo03-01.png" alt="Theme-Logo" />
			</a>
			<a class="mobile-options waves-effect waves-light">
				<i class="ti-more"></i>
			</a>
		</div>	
		<div class="navbar-container container-fluid">
			<ul class="nav-left">
				<li>
					<div class="sidebar_toggle">
						<a href="javascript:void(0)">
							<i class="ti-menu"></i>
						</a>
					</div>
				</li>
				<li>
					<a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
						<i class="ti-fullscreen"></i>
					</a>
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
							<label class="label label-danger">Novos</label>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%= request.getContextPath() %>/assets/images/avatar-blank.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Penélope</h5>
									<p class="notification-msg">
										Agendamento de Consulta: Clinico Geral<br>
										Data - Hora: 15/07/23 - 09:30
									</p>
									<span class="notification-time">15 minutos atrás</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%= request.getContextPath() %>/assets/images/avatar-blank.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Twikki</h5>
									<p class="notification-msg">
										Agendamento de Consulta: Oftalmo<br>
										Data - Hora: 15/07/23 - 11:30
									</p>
									<span class="notification-time">30 minutos atrás</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%= request.getContextPath() %>/assets/images/avatar-blank.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Kira</h5>
									<p class="notification-msg">
										Agendamento de Consulta: Vacina<br>
										Data - Hora: 10/07/23 - 08:00
									</p>
									<span class="notification-time">35 minutos atrás</span>
								</div>
							</div>
						</li>	
					</ul>
				</li>
				<li class="user-profile header-notification">
					<a href="#!" class="waves-effect waves-light">
						<img src="<%= request.getContextPath() %>/assets/images/logo01.png" class="img-radius" alt="User-Profile-Image">					
						<span><%= request.getSession().getAttribute("usuario") %></span>
						<i class="ti-angle-down"></i>
					</a>
					<ul class="show-notification profile-notification">
						<li class="waves-effect waves-light">
							<a href="#!">
								<i class="ti-settings"></i>Configurações
							</a>
						</li>
						<li class="waves-effect waves-light">
							<a href="user-profile.html">
								<i class="ti-user"></i>Perfil
							</a>
						</li>
						<li class="waves-effect waves-light">
							<a href="email-inbox.html">
								<i class="ti-email"></i>Minhas Mensagens
							</a>
						</li>
						<li class="waves-effect waves-light">
							<a href="<%= request.getContextPath() %>/login?acao=logout">
								<i class="ti-layout-sidebar-left"></i> Logout
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>