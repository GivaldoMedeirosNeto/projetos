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
												<div class="card-header"><h5>Dados do Veterinário</h5></div>
												<form action="<%= request.getContextPath() %>/veterinario" id="formVet" class="form-material" method="post">
													
													<!-- Nav tabs start -->
													<ul class="nav nav-tabs md-tabs tabs-left b-none" role="tablist">
														<li class="nav-item">
															<a class="nav-link active" data-toggle="tab" href="#perfil" role="tab">Perfil</a>
															<div class="slide"></div>
														</li>
														<li class="nav-item">
															<a class="nav-link" data-toggle="tab" href="#endereco" role="tab">Endereço</a>
															<div class="slide"></div>
														</li>
														<li class="nav-item">
															<a class="nav-link" data-toggle="tab" href="#contato" role="tab">Contatos</a>
															<div class="slide"></div>
														</li>
														<li class="nav-item">
															<a class="nav-link" data-toggle="tab" href="#redesocial" role="tab">Redes Sociais</a>
															<div class="slide"></div>
														</li>
														<li class="nav-item">
															<a class="nav-link" data-toggle="tab" href="#empresa" role="tab">Empresa</a>
															<div class="slide"></div>
														</li>
													</ul>
													<!-- Nav tabs end -->
													
													<!-- Tab panes start -->
													<div class="tab-content tabs-left-content card-block col-lg-12 col-xl-12">
														
														<!-- Perfil -->
														<div class="tab-pane active" id="perfil" role="tabpanel">																
															<div class="row"> <!-- Primeira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="cpf" id="cpf" class="form-control"
																			value="" required="required">
																		<span class="form-bar"></span>
																		<label class="float-label">CPF</label>
																	</div>
																</div>																	
																<div class="col-md-4">
																	<div class="form-group form-default">
																		<button type="button" class="btn btn-round waves-effect"
																			onclick="consultarCpf(document.getElementById('cpf').value)" data-disabled >Consultar</button>
																	</div>
																</div>															        	
															</div>
															
															<div class="row"> <!-- Segunda Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="crmv" id="crmv" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">CRMV</label>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group form-default">
																		<input type="text" name="nome" id="nome" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">NOME</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="rg" id="rg" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">RG</label>
																	</div>
																</div>
															</div>
															
															<div class="row"> <!-- Terceira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default form-static-label">
																		<select class="form-control form-select" name="sexo"
																			aria-label="Default select example" id="sexo">
																			<option value="M" >MASCULINO</option>
																			<option value="F" >FEMININO</option>
																		</select>
																		<span class="form-bar"></span>
																		<label class="float-label">SEXO</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="dt_nasc" id="dt_nasc" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">DATA DE NASCIMENTO</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="dt_cadastro" id="dt_cadastro" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">DATA DE CADASTRO</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="dt_alteracao" id="dt_alteracao" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">DATA DE ALTERAÇÃO</label>
																	</div>
																</div>
																<div class="col-md-1">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="status" id="status" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">STATUS</label>
																	</div>
																</div>
															</div>
															
															<div class="row"> <!-- Quarta Linha -->
																<div class="col-md-10">
																	<div class="form-group form-default">
																		<textarea class="form-control" name="observacao" id="observacao" readonly></textarea>
																		<span class="form-bar"></span>
																		<label class="float-label">OBSERVAÇÃO</label>
																	</div>
																</div>
															</div>
															
														</div>

														<!-- Endereço -->	
														<div class="tab-pane" id="endereco" role="tabpanel">															
															<div class="row"> <!-- Primeira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="cep" id="cep"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">CEP</label>
																	</div>
																</div>
																
																<div class="col-md-4">
																	<div class="form-group form-default">
																		<button type="button" class="btn btn-round waves-effect" id="btnPesquisar"
																			onclick="consultarCep(document.getElementById('cep').value);" disabled>Pesquisar</button>
																	</div>
																</div>
															</div>
															
															<div class="row"> <!-- Segunda Linha -->
																<div class="col-md-8">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="logradouro" id="logradouro"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">LOGRADOURO</label>
																	</div>
																</div>
																<div class="col-md-1">
																	<div class="form-group form-default">
																		<input type="text" name="num_end" id="num_end"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">Nº</label>
																	</div>
																</div>																																
															</div>
															
															<div class="row"> <!-- Terceira Linha -->
																<div class="col-md-5">
																	<div class="form-group form-default">
																		<input type="text" name="compl_end" id="compl_end"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">COMPLEMENTO</label>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="bairro" id="bairro"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">BAIRRO</label>
																	</div>
																</div>																																
															</div>
															
															<div class="row"> <!-- Quarta Linha -->
																<div class="col-md-3">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="cidade" id="cidade"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">CIDADE</label>
																	</div>
																</div>
																<div class="col-md-1">
																	<div class="form-group form-default form-static-label">
																		<input type="text" name="uf" id="uf"
																			class="form-control" readonly value="">
																		<span class="form-bar"></span>
																		<label class="float-label">UF</label>
																	</div>
																</div>																																
															</div>																
														</div>
														
														<!-- Contatos -->
														<div class="tab-pane" id="contato" role="tabpanel">
															<div class="row"> <!-- Primeira Linha -->
															</div>
															
															<div class="row"> <!-- Segunda Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="telefone" id="telefone" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">CONTATO</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default form-check form-check-inline">
																		<input type="checkbox" name="whats" id="whats" class="form-check-input"
																			disabled>																		
																		<label class="form-check-label" for="inlineCheckbox1">WHATS APP</label>
																	</div>
																</div>
															</div>
															
															<div class="row"> <!-- Terceira Linha -->
															</div>
															
															<div class="row"> <!-- Quarto Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="email" id="email" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">E-MAIL</label>
																	</div>
																</div>
															</div>
															
														</div>
														
														<!-- Redes Sociais -->
														<div class="tab-pane" id="redesocial" role="tabpanel">
															<div class="row"> <!-- Primeira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="instagram" id="instagram" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">INSTAGRAM</label>
																	</div>																	
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="youtube" id="youtube" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">YOUTUBE</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="tiktok" id="tiktok" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">TIKTOK</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="twitter" id="twitter" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">TWITTER</label>
																	</div>
																</div>
															</div>
															
															<div class="row"> <!-- Segunda Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="linkedin" id="linkedin" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">LINKEDIN</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="facebook" id="facebook" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">FACEBOOK</label>
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="snapchat" id="snapchat" class="form-control"
																			value="" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">SNAPCHAT</label>
																	</div>
																</div>														
															</div>
														</div>
														
														<!-- Empresa -->
														<div class="tab-pane" id="empresa" role="tabpanel">
															<div class="row"> <!-- Primeira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="mei" id="mei" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">MEI</label>
																	</div>
																</div>
															</div>
															<div class="row"> <!-- Segunda Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="ie" id="ie" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">INSCRIÇÃO ESTADUAL</label>
																	</div>
																</div>
															</div>
															<div class="row"> <!-- Tereceira Linha -->
																<div class="col-md-2">
																	<div class="form-group form-default">
																		<input type="text" name="im" id="im" class="form-control"
																			value="" required="required" readonly>
																		<span class="form-bar"></span>
																		<label class="float-label">INSCRIÇÃO MUNICIPAL</label>
																	</div>
																</div>
															</div>
														</div>
														
													</div>
													<!-- Tab panes end -->
												</form>
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
														<button class="btn btn-primary btn-round waves-effect waves-light"
															type="button" onclick="limparForm();"> Limpar
														</button>															
													</div>
													<div class="col-md-2">
														<button class="btn btn-success btn-round waves-effect waves-light"
															type="button" onclick="salvarEditar()"> Salvar
														</button>
													</div>
													<div class="col-md-2">
														<button class="btn btn-danger btn-round waves-effect waves-light"
															type="button" id="btnAtCa" onclick="alterStatus()">Cancelar
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Tab variant tab card Botões end -->
									<div class="card"></div>
									<!-- Tab variant tab card Lista start -->
									<div class="card">										
										<div class="card-header">
											<h5>${qtd} ${qtd > 1 ? 'Veterinários Cadastrados' : 'Veterinário Cadastrado'}</h5>
										</div>
										
										<div style="height: 300px; overflow: scroll;">											
											<table class="table" id="listaVet">												
												<thead>
													<tr>
														<th scope="col">CPF</th>
														<th scope="col">CRMV</th>
														<th scope="col">NOME</th>
														<th scope="col">STATUS</th>
														<th scope="col"></th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listVet}" var='lista'>
														<tr>
															<td <c:if test="${lista.status eq 'CA'}">style="color: red;"</c:if> >
																<c:out value="${lista.cpf}"></c:out>
															</td>
															<td <c:if test="${lista.status eq 'CA'}">style="color: red;"</c:if> >
																<c:out value="${lista.crmv}"></c:out>
															</td>
															<td <c:if test="${lista.status eq 'CA'}">style="color: red;"</c:if> >
																<c:out value="${lista.nome}"></c:out>
															</td>
															<td <c:if test="${lista.status eq 'CA'}">style="color: red;"</c:if> >
																<c:out value="${lista.status}"></c:out>
															</td>
															<td></td>
															<td>
																<a class="btn btn-round waves-effect" onclick="consultarCpf('${lista.cpf}')" >Editar</a>
																<a class="btn btn-round waves-effect" onclick="alterStatus('${lista.cpf}', '${lista.status}')">
																	<c:set var="btnTexto">
																		<c:if test="${lista.status eq 'CA'}">Ativar</c:if>
																		<c:if test="${lista.status eq 'AT'}">Cancelar</c:if>
																	</c:set>
																	${btnTexto}
																</a>
															</td>
														</tr>
													</c:forEach>																													
												</tbody>																										
											</table>											
										</div>	
											
									</div>	
									<!-- Tab variant tab card Lista end -->
										
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
	
	<script type="text/javascript">
		document.getElementById('cpf').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 11;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
	
		document.getElementById('crmv').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 10;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
	
		document.getElementById('cep').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 8;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
		
		document.getElementById('mei').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 14;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
		
		document.getElementById('ie').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 14;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
		
		document.getElementById('im').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 14;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
		
		function focarCpf(){
			var cpfFocus = document.getElementById("cpf");
			if(!cpfFocus.getAttribute("readonly")){
				cpfFocus.focus();
			}
		}
		
		function focarCrmv(){
			var crmvFocus = document.getElementById("crmv");
			if(!crmvFocus.getAttribute("readonly") && document.getElementById("crmv") != '' ){
				crmvFocus.focus();
			}
		}
		
		function focarCep(){
			var cepFocus = document.getElementById("cep");
			if(!cepFocus.getAttribute("readonly")){
				cepFocus.focus();
			}
		}
		
		function limparForm(){
			var elementosForm = document.getElementById("formVet").elements;
			var excecao = ["cpf"];
			
			for(i=0; i<elementosForm.length; i++){
				elementosForm[i].value = '';
			}
			
			for(i=0; i<elementosForm.length; i++){
				if(!elementosForm[i].hasAttribute("data-disabled")){
					if(excecao.includes(elementosForm[i].id)){
						elementosForm[i].readOnly = false;
					} else {
						elementosForm[i].readOnly = true;
					}
				}
			}
			document.querySelector('select[name="sexo"]').value = 'F';
			document.getElementById("btnPesquisar").disabled = true;
			document.getElementById("whats").disabled = true;
			focarCpf();
		}
		
		function consultarCpf(cpf) {
			limparForm();
			var urlAction = document.getElementById('formVet').action;
			if(document.getElementById("cpf").value == ''){
				document.getElementById("cpf").value = cpf;				
			}
			
			if(document.getElementById("cpf").value == ''){
				focarCpf();
			} else {
				$.ajax({
					method: "get",
					url: urlAction,
					data: "cpf=" + cpf + "&acao=consultarcpf",
					success: function (response){
						var json = JSON.parse(response);
						
						if(json.cpf != null){							
							document.getElementById('cpf').value = json.cpf;
							document.getElementById('crmv').value = json.crmv;
							document.getElementById('nome').value = json.nome;
							document.getElementById('rg').value = json.rg;
							document.getElementById('sexo').value = json.sexo;
							document.getElementById('dt_nasc').value = json.dt_nasc;
							document.getElementById('dt_cadastro').value = json.dt_cadastro;
							document.getElementById('dt_alteracao').value = json.dt_alteracao;
							document.getElementById('status').value = json.status;
							document.getElementById('observacao').value = json.observacao;
							document.getElementById('num_end').value = json.num_end;
							document.getElementById('compl_end').value = json.compl_end;
							document.getElementById('cep').value = json.cep.cep;
							consultarCep(json.cep.cep);
							document.getElementById('mei').value = json.mei;
							document.getElementById('ie').value = json.ie;
							document.getElementById('im').value = json.im;
							document.getElementById('telefone').value = json.contato;
							document.getElementById('whats').checked  = json.whats ? true : false;
							document.getElementById('email').value = json.email;							
							document.getElementById('instagram').value = json.redesocial.instagram;
							document.getElementById('youtube').value = json.redesocial.youtube;
							document.getElementById('tiktok').value = json.redesocial.tiktok;
							document.getElementById('twitter').value = json.redesocial.twitter;
							document.getElementById('linkedin').value = json.redesocial.linkedin;
							document.getElementById('facebook').value = json.redesocial.facebook;
							document.getElementById('snapchat').value = json.redesocial.snapchat;
						} else {
							alert("Veterinário de CPF: " + cpf + " não foi encontrado!\n\n" +
									"Verificar se o CPF foi digitado corretamente\n" +
									"ou efetue o Cadastro no sistema.");
						}
						habilitarPerfil();
						focarCrmv();
						mudarBotao(document.getElementById("status").value);
					}
				}).fail(function (xhr, status, errorThrows){
					alert("Erro ao consultar o CPF do veterinário: " + xhr.responseText)
				});
			}
		}
		
		function habilitarPerfil() {
			var elementos = document.getElementById("formVet").elements;
			var excecao = ["cpf", "dt_cadastro", "dt_alteracao", "status",
							"logradouro", "num_end", "compl_end","bairro", "cidade", "uf"];

			for(i = 0; i < elementos.length; i++){
				if(!elementos[i].hasAttribute("data-disabled")){
					if(excecao.includes(elementos[i].id)){
						elementos[i].readOnly = true;
					} else {
						elementos[i].readOnly = false;						
					}					
				}				
			}
			document.getElementById("whats").disabled = false;
			document.getElementById("btnPesquisar").disabled = false;
		}
		
		function mudarBotao(situacao){
			var btnBotao = document.getElementById("btnAtCa");
			
			if(situacao == 'AT' || situacao == ''){
				btnBotao.innerText = "Cancelar";
				btnBotao.classList.remove("btn-info");
				btnBotao.classList.add("btn-danger");
			} else if(situacao == 'CA'){
				btnBotao.innerText = "Ativar";
				btnBotao.classList.remove("btn-danger");
				btnBotao.classList.add("btn-info");
			}
		}
		
		function salvarEditar(){
			$.ajax({
				method: "post",
				url: '<%= request.getContextPath() %>/veterinario',
				data: $('#formVet').serialize(),
				success: function(response){
					var messageWithLineBreaks = response.replace(/\\n/g, '\n').replace(/"/g, '');
					alert(messageWithLineBreaks);
					window.location.reload();
				}
			}).fail(function (xhr, status, errorThrows){
				alert("Erro:<br> " + xhr.responseText);
			});
		}
		
		function alterStatus(getCpf, getStatus){
			var urlAction = document.getElementById('formVet').action;
			var msg;
			var acao;
			
			if(getCpf == null){
				getCpf = document.getElementById('cpf').value;
				getStatus = document.getElementById('status').value;
			}
			
			if(getCpf != '' && getStatus != ''){
				if(getStatus == 'AT'){
					msg = "Deseja Cancelar o veterinário de CPF: " + getCpf;
					acao = "cpf=" + getCpf + "&acao=cancelar";
				} else if(getStatus == 'CA'){
					msg = "Deseja Re-Ativar o veterinário de CPF: " + getCpf;
					acao = "cpf=" + getCpf + "&acao=ativar";
				}
				if(confirm(msg)){
					$.ajax({
						method: "get",
						url: urlAction,
						data: acao,
						success: function(response){
							alert(response.replace(/"/g, ''));
							limparForm();
							window.location.href = "<%=request.getContextPath() %>/veterinario?acao=listarvet";
						}
					}).fail(function (xhr, status, errorThrows){
						alert("Erro:<br> " + xhr.responseText);
					});
				}
			} else {
				alert("Não há veterinário selecionado!");
			}		
		}
		
		function consultarCep(cep) {
			var urlAction = document.getElementById('formVet').action;
			var btnPesquisar = document.getElementById('btnPesquisar');
						
			if(btnPesquisar.innerText == "Trocar"){
				document.getElementById("cep").value = '';
				document.getElementById("cep").readOnly = false;
				document.getElementById("logradouro").value = '';
				document.getElementById("num_end").value = '';
				document.getElementById("num_end").readOnly = true;
				document.getElementById("compl_end").value = '';
				document.getElementById("compl_end").readOnly = true;
				document.getElementById("bairro").value = '';
				document.getElementById("cidade").value = '';
				document.getElementById("uf").value = '';
				btnPesquisar.innerText = "Pesquisar";
			} else if (btnPesquisar.innerText == "Pesquisar"){
				if(document.getElementById("cep").value == ''){
					focarCep();
				} else {
					$.ajax({
						method: "get",
						url: urlAction,
						data: "cep=" + cep + "&acao=consultarcep",
						success: function (response){
							btnPesquisar.innerText = "Trocar";
							var json = JSON.parse(response);
							
							if(json.cep != null){							
															
								document.getElementById('cep').value = json.cep;
								document.getElementById('logradouro').value = json.logradouro;							
								document.getElementById('bairro').value = json.bairro.bairro;							
								document.getElementById('cidade').value = json.bairro.cidade.cidade;							
								document.getElementById('uf').value = json.bairro.cidade.estado.uf;
							}
							
							habilitarEndereco();
							
						}
					}).fail(function (xhr, status, errorThrows){
						alert("Erro ao consultar o CEP:" + xhr.responseText)
					});
				}
			}
		}
		
		function habilitarEndereco() {
			
			var elementos = document.getElementById("formVet").elements;
			var excecao = ["cpf", "dt_cadastro", "dt_alteracao", "status", "cep",
				"logradouro", "bairro", "cidade", "uf"];

			for(i = 0; i < elementos.length; i++){
				if(!elementos[i].hasAttribute("data-disabled")){
					if(excecao.includes(elementos[i].id)){
						elementos[i].readOnly = true;
					} else {
						elementos[i].readOnly = false;						
					}					
				}				
			}					
		}
		
	</script>
    
</body>

</html>
