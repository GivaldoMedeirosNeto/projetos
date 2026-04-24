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
										
											<!-- Row start titulo -->
											<div class="row">										
												<div class="col-lg-12 col-xl-12">
													<div class="card-header"><h5>TUTOR</h5></div>												
												</div>																						
											</div>
											<!-- Row end -->
											
											<!-- Tab variant tab card Botões start -->
											<div class="row">
												<div class="col-lg-12 col-xl-12">
													<div class="card-header">
														<div class="row">
															<div class="col-md-12">														
																<c:if test="${ADD_TUTOR}">
																	<button class="btn btn-primary btn-round waves-effect waves-light"
																		data-toggle="modal" data-target="#modelTutor" type="button"
																		id="btnNovo" >Novo
																	</button>
																</c:if>
																<button style="background: none; border: none;"></button>
																<button class="btn btn-info btn-round waves-effect waves-light"
																	type="button" data-toggle="modal" data-target="#modelTutor"
																	id="btnPesquisar" >Pesquisar
																</button>
																<button style="background: none; border: none;"></button>
																<button class="btn btn-success btn-round waves-effect waves-light"
																	type="button" data-toggle="modal" data-target="#modelPetV"
																	id="btnVincPet" >Vincular Pet
																</button>																													
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- Tab variant tab card Botões end -->
											
											<!-- Tab variant tab card Lista start -->
											<div class="card">
												<div class="col-lg-12 col-xl-12">													
													<div class="row">
														<!-- VIEW TUTOR -->
														<div class="card-header col-md-9">
															<div class="card-header ">
														       <h5>${qtd} ${qtd > 1 ? 'Tutores Cadastrados' : 'Tutor Cadastrado'}</h5>
														   </div>
														   
														   <div style="height: 515px; overflow: scroll;">
														   		<table class="table" id="listaTutor">
														            <thead>
														                <tr>
														                    <th scope="col">CPF</th>
														                    <th scope="col">TUTOR</th>																	
														                    <th scope="col">CONTATO</th>
														                    <th scope="col">STATUS</th>
														                </tr>
														            </thead>
														            <tbody>
														                <c:forEach items="${listTutor}" var='listaTutor'>
														                    <tr>
														                    
														                        <c:set var="rowStyle" value="color: ${listaTutor.status.cor}" />
														                    
														                        <td style="${rowStyle}">
														                            <c:out value="${listaTutor.cpf}"></c:out>
														                        </td>
														                        
														                        <td style="${rowStyle}">
														                            <a class="btn btn-round waves-effect btnViewTutor" data-toggle="modal"
														                                data-target="" data-id="${listaTutor.cpf}">
														                            <c:out value="${listaTutor.nome}" />
														                            </a>
														                        </td>
														                        
														                        <td style="${rowStyle}">
														                            <c:out value="${listaTutor.contato.telefone}"></c:out>
														                        </td>
														                        
														                        <td style="${rowStyle}">
														                            <c:out value="${listaTutor.status.id}"></c:out>
														                        </td>
														                        
														                        <td style="${rowStyle}">
														                        	<c:choose>
																					    <c:when test="${UPD_TUTOR}">
																					        <c:choose>
																					            <c:when test="${lista.status.id != 'FA'}">
																					                <a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																					                    data-target="#modelTutor" data-id="${listaTutor.cpf}, ${listaTutor.status.id}">Editar</a>
																					            </c:when>
																					        </c:choose>
																					    </c:when>
																					</c:choose>
														                        </td>
														                        														                                                                        
														                    </tr>
														                </c:forEach>
														            </tbody>
														        </table>
														   </div>
														</div>
														
														<!-- VIEW PET -->
														<div class="card-header col-md-3">
															<div class="card-header">
														       <h5 id="qdtPet">Pets Vinculados</h5>
														   </div>
														   
														   <div style="height: 515px; overflow: scroll;">
														   		<table class="table" id="listaPet">
														            <thead>
														                <tr>
														                    <th scope="col">PET</th>
														                </tr>
														            </thead>
														            <tbody></tbody>
														        </table>
														   </div>
														</div>
														
														<!-- LEGENDA -->
														<div class="card-header col-md-12">
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
																	<a class="nav-link active" data-toggle="tab" href="#dadosTutor" role="tab">Dados</a>
																	<div class="slide"></div>
																</li>
																<li class="nav-item">
																	<a class="nav-link" data-toggle="tab" href="#endTutor" role="tab">Endereço</a>
																	<div class="slide"></div>
																</li>
																<li class="nav-item">
																	<a class="nav-link" data-toggle="tab" href="#redeSocial" role="tab">Redes Sociais</a>
																	<div class="slide"></div>
																</li>																													
															</ul>
															<!-- Nav tabs end -->
															
															<!-- Tab panes start -->
															<div class="tab-content tabs-left-content card-block col-lg-12 col-xl-12">
															
																<!-- Dados -->
																<div class="tab-pane active" id="dadosTutor" role="tabpanel">
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
																				<input type="text" name="vw_contato" id="vw_contato" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">CONTATO</label>
																			</div>
																		</div>
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_whats" id="vw_whats" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">WHATS?</label>
																			</div>
																		</div>
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_rg" id="vw_rg" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">RG</label>
																			</div>																		
																		</div>																																				
																	</div>
																	<div class="row"> <!-- Segunda Linha -->
																		<div class="col-md-3">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_email" id="vw_email" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">E-MAIL</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_dt_nasc" id="vw_dt_nasc" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">DATA NASCIMENTO</label>
																			</div>
																		</div>
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_sexo" id="vw_sexo" class="form-control"
																						value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">SEXO</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_dt_cadastro" id="vw_dt_cadastro" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">DATA CADASTRO</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_dt_alteracao" id="vw_dt_alteracao" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">DATA ALTERAÇÃO</label>
																			</div>
																		</div>
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_status" id="vw_status" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">STATUS</label>
																			</div>
																		</div>
																	</div>
																	<div class="row"> <!-- Terceira Linha -->
																		<div class="col-md-12">
																			<div class="form-group form-default form-static-label">
																				<textarea class="form-control" name="vw_obs" id="vw_obs" readonly></textarea>
																				<span class="form-bar"></span>
																				<label class="float-label">OBSERVAÇÃO</label>
																			</div>
																		</div>
																	</div>
																</div>
																
																<!-- Endereço -->
																<div class="tab-pane" id="endTutor" role="tabpanel">
																	<div class="row"> <!-- Primeira Linha -->
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_cep" id="vw_cep" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">CEP</label>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_logradouro" id="vw_logradouro" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">LOGRADOURO</label>
																			</div>																		
																		</div>
																		<div class="col-md-1">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_num_end" id="vw_num_end" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">NÚMERO</label>
																			</div>																		
																		</div>
																		<div class="col-md-4">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_compl_end" id="vw_compl_end" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">COMPLEMENTO</label>
																			</div>																		
																		</div>																																			
																	</div>
																	<div class="row"> <!-- Segunda Linha -->
																		<div class="col-md-3">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_bairro" id="vw_bairro" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">BAIRRO</label>
																			</div>																		
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_cidade" id="vw_cidade" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">CDIADE/UF</label>
																			</div>																		
																		</div>
																	</div>
																</div>
																
																<!-- Redes Sociais -->
																<div class="tab-pane" id="redeSocial" role="tabpanel">
																	<div class="row"> <!-- Primeira Linha -->
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_instagram" id="vw_instagram" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">INSTAGRAM</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_youtube" id="vw_youtube" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">YOUTUBE</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_linkedin" id="vw_linkedin" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">LINKEDIN</label>
																			</div>
																		</div>
																	</div>
																	<div class="row"> <!-- Segunda Linha -->
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_facebook" id="vw_facebook" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">FACEBOOK</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_snapchat" id="vw_snapchat" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">FACEBOOK</label>
																			</div>
																		</div>
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_twitter" id="vw_twitter" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">TWITTER</label>
																			</div>
																		</div>
																	</div>
																	<div class="row"> <!-- Terceira Linha -->
																		<div class="col-md-2">
																			<div class="form-group form-default form-static-label">
																				<input type="text" name="vw_tiktok" id="vw_tiktok" class="form-control"
																					value="" readonly>
																				<span class="form-bar"></span>
																				<label class="float-label">TIKTOK</label>
																			</div>
																		</div>
																	</div>																	
																</div>																
															</div>
															
															
														</form>
													
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							
							</div>						
						</div>
						
	            	</div>
	          	</div>
	          	
	        </div>
	        
	    </div>
    
	    <!-- Required Jquery -->
	 	<jsp:include page="/principal/javascript.jsp"></jsp:include>
		<!-- Required Jquery -->
		
		<!-- Modal Tutor -->
		<div class="modal fade bd-example-modal-lg" id="modelTutor" tabindex="-1" role="dialog" 
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
						<form action="<%= request.getContextPath() %>/tutor" id="formTutor" class="form-material" method="post">
							<div class="tab-content tabs-top-content card-block  col-lg-12 col-xl-12">								
								<!-- Nav tabs start -->
								<ul class="nav nav-tabs md-tabs tabs-top b-none" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#cadDados" role="tab">Dados</a>
										<div class="slide"></div>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#cadRede" role="tab">Redes Sociais</a>
										<div class="slide"></div>
									</li>																													
								</ul>
								<!-- Nav tabs end -->	
								<!-- Tab panes start -->
								<div class="tab-content tabs-left-content card-block col-lg-12 col-xl-12">
									<!-- Dados -->
									<div class="tab-pane active" id="cadDados" role="tabpanel">
										<div class="row"> <!-- Linha Zero-->
											<div class="col-md-12">
										        <div id="zero" class="form-group form-default">
										            <input type="text" name="zero" id="zero" class="form-control"
										                value="" disabled>
										            <span class="form-bar"></span>
										            <label id="lb_zero" class="float-label"></label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Primeira Linha -->
										    <div class="col-md-2">
										        <div id="divCpfTutor" class="form-group form-default">
										            <input type="text" name="cpf_tutor" id="cpf_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_cpf_tutor" class="float-label">CPF TUTOR</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divNomeTutor" class="form-group form-default">
										            <input type="text" name="nome_tutor" id="nome_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label class="float-label">TUTOR</label>
										        </div>
										    </div>
										    <div class="col-md-2">
										        <div id="divRgTutor" class="form-group form-default">
										            <input type="text" name="rg_tutor" id="rg_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label class="float-label">RG</label>
										        </div>
										    </div>
										    <div class="col-md-2">
										        <div class="form-group form-default form-static-label">
										            <select class="form-control form-select" name="sexo_tutor"
										                aria-label="Default select example" id="sexo_tutor">
										                <option value="-1" >SELECIONE</option>
										                <option value="F" >FEMININO</option>
										                <option value="M" >MASCULINO</option>
										            </select>
										            <span class="form-bar"></span>
										            <label id="lb_sexo_tutor" class="float-label">SEXO</label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Segunda Linha -->
											<div class="col-md-2">
										        <div id="divDtNascTutor" class="form-group form-default form-static-label">
										            <input type="date" name="dt_nasc_tutor" id="dt_nasc_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_dt_nasc_tutor" class="float-label">DT NASC</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divEmailTutor" class="form-group form-default">
										            <input type="text" name="email_tutor" id="email_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_email_tutor" class="float-label">E-MAIL</label>
										        </div>
										    </div>
										    <div class="col-md-2">
										        <div id="divContatoTutor" class="form-group form-default">
										            <input type="text" name="contato_tutor" id="contato_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_contato_tutor" class="float-label">CONTATO</label>
										        </div>
										    </div>
										    <div class="col-md-2">
										        <div class="form-group form-default form-static-label">
										            <select class="form-control form-select" name="whats_tutor"
										                aria-label="Default select example" id="whats_tutor">
										                <option value="-1" >SELECIONE</option>
										                <option value="S" >SIM</option>
										                <option value="N" >NÃO</option>
										            </select>
										            <span class="form-bar"></span>
										            <label id="lb_whats_tutor" class="float-label">WHATS?</label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Terceira Linha -->
											<div class="col-md-2">
										        <div id="divCepTutor" class="form-group form-default">
										            <input type="text" name="cep_tutor" id="cep_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label class="float-label">CEP</label>
										        </div>
										    </div>
										    <div class="col-md-2">
												<div class="form-group form-default">
													<button type="button" class="btn btn-round waves-effect" id="btnCep"
														onclick="pesquisarCep()">Consultar</button>
												</div>
											</div>
											<div class="col-md-6">
										        <div id="divLogEnd" class="form-group form-default">
										            <input type="text" name="logradouro_end" id="logradouro_end" class="form-control"
										                value="" readOnly>
										            <span class="form-bar"></span>
										            <label id="lb_log_end" class="float-label">LOGRADOURO</label>
										        </div>
										    </div>
										    <div class="col-md-2">
										        <div id="divNumEnd" class="form-group form-default">
										            <input type="text" name="num_end" id="num_end" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_num_end" class="float-label">Nº</label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Quarta Linha -->
											<div class="col-md-4">
										        <div id="divComplEnd" class="form-group form-default">
										            <input type="text" name="compl_end" id="compl_end" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_compl_end" class="float-label">COMPLEMENTO</label>
										        </div>
										    </div>
										    <div class="col-md-4">
										        <div id="divBairroEnd" class="form-group form-default">
										            <input type="text" name="bairro_end" id="bairro_end" class="form-control"
										                value="" readOnly>
										            <span class="form-bar"></span>
										            <label id="lb_bairro_end" class="float-label">BAIRRO</label>
										        </div>
										    </div>
										    <div class="col-md-4">
										        <div id="divCidadeEnd" class="form-group form-default">
										            <input type="text" name="cidade_end" id="cidade_end" class="form-control"
										                value="" readOnly>
										            <span class="form-bar"></span>
										            <label id="lb_cidade_end" class="float-label">CIDADE/UF</label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Quinta Linha -->
											<div class="col-md-12">
												<div class="form-group form-default">
													<textarea class="form-control" name="obs_tutor" id="obs_tutor"></textarea>
													<span class="form-bar"></span>
													<label id="lb_obs_tutor" class="float-label">OBSERVAÇÃO</label>
												</div>
											</div>
										</div>
										<div class="row"> <!-- Sexta Linha -->
											<div class="col-md-2">
											    <div class="form-group form-default form-static-label">
											        <select class="form-control form-select" name="status_tutor"
											            aria-label="Default select example" id="status_tutor">
											            <c:forEach items="${listStatus}" var="status">
											            	<c:if test="${status.id != 'FA'}">
											                	<option value="${status.id}">${status.status}</option>	
											                </c:if>										
											            </c:forEach>
											        </select>
											        <span class="form-bar"></span>
											        <label id="lb_status_tutor" class="float-label">STATUS</label>
											    </div>
											</div>
										</div>
									</div>
									
									<!-- Redes Sociais -->
									<div class="tab-pane" id="cadRede" role="tabpanel">
										<div class="row"> <!-- Linha Zero-->
											<div class="col-md-12">
										        <div id="zero1" class="form-group form-default">
										            <input type="text" name="zero1" id="zero1" class="form-control"
										                value="" disabled>
										            <span class="form-bar"></span>
										            <label id="lb_zero1" class="float-label"></label>
										        </div>
										    </div>
										</div>
										<div class="row"> <!-- Primeira Linha -->
											<div class="col-md-6">
										        <div id="divInstTutor" class="form-group form-default">
										            <input type="text" name="inst_tutor" id="inst_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_inst_tutor" class="float-label">INSTAGRAM</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divYouTutor" class="form-group form-default">
										            <input type="text" name="you_tutor" id="you_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_you_tutor" class="float-label">YOUTUBE</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divlinkTutor" class="form-group form-default">
										            <input type="text" name="link_tutor" id="link_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_link_tutor" class="float-label">LINKEDIN</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divFaceTutor" class="form-group form-default">
										            <input type="text" name="face_tutor" id="face_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_face_tutor" class="float-label">FACEBOOK</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divSnapTutor" class="form-group form-default">
										            <input type="text" name="snap_tutor" id="snap_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_snap_tutor" class="float-label">SNAPCHAT</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divTwitTutor" class="form-group form-default">
										            <input type="text" name="twit_tutor" id="twit_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_twit_tutor" class="float-label">TWITTER</label>
										        </div>
										    </div>
										    <div class="col-md-6">
										        <div id="divTikTutor" class="form-group form-default">
										            <input type="text" name="tik_tutor" id="tik_tutor" class="form-control"
										                value="" required="required">
										            <span class="form-bar"></span>
										            <label id="lb_tik_tutor" class="float-label">TIKTOK</label>
										        </div>
										    </div>
										</div>
									</div>
								</div>
								
									
								<!-- Tab panes end -->
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
		
		<!-- Modal Desvincular Pet-->
		<div class="modal fade" id="modelPetD" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="TituloModalCentralizado">Desvincular o PET</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	Deseja Desvincular o PET: <span id="data-id-nome"></span>(<span id="data-id-cpf"></span>)<br>
		      	do tutor <span id="data-id-tutor"></span>?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
		        <button type="button" class="btn btn-primary" onclick="desvincular()">Confirmar</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal Vincular Pet-->
		<div class="modal fade" id="modelPetV" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="TituloModalCentralizado">Vincular PET</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body col-lg-12 col-xl-12">
		      	<div class="row"> <!-- Linha Zero-->
			      	<div class="col-md-6">
				        <div class="form-group form-default form-static-label">
				            <select class="form-control form-select" name="vinc_tutor"
				                aria-label="Default select example" id="vinc_tutor">
				                <option value="-1" >SELECIONE</option>
				            </select>
				            <span class="form-bar"></span>
				            <label class="float-label">TUTOR</label>
				        </div>
				    </div>
				    <div class="col-md-6">
				        <div class="form-group form-default form-static-label">
				            <select class="form-control form-select" name="vinc_pet"
				                aria-label="Default select example" id="vinc_pet">
				                <option value="-1" >SELECIONE</option>
				            </select>
				            <span class="form-bar"></span>
				            <label class="float-label">PET</label>
				        </div>
				    </div>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
		        <button type="button" class="btn btn-primary" onclick="vincular()">Confirmar</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal Migrar Vet-->
		<div class="modal fade" id="modelVet" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="TituloModalCentralizado">Migrar VET -> TUTOR</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body col-lg-12 col-xl-12">
		      	<h4>CPF já cadastrado como Veterinário.</h4>
		      	<h5>Confirma a migração dos dados para TUTOR?</h5>		      	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
		        <button type="button" class="btn btn-primary" onclick="migrar()">Confirmar</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Java Script(Variaveis/Métodos Globais) -->
		<script type="text/javascript">
			var contextPath = "<%= request.getContextPath() %>";
			var urlAction = document.getElementById('formTutor').action;
			var tituloModal = document.getElementById("titulo");
			
			document.getElementById('cpf_tutor').addEventListener('input', function (e) {
				this.value = this.value.replace(/\D/g, '');
				
				var maxLength = 11;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
			
			document.getElementById('cep_tutor').addEventListener('input', function (e) {
				this.value = this.value.replace(/\D/g, '');
				
				var maxLength = 8;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
			
			document.getElementById('num_end').addEventListener('input', function (e) {
				var maxLength = 6;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
			
			document.getElementById('contato_tutor').addEventListener('input', function (e) {
				var maxLength = 11;
				if (this.value.length > maxLength) {
					this.value = this.value.slice(0, maxLength);
				}
			});
			
		</script>
		
		<!-- Java Script(Eventos Clicks) -->
		<script type="text/javascript">
		
			document.addEventListener("DOMContentLoaded", function () {
				
				var btnNovo = document.getElementById("btnNovo");
				btnNovo.addEventListener("click", function () {
					tituloModal.textContent = "Cadastrar";
					views(1);
				});
				
				var btnPesquisar = document.getElementById("btnPesquisar");
				btnPesquisar.addEventListener("click", function () {
					tituloModal.textContent = "Pesquisar";
					views(4);
				});
				
				var btnEditarList = document.querySelectorAll(".btnEditar");
				btnEditarList.forEach(function(btnEditar) {
					btnEditar.addEventListener("click", function () {
						
						var dataId = this.getAttribute("data-id");
						var values = dataId.split(",");
						var cpfTutor = values[0].trim();
						var statusId = values[1].trim();
						
						if(statusId == 'BO'){
							tituloModal.textContent = "Bloqueado";
							views(3);
						} else {
							tituloModal.textContent = "Editar";
							views(2);
						}
						editarTutor(cpfTutor);						
					});
				});
				
				var btnViewTutorList = document.querySelectorAll(".btnViewTutor");
				btnViewTutorList.forEach(function(btnViewTutor) {
					btnViewTutor.addEventListener("click", function () {
						var cpfTutor = this.getAttribute("data-id");
						inforTutor(cpfTutor);
					});
				});
				
				var btnStatusList = document.querySelectorAll(".btnStatus");
				btnStatusList.forEach(function(btnStatus) {
					btnStatus.addEventListener("click", function () {
						tituloModal.textContent = "Alterar Status";
						
						var dataId = this.getAttribute("data-id");
						var values = dataId.split(",");
						var cpfTutor = values[0].trim();
						var statusId = values[1].trim();
						
						if(statusId == 'CA'){
							tituloModal.textContent = "Ativar";							
						} else if(statusId == 'AT'){
							tituloModal.textContent = "Cancelar";
							alert("Cancelar Tutor");
						}else if(statusId == 'BO'){
							tituloModal.textContent = "Desbloquear";
							alert("Desbloquear Tutor");
						}
						views(5);
						
					});
				});
				
				var btnVincPet = document.getElementById("btnVincPet");
				btnVincPet.addEventListener("click", function () {
					listarPetTutor();
				});
				
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
		
		<!-- Java Script(Informação Tutor) -->
		<script type="text/javascript">
			function inforTutor(cpfTutor){
				limparForm("vwForm");
				$.ajax({
					method: "get",
					url: urlAction,
					data: "acao=consultar&cpf_tutor=" + cpfTutor,
					success: function (response) {
						var json = JSON.parse(response);
						
						document.getElementById('vw_cpf_tutor').value = json.cpf;
						document.getElementById('vw_tutor').value = json.nome;
						document.getElementById('vw_contato').value = json.contato.telefone;
						document.getElementById('vw_whats').value =
							json.contato.whatsapp == '' ? "" : json.contato.whatsapp == 'S' ? "SIM" : "NÃO";
						document.getElementById('vw_rg').value = json.rg;
						document.getElementById('vw_email').value = json.contato.email;
						document.getElementById('vw_dt_nasc').value = json.dt_nasc;
						document.getElementById('vw_sexo').value = json.sexo;
						document.getElementById('vw_dt_cadastro').value = json.dt_cadastro;
						document.getElementById('vw_dt_alteracao').value = json.dt_alteracao;
						document.getElementById('vw_status').value = json.status.id;
						document.getElementById('vw_obs').value = json.observacao;
						
						document.getElementById('vw_instagram').value = json.redeSocial.instagram;
						document.getElementById('vw_youtube').value = json.redeSocial.youtube;
						document.getElementById('vw_linkedin').value = json.redeSocial.linkedin;
						document.getElementById('vw_facebook').value = json.redeSocial.facebook;
						document.getElementById('vw_snapchat').value = json.redeSocial.snapchat;
						document.getElementById('vw_twitter').value = json.redeSocial.twitter;
						document.getElementById('vw_tiktok').value = json.redeSocial.tiktok;
						
						document.getElementById('vw_cep').value = json.cep.cep;
						document.getElementById('vw_logradouro').value = json.cep.logradouro;
						document.getElementById('vw_num_end').value = json.num_end;
						document.getElementById('vw_compl_end').value = json.compl_end;
						document.getElementById('vw_bairro').value = json.cep.bairro.bairro;
						if(json.cep.bairro.cidade.estado.uf == null){
							document.getElementById('vw_cidade').value = '';
						} else {
							document.getElementById('vw_cidade').value =
								json.cep.bairro.cidade.cidade + "/" + json.cep.bairro.cidade.estado.uf;
						}
						petTutor(cpfTutor);
					}
				});
			}			
		</script>
		
		<!-- Java Script(Pets do Tutor) -->
		<script type="text/javascript">
			function petTutor(cpfTutor){
				var tableBody = document.getElementById('listaPet').getElementsByTagName('tbody')[0];
				tableBody.innerHTML = '';
				
				$.ajax({
					method: "get",
					url: urlAction,
					data: "acao=consultarpets&cpf_tutor=" + cpfTutor,
					success: function (response) {
						var json = JSON.parse(response);
						
						document.getElementById('qdtPet').textContent = json.length > 1 ?
	                		json.length + " Pets Vinculados" : json.length + " Pet Vinculado";
												
						for (var i = 0; i < json.length; i++) {
			                var pet = json[i];
			                var row = document.createElement('tr');
			                var cell1 = document.createElement('td');
			                var cell2 = document.createElement('td');
			                var link = document.createElement('a');
			                
			                cell1.textContent = pet.nome;
			                cell1.style.color = pet.status.cor;
			                
			                if (pet.status.id != 'FA') {
		                        var linkText = document.createTextNode("X");
		                        link.appendChild(linkText);
		                        link.className = "btn btn-round waves-effect";
		                        link.setAttribute("data-toggle", "modal");
		                        link.setAttribute("data-target", "#modelPetD");
		                        link.setAttribute("data-id-cpf", pet.cpf_pet);
		                        link.setAttribute("data-id-nome", pet.nome);

		                        // Adicione o evento de clique ao link "X" aqui
		                        link.addEventListener('click', function () {
		                            var modal = $('#modelPetD');
		                            var cpfPet = this.getAttribute("data-id-cpf");
		                            var nomePet = this.getAttribute("data-id-nome");
		                            var nomeTutor = document.getElementById('vw_tutor').value;
		                            
		                            modal.find('#data-id-cpf').text(cpfPet);
		                            modal.find('#data-id-nome').text(nomePet);
		                            modal.find('#data-id-tutor').text(nomeTutor);
		                            
		                            modal.modal('show');

		                            $('#confirmarDesvincular').on('click', function () {
		                                // Adicione o código aqui para confirmar a desvinculação do PET
		                                // Pode usar cpfPet para obter o CPF do PET que está sendo desvinculado
		                                // Feche o modal quando a operação for concluída
		                                modal.modal('hide');
		                            });
		                        });

		                        cell2.appendChild(link);
		                    } else {
		                        cell2.textContent = ""; // Evitar que um link seja gerado quando o status é 'FA'
		                    }		                
			                
			                cell2.appendChild(link);
			                
			                row.appendChild(cell1);
			                row.appendChild(cell2);
			                
			                tableBody.appendChild(row);
			            }
					}
				});
			}
		</script>
		
		<!-- Java Script(Desvincular) -->
		<script type="text/javascript">
			function desvincular(){
				var cpfPet = document.getElementById('data-id-cpf').textContent;
				var cpfTutor = document.getElementById('vw_cpf_tutor').value;
				$.ajax({
				    method: "get",
				    url: urlAction,
				    data: "acao=desvincular&cpf_pet=" + cpfPet + "&cpf_tutor=" +cpfTutor ,
				    success: function (response) {
				    	$('#modelPetD').modal('hide');
				    	alert("Pet Desvinculado com sucesso!");
				    	petTutor(cpfTutor);
				    }
				});
			}
		</script>
		
		<!-- Java Script(Vincular) -->
		<script type="text/javascript">
			function vincular(){
				var cpfPet = document.getElementById('vinc_pet').value;
				var cpfTutor = document.getElementById('vinc_tutor').value;
				$.ajax({
				    method: "get",
				    url: urlAction,
				    data: "acao=vincularpet&cpf_pet=" + cpfPet + "&cpf_tutor=" +cpfTutor ,
				    success: function (response) {
				    	var json = JSON.parse(response);
				    	if(json == 'vinculado'){
				    		alert("Pet Vinculado ao Tutor");
				    		$('#modelPetV').modal('hide');
				    	} else if (json == 'pet-vinculado'){
				    		alert("Pet já vinculado a um Tutor");
				    	} else {
				    		alert("Pet já vinculado ao Tutor");
				    		$('#modelPetV').modal('hide');
				    	}				    	
				    }
				});
			}
		</script>
		
		<!-- Java Script(Lista de Pets e Turores para Vinculos) -->
		<script type="text/javascript">
			function listarPetTutor(){
				$.ajax({
				    method: "get",
				    url: urlAction,
				    data: "acao=listarpettutor",
				    success: function (response) {
				    	var json = JSON.parse(response);
				    	
				    	// Limpando as Informações
				    	$('#vinc_tutor').empty();
			            $('#vinc_pet').empty();
			            
			         	// Adicionando a opção padrão "SELECIONE" aos selects
			            $('#vinc_tutor').append($('<option>', {
			                value: '-1',
			                text: 'SELECIONE'
			            }));
			            $('#vinc_pet').append($('<option>', {
			                value: '-1',
			                text: 'SELECIONE'
			            }));
			            
			            //pet
			            for (var i = 0; i < json.pet.length; i++) {
			                var pet = json.pet[i];
			                if(pet.status.id != 'BO' && pet.status.id != 'CA' && pet.status.id != 'FA'){
			                	var optionPet = $('<option>', {
				                    value: pet.cpf_pet,
				                    text: pet.nome
				                });
			                }
			                

			                $('#vinc_pet').append(optionPet);
			            }
			            
			          	//tutor
			            for (var i = 0; i < json.tutor.length; i++) {
			                var tutor = json.tutor[i];			                
			                if(tutor.status.id != 'BO' && tutor.status.id != 'CA'){
			                	var optionTutor = $('<option>', {
				                	value: tutor.cpf,
				                    text: tutor.nome			                    
				                });
			                }
			                $('#vinc_tutor').append(optionTutor);
			            }
				    }
				});
			}
		</script>
		
		<!-- Java Script(Pesquisar Tutor) -->
		<script type="text/javascript">
			function pesquisar(){
				 var mensagem;
				 if(document.getElementById('cpf_tutor').value != ''){
					 if(document.getElementById('cpf_tutor').value.length < 11){
						 mensagem += "Erro: \n";
						 mensagem += "CPF TUTOR informado com a quantidade de dígitos inferior a 11.\n";
						 mensagem += "Por favor, verifique o CPF digite novamente.";
						 alert(mensagem);
					 } else {
						 window.location.href = contextPath + "/tutor?acao=filtro&opcao=1&valor=" +
		                    document.getElementById('cpf_tutor').value;
					 }
				 } else if(document.getElementById('nome_tutor').value != ''){
					 if(document.getElementById('nome_tutor').value.toLowerCase() == 'todos'){
						 window.location.href = contextPath + "/tutor?acao=listar";
					 } else {
						 window.location.href = contextPath + "/tutor?acao=filtro&opcao=5&valor=" +
		                    document.getElementById('nome_tutor').value;
					 }
				 } else if(document.getElementById('rg_tutor').value != ''){
					 window.location.href = contextPath + "/tutor?acao=filtro&opcao=2&valor=" +
	                    document.getElementById('rg_tutor').value;
				 } else if(document.getElementById('sexo_tutor').value != ''){
					 window.location.href = contextPath + "/tutor?acao=filtro&opcao=3&valor=" +
	                    document.getElementById('sexo_tutor').value;
				 } else if(document.getElementById('status_tutor').value != ''){
					 window.location.href = contextPath + "/tutor?acao=filtro&opcao=4&valor=" +
	                    document.getElementById('status_tutor').value;
				 } else if(document.getElementById('cep_tutor').value != ''){
					 window.location.href = contextPath + "/tutor?acao=filtro&opcao=9&valor=" +
	                    document.getElementById('cep_tutor').value;
				 }
			}			
		</script>
		
		<!-- Java Script(Salvar) -->
		<script type="text/javascript">
			function salvar(){
				if(tituloModal.textContent == "Cadastrar" || tituloModal.textContent == "Editar"){
					$.ajax({
		                method: "post",
		                url: urlAction,
		                data: $('#formTutor').serialize(),
		                success: function(response){
		                    var resposta = response.replace(/\\n/g, '\n').replace(/"/g, '');
		                    if(resposta == "vet"){
		                    	$('#modelVet').modal('show');
		                    } else if(resposta == "cadastrado"){
		                        window.location.reload();							
		                    } else {
		                        var resposta = response.replace(/\\n/g, '\n').replace(/"/g, '');
		                        alert(resposta);
		                    }
		                }
		            });
				} else {
					pesquisar();
				}
			}
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
			function views(tipo){
				var dadosTutor = [
					{id: 'cpf_tutor', propriedade: 'readOnly', pesquisa: true},
					{id: 'nome_tutor', propriedade: 'readOnly', pesquisa: true},
					{id: 'rg_tutor', propriedade: 'readOnly', pesquisa: true},
					{id: 'sexo_tutor', propriedade: 'disabled', pesquisa: false},
					{id: 'dt_nasc_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'email_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'contato_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'whats_tutor', propriedade: 'disabled', pesquisa: false},
					{id: 'cep_tutor', propriedade: 'readOnly', pesquisa: true},
					{id: 'num_end', propriedade: 'readOnly', pesquisa: false},
					{id: 'compl_end', propriedade: 'readOnly', pesquisa: false},
					{id: 'obs_tutor', propriedade: 'readOnly', pesquisa: false}
				];
				
				var divTutor = [
					'divCpfTutor', 'divNomeTutor', 'divRgTutor', 'divDtNascTutor', 'divEmailTutor',
					'divContatoTutor', 'divCepTutor', 'divLogEnd', 'divNumEnd', 'divComplEnd',
					'divBairroEnd', 'divCidadeEnd', 'divInstTutor', 'divYouTutor', 'divlinkTutor',
					'divFaceTutor', 'divSnapTutor', 'divTwitTutor', 'divTikTutor'
				];
				
				var midiasTutor = [
					{id: 'inst_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'you_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'link_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'face_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'snap_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'twit_tutor', propriedade: 'readOnly', pesquisa: false},
					{id: 'tik_tutor', propriedade: 'readOnly', pesquisa: false}
				];
				
				document.getElementById('status_tutor').style.display = tipo == 1 ? 'none' : 'block';
			    document.getElementById('lb_status_tutor').style.display = tipo == 1 ? 'none' : 'block';
			    
			    document.getElementById('logradouro_end').value = "";
			    document.getElementById('bairro_end').value = "";
			    document.getElementById('cidade_end').value = "";
			    
			    if(tipo == 1 || tipo == 2 ){
			    	document.getElementById('btnCep').style.display = 'block';
			    	btnCep.innerText = "Consultar";
			    } else {
				    document.getElementById('btnCep').style.display = 'none';			    	
			    }
			    
			    dadosTutor.forEach(function (info) {
			    	if (info.propriedade == 'readOnly') {
			    		if(tipo == 1 || tipo == 2 || tipo == 4){
				            document.getElementById(info.id).value = "";
				            document.getElementById(info.id).readOnly = false;	
				            if(tipo != 1 && tipo != 4){
				            	document.getElementById('cpf_tutor').readOnly = true;				            	
				            }
			        	} else if(tipo == 3){
			        		document.getElementById(info.id).readOnly = true;
			        		if(info.id == 'obs_tutor'){
			        			document.getElementById(info.id).readOnly = false;
			        		}
			        	} else {
			        		document.getElementById(info.id).readOnly = true;
			        	}
			    	} else {
			    		if(tipo == 1 || tipo == 2 || tipo == 4){
				            document.getElementById(info.id).value = "-1";
				            document.getElementById(info.id).readOnly = false;				            
			        	} else {
			        		document.getElementById(info.id).readOnly = true;
			        	}
			    	}
			    	
			    	if(tipo == 4){
			    		
			    		if(info.pesquisa){
			    			document.getElementById(info.id).readOnly = false;
			    		} else {
			    			document.getElementById(info.id).readOnly = true;
			    		}
			    	}
			    	
			    	
			    });
			    
			    midiasTutor.forEach(function (info) {
			    	if(tipo == 1 || tipo == 2){
			            document.getElementById(info.id).value = "";
			            document.getElementById(info.id).readOnly = false;				            
		        	} else {
		        		document.getElementById(info.id).readOnly = true;
		        	}			        
			    });
			    
			    divTutor.forEach(function (info) {
			    	if(tipo == 1 || tipo == 4){
			    		if(info == 'divDtNascTutor'){
			    			document.getElementById(info).classList.add("form-static-label");
			    		} else {
				    		document.getElementById(info).classList.remove("form-static-label");			    			
			    		}
			    	} else if(tipo == 2){
			    		switch (info) {
				    	    case 'divCpfTutor': case 'divLogEnd':
				    	    case 'divBairroEnd': case 'divCidadeEnd':
				    	        document.getElementById(info).classList.add("form-static-label");
				    	        break;
				    	    default:
				    	        document.getElementById(info).classList.remove("form-static-label");
				    	}
			    	} else if(tipo == 3 || tipo == 5){
			    		document.getElementById(info).classList.add("form-static-label");
			    	}  
			    });
				
			}
		</script>
		
		<!-- Java Script(Migrar Vet p/ Tutor) -->
		<script type="text/javascript">
			function migrar(){
				window.location.href = contextPath + "/tutor?acao=migrar&cpf=" +
                document.getElementById('cpf_tutor').value;
			}
		</script>
		
		<!-- Java Script(Editar Tutor) -->
		<script type="text/javascript">
			function editarTutor(cpfTutor){
				$.ajax({
					method: "get",
		            url: urlAction,
		            data: "acao=consultar&cpf_tutor=" + cpfTutor,
		            success: function (response) {
		            	var json = JSON.parse(response);
		            	var data = new Date(json.dt_nasc);
		            	var dtNasc = data.getFullYear() + "-" + String(data.getDate()).padStart(2, '0') + "-" +
		            		String(data.getMonth() + 1).padStart(2, '0');
		            	
		            	document.getElementById('cpf_tutor').value = json.cpf;
		            	document.getElementById('nome_tutor').value = json.nome;
		            	document.getElementById('rg_tutor').value = json.rg;
		            	document.getElementById('sexo_tutor').value = json.sexo;
		            	document.getElementById('dt_nasc_tutor').value = dtNasc;
		            	document.getElementById('email_tutor').value = json.contato.email;
		            	document.getElementById('contato_tutor').value = json.contato.telefone;
		            	document.getElementById('whats_tutor').value = 
		            		json.contato.whatsapp == '' ? "-1" : json.contato.whatsapp == 'S' ? 'S' : 'N';
		            	document.getElementById('obs_tutor').value = json.observacao;
		            	document.getElementById('status_tutor').value = json.status.id;
		            	
		            	document.getElementById('num_end').value = json.num_end;
		            	document.getElementById('compl_end').value = json.compl_end;
		            	
		            	if(json.cep.cep != null){
		            		btnCep.innerText = "Limpar";
			            	document.getElementById('cep_tutor').value = json.cep.cep;
			            	document.getElementById('logradouro_end').value = json.cep.logradouro;			            	
			            	document.getElementById('bairro_end').value = json.cep.bairro.bairro;
			            	if(json.cep.bairro.cidade.estado.uf == null){
			            		document.getElementById('cidade_end').value = '';
			            	} else {
			            		document.getElementById('cidade_end').value = 
				            		json.cep.bairro.cidade.cidade + "/" + json.cep.bairro.cidade.estado.uf;
			            	}
		            	} else {
		            		btnCep.innerText = "Consultar"
	    					document.getElementById("cep_tutor").value = '';
	    		        	document.getElementById("logradouro_end").value = '';
	    		        	document.getElementById("divLogEnd").classList.remove("form-static-label");
	    		        	document.getElementById("bairro_end").value = '';
	    		        	document.getElementById("divBairroEnd").classList.remove("form-static-label");
	    		        	document.getElementById("cidade_end").value = '';
	    		        	document.getElementById("divCidadeEnd").classList.remove("form-static-label");
		            	}
		            			            	
		            	document.getElementById('inst_tutor').value = json.redeSocial.instagram;
		            	document.getElementById('you_tutor').value = json.redeSocial.youtube;
		            	document.getElementById('link_tutor').value = json.redeSocial.linkedin;
		            	document.getElementById('face_tutor').value = json.redeSocial.facebook;
		            	document.getElementById('snap_tutor').value = json.redeSocial.snapchat;
		            	document.getElementById('twit_tutor').value = json.redeSocial.twitter;
		            	document.getElementById('tik_tutor').value = json.redeSocial.tiktok;
		            }
				});
			}
		</script>
		
		<!-- Java Script(Pesquisar CEP) -->
		<script type="text/javascript">
			function pesquisarCep() {
				if(btnCep.innerText == "Limpar"){
					btnCep.innerText = "Consultar"
					document.getElementById("cep_tutor").value = '';
		        	document.getElementById("logradouro_end").value = '';
		        	document.getElementById("divLogEnd").classList.remove("form-static-label");
		        	document.getElementById("bairro_end").value = '';
		        	document.getElementById("divBairroEnd").classList.remove("form-static-label");
		        	document.getElementById("cidade_end").value = '';
		        	document.getElementById("divCidadeEnd").classList.remove("form-static-label");
				} else {
					$.ajax({
					    method: "get",
					    url: urlAction,
					    data: "acao=consultarcep&cep=" + document.getElementById("cep_tutor").value,
					    success: function (response){
					        var json = JSON.parse(response);
					        btnCep.innerText = "Limpar"
					        
					        if(json.cep != null){
					        	document.getElementById("cep_tutor").value = json.cep;
					        	document.getElementById("logradouro_end").value = json.logradouro;
					        	document.getElementById("divLogEnd").classList.add("form-static-label");
					        	document.getElementById("bairro_end").value = json.bairro.bairro;
					        	document.getElementById("divBairroEnd").classList.add("form-static-label");
					        	document.getElementById("cidade_end").value =
					        		json.bairro.cidade.cidade + "/" + json.bairro.cidade.estado.uf;
					        	document.getElementById("divCidadeEnd").classList.add("form-static-label");
					        }
					    }
					});
				}
			}
		</script>
		
		<!-- Java Script() -->
		<script type="text/javascript">
			
		</script>
	
	
	</body>

</html>
