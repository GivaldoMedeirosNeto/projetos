<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<nav class="pcoded-navbar">

	<div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
	
	<div class="pcoded-inner-navbar main-menu">
	
		<div class="">
		
            <div class="main-menu-header">
                <div class="user-details">
                    <span id="more-details">
                    	<%= session.getAttribute("sysUsuario") %><i class="fa fa-caret-down"></i>
                    </span>
                </div>
            </div>

            <div class="main-menu-content">
                <ul>
                    <li class="more-details">
                        <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                        <a href="#!"><i class="ti-settings"></i>Settings</a>
                        <a href="auth-normal-sign-in.html"><i class="ti-layout-sidebar-left"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
	
		<div class="p-15 p-b-0">
			<form class="form-material">
				<div class="form-group form-primary">
					<input type="text" name="footer-email" class="form-control" required="">
					<span class="form-bar"></span>
					<label class="float-label"><i class="fa fa-search m-r-10"></i>Pesquisar</label>
				</div>
			</form>
		</div>
		
		<ul class="pcoded-item pcoded-left-item">
		
			<li class="active">
				<a href="<%= request.getContextPath() %>/principal.jsp" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
					<span class="pcoded-mtext" data-i18n="nav.dash.main">Home</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li>
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/escala.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-calendar"></i><b>FC</b></span>
					<span class="pcoded-mtext" data-i18n="nav.form-components.main">Escala</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
		</ul>
		
		<ul class="pcoded-item pcoded-left-item">
		
			<li class="pcoded-hasmenu">
			
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-announcement"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">INFORMAÇÕES</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
				<ul class="pcoded-submenu">
				
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/informacao/aviso.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Avisos</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/informacao/chamado.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Chamados</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
				</ul>
				
			</li>
			
			<li class="pcoded-hasmenu">
			
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">GRUPOS &amp; EVENTOS</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
				<ul class="pcoded-submenu">
				
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/grupo-evento/grupo.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Grupos</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/grupo-evento/evento.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Eventos</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
				</ul>
				
			</li>
			
			<li class="pcoded-hasmenu">
			
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-star"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">ALL - ACCOR</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
				<ul class="pcoded-submenu">
				
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/all-accor/guia-all.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Guia ALL</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/all-accor/all-play.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">ALL Play</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
				</ul>
				
			</li>
			
			<li class="pcoded-hasmenu">
			
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-check-box"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">PROCEDIMENTOS</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
				<ul class="pcoded-submenu">
				
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/procedimento/devolucao.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Devolução</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/procedimento/reembolso.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Reembolso</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/procedimento/faturamento.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Faturamentos</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/procedimento/arquivos.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Arquivos</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
				</ul>
				
			</li>
			
			<li class="pcoded-hasmenu">
			
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-clipboard"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">AUDITORIA</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
				<ul class="pcoded-submenu">
				
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/auditoria/esquema.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Esquema</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/auditoria/pre-auditoria.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Pré Auditoria</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/auditoria/pos-auditoria.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Pós Auditoria</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class=" ">
						<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/auditoria/relatorios.jsp"
							class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Relatórios</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
				</ul>
				
			</li>
		
		</ul>
		
		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">ADMINISTRATIVOS</div>
		<ul class="pcoded-item pcoded-left-item">
		
			<li>
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/uploads.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-cloud-up"></i><b>FC</b></span>
					<span class="pcoded-mtext" data-i18n="nav.form-components.main">Uploads</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li>
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/usuarios.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-user"></i><b>FC</b></span>
					<span class="pcoded-mtext" data-i18n="nav.form-components.main">Usuários</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li class=" ">
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/informacao.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-announcement"></i></span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Informações</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li class=" ">
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/grupo-evento.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Grupos &amp; Eventos</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li class=" ">
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/procedimento.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-check-box"></i></span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Procedimentos</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li class=" ">
				<a href="<%= request.getContextPath() %>/principal.jsp?page=/menu/adm/auditoria.jsp"
					class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-clipboard"></i></span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Auditoria</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
		</ul>
		
	</div>

</nav>