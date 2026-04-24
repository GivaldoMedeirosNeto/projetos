<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#">
			<i class="icon-close icons"></i>
		</a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
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
				<a href="<%=request.getContextPath() %>/index.jsp" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
					<span class="pcoded-mtext" data-i18n="nav.dash.main">Tela Principal</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>			
		</ul>
		
		<!-- Cadastros Inicio -->
		<ul class="pcoded-item pcoded-left-item" >
			<li class="pcoded-hasmenu">
				
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Cadastros</span>
					<span class="pcoded-mcaret"></span>
				</a>				
				<!-- Pet -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Pet</span>
							<span class="pcoded-mcaret"></span>
						</a>
						<!-- Pet -->
						<ul class="pcoded-submenu">
							<c:if test="${perfil == 'admin' || perfil == 'vet'}">
								<c:if test="${VW_PET}">
									<li class=" ">
										<a href="<%=request.getContextPath() %>/pet?acao=listar" class="waves-effect waves-dark">
											<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
											<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Pets</span>
											<span class="pcoded-mcaret"></span>
										</a>
									</li>
								</c:if>
							</c:if>
						</ul>
						<!-- Raca -->
						<ul class="pcoded-submenu">
							<c:if test="${perfil == 'admin'|| perfil == 'vet'}">
								<c:if test="${VW_RACA}">
									<li class=" ">
										<a href="<%=request.getContextPath() %>/raca?acao=listar" class="waves-effect waves-dark">
											<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
											<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Raças</span>
											<span class="pcoded-mcaret"></span>
										</a>
									</li>
								</c:if>
							</c:if>
						</ul>
						<!-- Coloracao -->
						<ul class="pcoded-submenu">
							<c:if test="${perfil == 'admin' || perfil == 'vet'}">
								<c:if test="${VW_COLORACAO}">
									<li class=" ">
										<a href="<%=request.getContextPath() %>/coloracao?acao=listar" class="waves-effect waves-dark">
											<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
											<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Colorações</span>
											<span class="pcoded-mcaret"></span>
										</a>
									</li>
								</c:if>
							</c:if>
						</ul>
						
					</li>
				</ul>
			
				<!-- Tutor -->
				<ul class="pcoded-submenu">
					<c:if test="${perfil == 'admin' || perfil == 'vet'}">
						<c:if test="${VW_TUTOR}">
							<li class=" ">
								<a href="<%=request.getContextPath() %>/tutor?acao=listar" class="waves-effect waves-dark">
									<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
									<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tutores</span>
									<span class="pcoded-mcaret"></span>
								</a>
							</li>
						</c:if>
					</c:if>
				</ul>
				
				<!-- Vet -->
				<ul class="pcoded-submenu">
					<c:if test="${perfil == 'admin' && perfil == 'vet'}">
						<c:if test="${VW_VET}">
							<li class=" ">
								<a href="<%=request.getContextPath() %>/cadastros/veterinarios.jsp" class="waves-effect waves-dark">
									<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
									<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Veterinários</span>
									<span class="pcoded-mcaret"></span>
								</a>
							</li>
						</c:if>
					</c:if>
				</ul>
			
				<!-- Atendimento -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Atendimento</span>
							<span class="pcoded-mcaret"></span>
						</a>
						<!-- Medicação -->
						<ul class="pcoded-submenu">
							<c:if test="${perfil == 'admin' || perfil == 'vet'}">
								<c:if test="${VW_MEDICAMENTO}">
									<li class=" ">
										<a href="<%=request.getContextPath() %>/medicacao?acao=listar" class="waves-effect waves-dark">
											<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
											<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Medicações</span>
											<span class="pcoded-mcaret"></span>
										</a>
									</li>
								</c:if>
							</c:if>
						</ul>
						<!-- Exame -->
						<ul class="pcoded-submenu">
							<c:if test="${perfil == 'admin'|| perfil == 'vet'}">
								<c:if test="${VW_EXAME}">
									<li class=" ">
										<a href="<%=request.getContextPath() %>/exame?acao=listar" class="waves-effect waves-dark">
											<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
											<span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Exames</span>
											<span class="pcoded-mcaret"></span>
										</a>
									</li>
								</c:if>
							</c:if>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
		<!-- Cadastros Fim -->
		
		<!-- Atendimento Inicio -->
		<ul class="pcoded-item pcoded-left-item" >
			<li class="pcoded-hasmenu">
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Atendimentos</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
			</li>
		</ul>
		<!-- Atendimento Fim -->
		
		<!-- Receita Inicio -->
		<ul class="pcoded-item pcoded-left-item" >
			<li class="pcoded-hasmenu">
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Receitas</span>
					<span class="pcoded-mcaret"></span>
				</a>
				
			</li>
		</ul>
		<!-- Receita Fim -->
		
		<!-- Relatório Inicio -->
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu ">
				<a href="javascript:void(0)" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
					<span class="pcoded-mtext" data-i18n="nav.menu-levels.main">Relatórios</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<!-- Cadastros -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Cadastros</span>
							<span class="pcoded-mcaret"></span>
						</a>
						
					</li>
				</ul>
				
				<!-- Atendimentos -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Atendimentos</span>
							<span class="pcoded-mcaret"></span>
						</a>
						
					</li>
				</ul>
				
				<!-- Receitas -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Receitas</span>
							<span class="pcoded-mcaret"></span>
						</a>
						
					</li>
				</ul>
				
				<!-- Exames -->
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="javascript:void(0)" class="waves-effect waves-dark">
							<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Exames</span>
							<span class="pcoded-mcaret"></span>
						</a>
						
					</li>
				</ul>
				
			</li>
		</ul>
		<!-- Relatório Fim -->
	</div>
</nav>