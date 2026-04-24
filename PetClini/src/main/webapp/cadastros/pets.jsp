<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html lang="en">

	<!-- head start -->
	<jsp:include page="/principal/head.jsp"></jsp:include>
	<!-- head end -->
	
	<body>
	
		<!-- Pre-loader start -->
		<jsp:include page="/principal/theme-loader.jsp"></jsp:include>
		<!-- Pre-loader end -->
		
		<div id="pcoded" class="pcoded">
			<div class="pcoded-overlay-box"></div>
			
			<div class="pcoded-container navbar-wrapper">
				<!-- navbar start -->
			  	<jsp:include page="/principal/navbar.jsp"></jsp:include>
				<!-- navbar end -->
				
				<div class="pcoded-main-container">
					<div class="pcoded-wrapper">
					
						<!-- menunavbar start -->
					  	<jsp:include page="/principal/menunavbar.jsp"></jsp:include>
						<!-- menunavbar end -->	
						
						<div class="pcoded-content">
							<div class="pcoded-inner-content">
							
								<!-- Main-body start -->
								<div class="main-body">
									<!-- Page-body start -->
									<div class="page-wrapper">
										<!-- Basic Form Inputs card start -->
										<div class="card">
											<!-- Row start -->
											<div class="row">										
												<div class="col-lg-12 col-xl-12">
													<div class="card-header"><h5>PET</h5></div>												
												</div>																						
											</div>
											<!-- Row end -->														
										</div>
										<!-- Basic Form Inputs card end -->
										
										<!-- Tab variant tab card Botões start -->
										<div class="row">
											<div class="col-lg-12 col-xl-12">
												<div class="card-header">
													<div class="row">
														<div class="col-md-2">														
															<c:if test="${ADD_PET}">
																<button class="btn btn-primary btn-round waves-effect waves-light"
																	data-toggle="modal" data-target="#modelPet" type="button"
																	id="btnNovo" >Novo
																</button>
															</c:if>
															<button style="background: none; border: none;"></button>
															<button class="btn btn-info btn-round waves-effect waves-light"
																type="button" data-toggle="modal" data-target="#modelPet"
																id="btnPesquisar" >Pesquisar
															</button>	
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Tab variant tab card Botões end -->
										
										<!-- Tab variant tab card Lista start -->
										<div class="card">
											<div class="card-header">
											
												<div class="card-header">
													<h5>${qtd} ${qtd > 1 ? 'Pets Cadastrados' : 'Pet Cadastrado'}</h5>
												</div>
												
												<div style="height: 515px; overflow: scroll;">
													<table class="table" id="listaPet">
														<thead>
															<tr>
																<th scope="col">CPF</th>
																<th scope="col">PET</th>
																<th scope="col">TUTOR</th>
																<th scope="col">ESPÉCIE</th>
																<th scope="col">RAÇA</th>
																<th scope="col">COR</th>
																<th scope="col">STATUS</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${listPet}" var='lista'>
																<tr>
																	<c:set var="rowStyle" value="color: ${lista.status.cor}" />
																	
																	<td style="${rowStyle}">
																		<c:out value="${lista.cpf_pet}"></c:out>
																	</td>
																	
																	<td style="${rowStyle}">
																	  <a class="btn btn-round waves-effect btnViewPet" data-toggle="modal"
																      		data-target="" data-id="${lista.cpf_pet}">
																      	<c:out value="${lista.nome}" />
																      </a>
																	</td>

																	
																	<td style="${rowStyle}">
																	  <c:out value="${lista.tutor}" />
																	</td>

																	
																	<td style="${rowStyle}">
																		<c:out value="${lista.raca.especie.especie}"></c:out>
																	</td>
																	
																	<td style="${rowStyle}">
																		<c:out value="${lista.raca.raca}"></c:out>
																	</td>
																	
																	<td style="${rowStyle}">
																		<c:out value="${lista.coloracao.coloracao}"></c:out>
																	</td>
																	
																	<td style="${rowStyle}">
																		<c:out value="${lista.status.id}"></c:out>
																	</td>
																	
																	<td style="${rowStyle}">																		
																		<c:choose>
																		    <c:when test="${UPD_PET}">
																		        <c:choose>
																		            <c:when test="${lista.status.id != 'FA'}">
																		                <a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																		                    data-target="#modelPet" data-id="${lista.cpf_pet}, ${lista.status.id}">Editar</a>
																		            </c:when>
																		        </c:choose>
																		    </c:when>
																		</c:choose>
																	</td>
																																		
																</tr>
															</c:forEach>
														</tbody>
													
													</table>
													<h6>Legenda</h6>
													<table class="table">
														<thead>															
															<tr>
																<c:forEach items="${listStatus}" var='listaStatus'>
																	<th style="color: ${listaStatus.cor}">
																		<c:out value="${listaStatus.id} - ${listaStatus.status}"></c:out>
																	</th>
																</c:forEach>																
															</tr>
														</thead>
													</table>
												</div>
											
											</div>
										</div>
										<!-- Tab variant tab card Lista end -->
										
										<!-- Informações Inicio -->
										<div class="card">
											<!-- Row start -->
											<div class="row">
											
												<div class="col-lg-12 col-xl-12">
													<form class="form-material" id="vwForm">
														
														<!-- Nav tabs start -->
														<ul class="nav nav-tabs md-tabs tabs-left b-none" role="tablist">
															<li class="nav-item">
																<a class="nav-link active" data-toggle="tab" href="#inforPet" role="tab">Pet</a>
																<div class="slide"></div>
															</li>
															<li class="nav-item">
																<a class="nav-link" data-toggle="tab" href="#inforTutor" role="tab">Tutor</a>
																<div class="slide"></div>
															</li>
															<li class="nav-item">
																<a class="nav-link" data-toggle="tab" href="#historico" role="tab">Histórico</a>
																<div class="slide"></div>
															</li>																													
														</ul>
														<!-- Nav tabs end -->
														
														<!-- Tab panes start -->
														<div class="tab-content tabs-left-content card-block col-lg-12 col-xl-12">
															
															<!-- Pet -->
															<div class="tab-pane active" id="inforPet" role="tabpanel">
																
																<div class="row"> <!-- Primeira Linha -->																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_cpf_pet" id="vw_cpf_pet" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CPF PET</label>
																		</div>
																	</div>																	
																	<div class="col-md-6">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_pet" id="vw_pet" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">PET</label>
																		</div>
																	</div>																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_nasc_pet" id="vw_dt_nasc_pet" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">DATA NASCIMENTO</label>
																		</div>
																	</div>																	
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_especie_pet" id="vw_especie_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">ESPÉCIE</label>
																		</div>
																	</div>																	
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_sexo_pet" id="vw_sexo_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">SEXO</label>
																		</div>
																	</div>	
																													        	
																</div>
																																
																<div class="row"> <!-- Segunda Linha -->																	
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_raca_pet" id="vw_raca_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">RAÇA</label>
																		</div>
																	</div>																	
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_coloracao_pet" id="vw_coloracao_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">COLORAÇÃO</label>
																		</div>
																	</div>																	
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_convivio_pet" id="vw_convivio_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CONVIVIO?</label>
																		</div>
																	</div>																	
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_castrado_pet" id="vw_castrado_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CASTRADO?</label>
																		</div>
																	</div>																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_cadastro_pet" id="vw_dt_cadastro_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">DATA DE CADASTRO</label>
																		</div>
																	</div>																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_alteracao_pet" id="vw_dt_alteracao_pet" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">DATA ÚLTIMA ALTERAÇÃO</label>
																		</div>
																	</div>																														
																</div>
																
																<div class="row"> <!-- Terceira Linha -->																	
																	<div class="col-md-12">
																		<div class="form-group form-default form-static-label">
																			<textarea class="form-control" name="vw_obs_pet" id="vw_obs_pet" readonly></textarea>
																			<span class="form-bar"></span>
																			<label class="float-label">OBSERVAÇÃO</label>
																		</div>
																	</div>																	
																</div>
																
																<div class="row"> <!-- Quarta Linha -->																
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_falecimento_pet" id="vw_dt_falecimento_pet" class="form-control"
																					value="" readonly style="display: none;">
																			<span class="form-bar"></span>
																			<label class="float-label" id="lb_vw_dt_falecimento_pet" style="display: none;">DATA FALECIMENTO</label>
																		</div>
																	</div>																	
																</div>
																
															</div>
															
															<!-- Tutor -->
															<div class="tab-pane" id="inforTutor" role="tabpanel">
																
																<div class="row"> <!-- Primeira Linha -->																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_cpf_tutor" id="vw_cpf_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CPF TUTOR</label>
																		</div>
																	</div>																	
																	<div class="col-md-6">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_tutor" id="vw_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">TUTOR</label>
																		</div>
																	</div>																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_cadastro_tutor" id="vw_dt_cadastro_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">DATA DE CADASTRO</label>
																		</div>
																	</div>																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_dt_alteracao_tutor" id="vw_dt_alteracao_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">DATA ÚLTIMA ALTERAÇÃO</label>
																		</div>
																	</div>
																												        	
																</div>
																																
																<div class="row"> <!-- Segunda Linha -->																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_tel_tutor" id="vw_tel_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">TELEFONE</label>
																		</div>
																	</div>																	
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_whats_tutor" id="vw_whats_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">WHATS?</label>
																		</div>
																	</div>
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_email_tutor" id="vw_email_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">E-MAIL</label>
																		</div>
																	</div>
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_inst_tutor" id="vw_inst_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">INSTAGRAM</label>
																		</div>
																	</div>
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_face_tutor" id="vw_face_tutor" class="form-control"
																					value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">FACEBOOK</label>
																		</div>
																	</div>																											
																</div>
																
																<div class="row"> <!-- Terceira Linha -->																	
																	<div class="col-md-2">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_cep_tutor" id="vw_cep_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CEP</label>
																		</div>
																	</div>
																	<div class="col-md-5">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_logradouro_tutor" id="vw_logradouro_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">LOGRADOURO</label>
																		</div>
																	</div>
																	<div class="col-md-1">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_num_tutor" id="vw_num_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">Nº</label>
																		</div>
																	</div>
																	<div class="col-md-4">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_compl_tutor" id="vw_compl_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">COMPLEMENTO</label>
																		</div>
																	</div>																														
																</div>
																
																<div class="row"> <!-- Quarta Linha -->																
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_bairro_tutor" id="vw_bairro_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">BAIRRO</label>
																		</div>
																	</div>
																	<div class="col-md-3">
																		<div class="form-group form-default form-static-label">
																			<input type="text" name="vw_cidade_tutor" id="vw_cidade_tutor" class="form-control"
																				value="" readonly>
																			<span class="form-bar"></span>
																			<label class="float-label">CIDADE/UF</label>
																		</div>
																	</div>															
																</div>
																
																<div class="row"> <!-- Quinta Linha -->																
																	<div class="col-md-12">
																		<div class="form-group form-default form-static-label">
																			<textarea class="form-control" name="vw_obs_tutor" id="vw_obs_tutor" readonly></textarea>
																			<span class="form-bar"></span>
																			<label class="float-label">OBSERVAÇÃO</label>
																		</div>
																	</div>																	
																</div>
																
															</div>															
															
															<!-- historico -->
															<div class="tab-pane" id="historico" role="tabpanel">																
																<div style="height: 300px; overflow: scroll;">
																	<table class="table" id="listaHist">
																		<thead>
																			<tr>
																				<th scope="col">DATA/HORA (EXEMPLO)</th>
																				<th scope="col">TIPO</th>
																				<th scope="col">EXAMES</th>
																				<th scope="col">MEDICAÇÃO</th>
																				<th scope="col">STATUS</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td>25/05/2023 14:53:60</td>
																				<td>CLINICO GERAL</td>
																				<td>SIM</td>
																				<td>NÃO</td>
																				<td>CONCLUÍDO</td>
																			</tr>
																			<tr>
																				<td>24/05/2023 14:53:60</td>
																				<td>OFTALMO</td>
																				<td>NÃO</td>
																				<td>NÃO</td>
																				<td>CONCLUÍDO</td>
																			</tr>
																			<tr>
																				<td>24/05/2023 14:53:60</td>
																				<td>OFTALMO</td>
																				<td>NÃO</td>
																				<td>NÃO</td>
																				<td>CANCELADO</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>														
															
														</div>
													
													</form>
												</div>
											
											</div>
											<!-- Row start -->
										</div>
										<!-- Informações Fim  -->
										
									</div>
									<!-- Page-body end -->						
								</div>
								<!-- Main-body end -->
							</div>						
						</div>
					
					</div>
				</div>
				
			</div>
		
		</div>
		
		<!-- Required Jquery -->
	 	<jsp:include page="/principal/javascript.jsp"></jsp:include>
		<!-- Required Jquery -->
		
		<!-- Modal PET -->
		<div class="modal fade bd-example-modal-lg" id="modelPet" tabindex="-1" role="dialog" 
				aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="titulo">TÍTULO</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
						<form action="<%= request.getContextPath() %>/pet" id="formPet" class="form-material" method="post">
							
							<div class="row"> <!-- Primeira Linha -->
								<div class="col-md-2">
									<div id="divCpfPet" class="form-group form-default">
										<input type="text" name="cpf_pet" id="cpf_pet" class="form-control"
											value="" required="required">
										<span class="form-bar"></span>
										<label id="lb_cpf_pet" class="float-label">CPF PET</label>
									</div>
								</div>								
								<div class="col-md-6">
									<div id="divNomePet" class="form-group form-default">
										<input type="text" name="nome_pet" id="nome_pet" class="form-control"
											value="" required="required">
										<span class="form-bar"></span>
										<label class="float-label">PET</label>
									</div>
								</div>								
								<div class="col-md-2">
									<div id="divDtPet" class="form-group form-default form-static-label">
										<input type="date" name="dt_nasc_pet" id="dt_nasc_pet" class="form-control"
											value="" required="required">
										<span class="form-bar"></span>
										<label id="lb_dt_nasc_pet" class="float-label">DT NASC</label>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="sexo_pet"
											aria-label="Default select example" id="sexo_pet">
											<option value="-1" >SELECIONE</option>
											<option value="F" >FEMININO</option>
											<option value="M" >MASCULINO</option>
										</select>
										<span class="form-bar"></span>
										<label class="float-label">SEXO</label>
									</div>
								</div>
							</div>
							
							<div class="row"> <!-- Segunda Linha -->
								<div class="col-md-2">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="especie_pet"
											aria-label="Default select example" id="especie_pet">
											<option value="-1" >SELECIONE</option>
											<c:forEach items="${listEspecie}" var="especie">
												<option value="${especie.id}">${especie.especie}</option>
											</c:forEach>
										</select>
										<span class="form-bar"></span>
										<label class="float-label">ESPÉCIE</label>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="raca_pet"
											aria-label="Default select example" id="raca_pet">
											<option value="-1" >SELECIONE</option>
										</select>
										<span class="form-bar"></span>
										<label class="float-label">RAÇA</label>
										
										<c:if test="${ADD_RACA}">
											<button id="btnAddRaca" type="button" class="close" data-toggle="modal" data-target="#novaRaca">
											  Nova Raça
											</button>
										</c:if>
										
									</div>
								</div>								
								<div class="col-md-3">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="cor_pet"
											aria-label="Default select example" id="cor_pet">
											<option value="-1" >SELECIONE</option>
											<c:forEach items="${listCor}" var="cor">
												<option value="${cor.id}">${cor.coloracao}</option>
											</c:forEach>
										</select>
										<span class="form-bar"></span>
										<label class="float-label">COLORAÇÃO</label>
										
										<c:if test="${ADD_COLORACAO}">
											<button id="btnAddCor" type="button" class="close" data-toggle="modal" data-target="#novaCor">
											  Nova Coloração
											</button>
										</c:if>
										
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="convivio_pet"
											aria-label="Default select example" id="convivio_pet">
											<option value="-1" >SELECIONE</option>
											<option value="N" >NÃO</option>
											<option value="S" >SIM</option>
										</select>
										<span class="form-bar"></span>
										<label id="lb_convivio_pet" class="float-label">CONVIVIO?</label>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="castrado_pet"
											aria-label="Default select example" id="castrado_pet">
											<option value="-1" >SELECIONE</option>
											<option value="N" >NÃO</option>
											<option value="S" >SIM</option>
										</select>
										<span class="form-bar"></span>
										<label id="lb_castrado_pet" class="float-label">CASTRADO?</label>
									</div>
								</div>		
							</div>
							
							<div class="row"> <!-- Terceira Linha -->
								<div class="col-md-2">
									<div id="divCpfTutor" class="form-group form-default">
										<input type="text" name="cpf_tutor" id="cpf_tutor" class="form-control"
											value="" required="required">
										<span class="form-bar"></span>
										<label class="float-label">CPF TUTOR</label>										
									</div>										
								</div>
								<div id="div_btn_vinc_tutor" class="col-md-2">
									<div class="form-group form-default">
										<button class="btn waves-effect waves-dark btn-inverse btn-outline-inverse"
										type="button" id="btn_vinc_tutor" onclick="addTutor();">
											Vincular
										</button>										
									</div>										
								</div>															
								<div class="col-md-6">
									<div id="divNomeTutor" class="form-group form-default">
										<input type="text" name="nome_tutor" id="nome_tutor" class="form-control"
											value="" required="required" onfocus="hideLabel()" onblur="checkLabel()">
										<span class="form-bar"></span>
										<label id="lb_nome_tutor" class="float-label">TUTOR</label>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group form-default form-static-label">
										<select class="form-control form-select" name="status_pet"
											aria-label="Default select example" id="status_pet">
											<c:forEach items="${listStatus}" var="status">
												<option value="${status.id}">${status.status}</option>											
											</c:forEach>
										</select>
										<span class="form-bar"></span>
										<label id="lb_status_pet" class="float-label">STATUS</label>
									</div>
								</div>
							</div>
							
							<div class="row"> <!-- Quarta Linha -->
								<div class="col-md-12">
									<div class="form-group form-default">
										<textarea class="form-control" name="obs_pet" id="obs_pet"></textarea>
										<span class="form-bar"></span>
										<label id="lb_obs_pet" class="float-label">OBSERVAÇÃO</label>
									</div>
								</div>
							</div>
							
						</form>					
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
						<button type="button" class="btn btn-primary" onclick="salvar()">Salvar</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal Raca -->
		<div class="modal fade" id="novaRaca" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Nova Raça</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="modal-body">
		        <form action="<%= request.getContextPath() %>/pet" id="formRaca" class="form-material" method="post">
					<div class="form-group form-default form-static-label">
						<select class="form-control form-select" name="novaRacaIdEspecie"
							aria-label="Default select example" id="novaRacaIdEspecie" disabled="disabled">
							<c:forEach items="${listEspecie}" var="especie">
								<option value="${especie.id}" >${especie.especie}</option>
							</c:forEach>
						</select>
						<span class="form-bar"></span>
						<label class="float-label">ESPÉCIE</label>
						
					</div>					
					<div id="divNovaRaca" class="form-group form-default">
						<input type="text" name="descricaoRaca" id="descricaoRaca" class="form-control"
							value="" required="required">
						<span class="form-bar"></span>
						<label class="float-label">Nova Raça</label>
					</div>
				</form>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
		        <button id="btnRaca" type="button" class="btn btn-primary" onclick="addNovaRaca()">Salvar</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<!-- Modal Coloracao -->
		<div class="modal fade" id="novaCor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Nova Coloração</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>		      
		      <div class="modal-body">
		        <form action="<%= request.getContextPath() %>/pet" id="formCor" class="form-material" method="post">
					<div id="divNovaRaca" class="form-group form-default">
						<input type="text" name="descricaoCor" id="descricaoCor" class="form-control"
							value="" required="required">
						<span class="form-bar"></span>
						<label class="float-label">Nova Coloração</label>
					</div>
				</form>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
		        <button id="btnCor" type="button" class="btn btn-primary" onclick="addNovaCor()">Salvar</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<!-- Java Script (Variaveis/Métodos Globais) -->
		<script type="text/javascript">
			var contextPath = "<%= request.getContextPath() %>";
			var urlAction = document.getElementById('formPet').action;
			var tituloModal = document.getElementById("titulo");
			
			document.getElementById('cpf_pet').addEventListener('input', function (e) {
				this.value = this.value.replace(/\D/g, '');
				
				var maxLength = 10;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
			
			document.getElementById('cpf_tutor').addEventListener('input', function (e) {
				this.value = this.value.replace(/\D/g, '');
				
				var maxLength = 11;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
		</script>
		
		<!-- Java Script (Limpar Formulário) -->
		<script type="text/javascript">
			function limparForm(form){
				var elementosForm = document.getElementById(form).elements;
				
				for(i=0; i < elementosForm.length; i++){
					elementosForm[i].value = '';
				}
			}
		</script>

		<!-- Java Script (Informação do PET) -->
		<script type="text/javascript">
			function inforPet(cpf_pet){
				limparForm("vwForm");
				$.ajax({
					method: "get",
					url: urlAction,
					data: "acao=consultar&cpf_pet=" + cpf_pet,
					success: function (response) {
						var json = JSON.parse(response);
						
						document.getElementById('vw_cpf_pet').value = json.pet.cpf_pet;
						document.getElementById('vw_pet').value = json.pet.nome;
						document.getElementById('vw_dt_nasc_pet').value = json.pet.dt_nasc;
						document.getElementById('vw_especie_pet').value = json.pet.raca.especie.especie;
						document.getElementById('vw_raca_pet').value = json.pet.raca.raca;
						document.getElementById('vw_sexo_pet').value = json.pet.sexo;
						document.getElementById('vw_coloracao_pet').value = json.pet.coloracao.coloracao;
						document.getElementById('vw_convivio_pet').value = json.pet.convivio == 'N' ? 'NÃO': 'SIM';
						document.getElementById('vw_castrado_pet').value = json.pet.castrado == 'N' ? 'NÃO': 'SIM';
						document.getElementById('vw_dt_cadastro_pet').value = json.pet.dt_cadastro;
						document.getElementById('vw_dt_alteracao_pet').value = json.pet.dt_alteracao;
						document.getElementById('vw_obs_pet').value = json.pet.observacao;
						document.getElementById('vw_dt_falecimento_pet').value = json.pet.dt_falecimento;
						
						if(json.pet.dt_falecimento == null){
							document.getElementById("lb_vw_dt_falecimento_pet").style.display = "none";
							document.getElementById("vw_dt_falecimento_pet").style.display = "none";
						} else {
							document.getElementById("lb_vw_dt_falecimento_pet").style.display = "block";
							document.getElementById("vw_dt_falecimento_pet").style.display = "block";
						}
						document.getElementById('vw_cpf_tutor').value = json.tutor.cpf;
						document.getElementById('vw_tutor').value = json.tutor.nome;
						document.getElementById('vw_dt_cadastro_tutor').value = json.tutor.dt_cadastro;
						document.getElementById('vw_tel_tutor').value = json.tutor.contato.telefone;						
						document.getElementById('vw_whats_tutor').value = json.tutor.contato.whatsapp == 'S' ? "SIM" : "NÂO";
						document.getElementById('vw_email_tutor').value = json.tutor.contato.email;					
						document.getElementById('vw_inst_tutor').value = json.tutor.redeSocial.instagram;				
						document.getElementById('vw_face_tutor').value = json.tutor.redeSocial.facebook;
						document.getElementById('vw_obs_tutor').value = json.tutor.observacao;
						
						document.getElementById('vw_cep_tutor').value = json.tutor.cep.cep;
						document.getElementById('vw_logradouro_tutor').value = json.tutor.cep.logradouro;
						document.getElementById('vw_num_tutor').value = json.tutor.num_end;
						document.getElementById('vw_compl_tutor').value = json.tutor.compl_end;
						document.getElementById('vw_bairro_tutor').value = json.tutor.cep.bairro.bairro;
						document.getElementById('vw_cidade_tutor').value = 
							json.tutor.cep.bairro.cidade.cidade + "/" + json.tutor.cep.bairro.cidade.estado.uf;						
					}
				});				
			}
		</script>
		
		<!-- Java Script (Eventos Clicks) -->
		<script type="text/javascript">
			document.getElementById("btnAddRaca").addEventListener("click", function() {
		        document.getElementById("novaRacaIdEspecie").value = document.getElementById("especie_pet").value;
		    });
			
			document.addEventListener("DOMContentLoaded", function () {		
				
				var btnNovo = document.getElementById("btnNovo");
				btnNovo.addEventListener("click", function () {
					tituloModal.textContent = "Cadastrar";
					document.getElementById("btnAddRaca").style.display = "none";
		            views(1);
				});
				
				var btnPesquisar = document.getElementById("btnPesquisar");
				btnPesquisar.addEventListener("click", function () {
					tituloModal.textContent = "Pesquisar";
					document.getElementById("btnAddRaca").style.display = "none";
		            views(4);
				});
				
				var btnViewPetList = document.querySelectorAll(".btnViewPet");
				btnViewPetList.forEach(function(btnViewPet) {
					btnViewPet.addEventListener("click", function () {
		                var cpfPet = this.getAttribute("data-id");
		                inforPet(cpfPet);
		            });
				});				
				
				var btnEditarList = document.querySelectorAll(".btnEditar");
				btnEditarList.forEach(function(btnEditar) {
					btnEditar.addEventListener("click", function () {
		                
		                var dataId = this.getAttribute("data-id");
		                var values = dataId.split(",");
		                var cpfPet = values[0].trim();
		                var statusId = values[1].trim();
		                
		                if(statusId == 'BO'){
		                    tituloModal.textContent = "Bloqueado";
		                    views(3);
		                } else {
		                    tituloModal.textContent = "Editar";
		                    views(2);
		                }
		                editarPet(cpfPet);						
		            });
				});
				
			});			
		</script>
		
		<!-- Java Script (Listar as Espécias pelo ID Raça) -->
		<script type="text/javascript">
			document.getElementById("especie_pet").addEventListener("change", function() {
				
				var selectRaca = document.getElementById("raca_pet");
				
				if(document.getElementById("especie_pet").value == -1){
					var option = document.createElement("option");
					document.getElementById("btnAddRaca").style.display = "none";
					
					while (selectRaca.firstChild) {
						selectRaca.removeChild(selectRaca.firstChild);
					}
					
					option.value = "-1";
					option.text = "SELECIONE";
					
					selectRaca.appendChild(option);
				} else {
					document.getElementById("btnAddRaca").style.display = "block";
					$.ajax({
						method: "get",
						url: urlAction,
						data: "acao=listarracas&idespecie=" + document.getElementById("especie_pet").value,
						success: function(response){
							var json = JSON.parse(response);
							
							while (selectRaca.firstChild) {
								selectRaca.removeChild(selectRaca.firstChild);
							}
							
							var defaultOption = document.createElement("option");
							defaultOption.value = "-1"; 
							defaultOption.text = "SELECIONE";
							selectRaca.appendChild(defaultOption);
							
							json.forEach(function(raca) {								
								var option = document.createElement("option");
								if(raca.raca){
									option.value = raca.id;
									option.text = raca.raca;
								}
								selectRaca.appendChild(option);
							});
							
						}
					});
				}
				
			});
		</script>
		
		<!-- Java Script(Views) -->
		<!-- Legenda
		    1 = Cadastrar
		    2 = Editar
		    3 = Editar Bloqueado
		    4 = Pesquisar
		    5 = Alterar Status
		-->
		<script type="text/javascript">
			function views(tipo) {
				var dadosPet =[
				    {id: 'cpf_pet', propriedade: 'readOnly', pesquisar: true},
				    {id: 'nome_pet', propriedade: 'readOnly', pesquisar: true},
				    {id: 'dt_nasc_pet', propriedade: 'readOnly', pesquisar: true},
				    {id: 'sexo_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'especie_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'raca_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'cor_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'convivio_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'castrado_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'status_pet', propriedade: 'disabled', pesquisar: true},
				    {id: 'obs_pet', propriedade: 'readOnly', pesquisar: false},
				    {id: 'cpf_tutor', propriedade: 'readOnly', pesquisar: true},
				    {id: 'nome_tutor', propriedade: 'readOnly', pesquisar: true}
				];
				
				var divPet = [
				    'divCpfPet', 'divNomePet', 'divDtPet', 'divCpfTutor', 'divNomeTutor'
				];
				
				document.getElementById('status_pet').style.display = tipo == 1 ? 'none' : 'block';
				document.getElementById('lb_status_pet').style.display = tipo == 1 ? 'none' : 'block';
				
				if(tipo == 1 || tipo == 2){
				    document.getElementById('div_btn_vinc_tutor').style.display = 'block';
				    btn_vinc_tutor.innerText = "Vincular";				    	
				    document.getElementById("nome_tutor").readOnly = true;				    
				} else {
				    document.getElementById('div_btn_vinc_tutor').style.display = 'none';				    
				}
				
				dadosPet.forEach(function (info) {
					if (info.propriedade == 'readOnly') {
						if(tipo == 1 || tipo == 2 || tipo == 4){
							document.getElementById(info.id).value = "";
							document.getElementById(info.id).readOnly = false;
							if(tipo == 4 && (info.id == 'obs_pet' || info.id == 'dt_nasc_pet')){
								document.getElementById(info.id).style.display = 'none';
								document.getElementById('lb_'+info.id).style.display = 'none';								
							} else if ((tipo == 1 || tipo == 2) && (info.id == 'obs_pet' || info.id == 'dt_nasc_pet')){
								document.getElementById(info.id).style.display = 'block';
								document.getElementById('lb_'+info.id).style.display = 'block';
							}
							if(tipo == 4 && info.id == 'cpf_pet'){
								document.getElementById(info.id).readOnly = false;
							} else if(info.id == 'cpf_pet'){
								document.getElementById(info.id).readOnly = true;
							}
						} else if(tipo == 3){
							document.getElementById(info.id).readOnly = true;
							if(info.id == 'obs_pet' || info.id == 'dt_nasc_pet'){
								document.getElementById(info.id).readOnly = false;
								document.getElementById('lb_'+info.id).readOnly = false;
								document.getElementById(info.id).style.display = 'block';
								document.getElementById('lb_'+info.id).style.display = 'block';
							}
						} else {
							document.getElementById(info.id).readOnly = true;
						}
					} else if (info.propriedade == 'disabled'){
						if(tipo == 1 || tipo == 2 || tipo == 4){
							document.getElementById(info.id).value = "-1";
						    document.getElementById(info.id).readOnly = false;
						    if(tipo == 4){
						    	if(info.id == 'convivio_pet' || info.id == 'castrado_pet'){
						    		document.getElementById(info.id).style.display = 'none';
									document.getElementById('lb_'+info.id).style.display = 'none';
						    	}					    	
						    } else {
						    	if(info.id == 'convivio_pet' || info.id == 'castrado_pet'){
						    		document.getElementById(info.id).style.display = 'block';
									document.getElementById('lb_'+info.id).style.display = 'block';
						    	}
						    }
						} else {
							 document.getElementById(info.id).readOnly = true;
						}
					}
				});
				
				divPet.forEach(function (info) {
					if(tipo == 2){
						document.getElementById(info).classList.add("form-static-label");
					} else {
						if(info != 'divDtPet'){
							document.getElementById(info).classList.remove("form-static-label");							
						}
					}
				});
				
			}
		</script>

		<!-- Java Script (Vincular Tutor) -->
		<script type="text/javascript">
			function addTutor(){
				if(document.getElementById("btn_vinc_tutor").textContent == "Desvincular"){
					document.getElementById('cpf_tutor').value = '';
					document.getElementById('nome_tutor').value = '';
					document.getElementById('nome_tutor').value = '';
					document.getElementById("btn_vinc_tutor").textContent = "Vincular";
					document.getElementById('lb_nome_tutor').style.display = "block";
					document.getElementById('divNomeTutor').classList.remove("form-static-label");
				} else {
					$.ajax({
						method: "get",
						url: urlAction,
						data: "acao=consultartutor&cpf_tutor=" + document.getElementById('cpf_tutor').value,
						success: function(response){
							var json = JSON.parse(response);						
							if(json.cpf != null){
								document.getElementById('nome_tutor').value = json.nome;
								document.getElementById('lb_nome_tutor').style.display = "none";
								document.getElementById("btn_vinc_tutor").textContent = "Desvincular";
								document.getElementById('divNomeTutor').classList.add("form-static-label");	
							} else {
								alert("Não há cadastro no sistema para o CPF informado.");							
							}
						}
					});
				}
			}
		</script>
		
		<!-- Java Script (Salvar Pet) -->
		<script type="text/javascript">			
			function salvar(){
				if(tituloModal.textContent == "Cadastrar" || tituloModal.textContent == "Editar"){
					$.ajax({
						method: "post",
						url: urlAction,
						data: $('#formPet').serialize(),
						success: function(response){
							var resposta = response.replace(/\\n/g, '\n').replace(/"/g, '');
							if(resposta == "aprovado"){
								window.location.reload();							
							} else {
								var resposta = response.replace(/\\n/g, '\n').replace(/"/g, '');
								alert(resposta);
							}
						}
					});
				} else if(tituloModal.textContent == "Pesquisar"){
					pesquisarPet();
				} else if(tituloModal.textContent == "Bloqueado"){
					alterPet();
				}
			}
		</script>
		
		<!-- Java Script (Editar Pet) -->
		<script type="text/javascript">
			function editarPet(cpf_pet){
				$.ajax({
					method: "get",
					url: urlAction,
					data: "acao=consultar&cpf_pet=" + cpf_pet,
					success: function (response) {
						var json = JSON.parse(response);
						var data = new Date(json.pet.dt_nasc);
		            	var dtNasc = data.getFullYear() + "-" + String(data.getDate()).padStart(2, '0') + "-" +
		            		String(data.getMonth() + 1).padStart(2, '0');
						
						document.getElementById('cpf_pet').value = json.pet.cpf_pet;
						document.getElementById('nome_pet').value = json.pet.nome;
						document.getElementById('dt_nasc_pet').value = dtNasc;
						document.getElementById('sexo_pet').value = json.pet.sexo;
						
						document.getElementById('especie_pet').value = json.pet.raca.especie.id;						
						var especiePetSelect = document.getElementById('especie_pet');
						var changeEvent = new Event('change', { bubbles: true });
						especiePetSelect.dispatchEvent(changeEvent);
						
						setTimeout(function() {
							document.getElementById('raca_pet').value = json.pet.raca.id;
						}, 100);
						
						document.getElementById('cor_pet').value = json.pet.coloracao.id;
						document.getElementById('convivio_pet').value = json.pet.convivio;
						document.getElementById('castrado_pet').value = json.pet.castrado;
						document.getElementById('status_pet').value = json.pet.status.id;						
						document.getElementById('obs_pet').value = json.pet.observacao;
						
						document.getElementById('cpf_tutor').value = json.tutor.cpf;
						document.getElementById('nome_tutor').value = json.tutor.nome;
						
						if(json.tutor.cpf != null){
							document.getElementById("btn_vinc_tutor").textContent = "Desvincular";
							document.getElementById('lb_nome_tutor').style.display = 'none';
							document.getElementById('nome_tutor').readOnly = true;
						} else {
							document.getElementById("btn_vinc_tutor").textContent = "Vincular";
							document.getElementById('lb_nome_tutor').style.display = 'none';
							document.getElementById('nome_tutor').readOnly = true;
						}						
					}
				});
			}
		</script>
		
		<!-- Java Script (Pesquisar Pet) -->
		<script type="text/javascript">
			function pesquisarPet(){
				var mensagem;
				
				if(document.getElementById('cpf_pet').value != ''){
					
					if(document.getElementById('cpf_pet').value.length < 10){
						mensagem += "Erro: \n";
						mensagem += "CPF PET informado com a quantidade de dígitos inferior a 10.\n";
						mensagem += "Por favor, verifique o CPF digite novamente.";
						alert(mensagem);
					} else {
						window.location.href = contextPath + "/pet?acao=filtro&opcao=1&valor=" +
							document.getElementById('cpf_pet').value;						
					}
					
				} else if (document.getElementById('nome_pet').value != ''){
					
					if(document.getElementById('nome_pet').value.toLowerCase() == 'todos'){
						window.location.href = contextPath + "/pet?acao=listar";
					} else {
						window.location.href = contextPath + "/pet?acao=filtro&opcao=2&valor=" +
							document.getElementById('nome_pet').value;
					}
					
				} else if (document.getElementById('sexo_pet').value != ''
						&& document.getElementById('sexo_pet').value != '-1'){
					
					window.location.href = contextPath + "/pet?acao=filtro&opcao=3&valor=" +
						document.getElementById('sexo_pet').value;
		
				} else if (document.getElementById('especie_pet').value != ''
						&& document.getElementById('especie_pet').value != '-1'){
					
					if(document.getElementById('raca_pet').value == '-1'){
						window.location.href = contextPath + "/pet?acao=filtro&opcao=6&valor=" +
							document.getElementById('especie_pet').value;
					} else{
						window.location.href = contextPath + "/pet?acao=filtro&opcao=7&valor=" +
							document.getElementById('raca_pet').value;
					}
					
				} else if (document.getElementById('cor_pet').value != ''
						&& document.getElementById('cor_pet').value != '-1'){
					
					window.location.href = contextPath + "/pet?acao=filtro&opcao=8&valor=" +
						document.getElementById('cor_pet').value;
		
				} else if (document.getElementById('cpf_tutor').value != ''){
					
					window.location.href = contextPath + "/pet?acao=filtro&opcao=5&valor=" +
						document.getElementById('cpf_tutor').value;
					
				} else if (document.getElementById('nome_tutor').value != ''){
					
					window.location.href = contextPath + "/pet?acao=filtro&opcao=4&valor=" +
						document.getElementById('nome_tutor').value;
				}
			}
		</script>
		
		<!-- Java Script (Alter Status Pet) -->
		<script type="text/javascript">
			function alterPet(){
				$.ajax({
					method: "get",
					url: urlAction,
					data: "acao=status&cpf_pet=" + document.getElementById('cpf_pet').value + 
						"&statuspet=" + document.getElementById('status_pet').value,
					success: function(response){
						var resposta = response.replace(/\\n/g, '\n').replace(/"/g, '');
						if(resposta == "alterado"){
							window.location.reload();							
						}
					}
				});
			}
		</script>
		
		<!-- Java Script (adicionar Raca) -->
		<script type="text/javascript">
			function addNovaRaca(){
				if(document.getElementById('descricaoRaca').value == ''){
					alert("O campo Descrição deve ser preenchido");
					return
				} else {
					$.ajax({
						method: "post",
						url: urlAction,
						data: $('#formRaca').serialize() +
						"&novaRacaIdEspecie=" + document.getElementById('novaRacaIdEspecie').value,
						success: function(response){
							var parsedResponse = JSON.parse(response);
							var options = '<option value="-1">SELECIONE</option>';
							
							parsedResponse.forEach(function(raca) {
								options += '<option value="' + raca.id + '">' + raca.raca + '</option>';
							});
							
							$('#raca_pet').html(options);
							$('#novaRaca').modal('hide');
						}
					});
				}
			}
		</script>
		
		<!-- Java Script (adicionar Cor) -->
		<script type="text/javascript">
			function addNovaCor(){
				if(document.getElementById('descricaoCor').value == ''){
					alert("O campo Descrição deve ser preenchido");
					return
				} else {
					$.ajax({
						method: "post",
						url: contextPath + "/pet",
						data: $('#formCor').serialize(),
						success: function(response){
							var parsedResponse = JSON.parse(response);
							var options = '<option value="-1">SELECIONE</option>';
							
							parsedResponse.forEach(function(cor) {
								options += '<option value="' + cor.id + '">' + cor.coloracao + '</option>';
							});
							
							$('#cor_pet').html(options);
							$('#novaCor').modal('hide');
							
						}
					})
				}
			}
		</script>

		<!-- Java Script(Label Tutor) -->
		<script type="text/javascript">
			function hideLabel() {
				if(tituloModal.textContent != "Pesquisar"){
					document.getElementById('lb_nome_tutor').style.display = 'none';					
				}
			}
			
			function checkLabel() {
				if(tituloModal.textContent != "Pesquisar"){
					const nomeTutor = document.getElementById('nome_tutor').value;
				    if (nomeTutor === '') {
				      document.getElementById('lb_nome_tutor').style.display = 'block';
				    }
				}				
			}
		</script>
		
		<!-- Java Script() -->
		<script type="text/javascript">
			
		</script>
	</body>
	
</html>