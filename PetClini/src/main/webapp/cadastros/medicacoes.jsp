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
												<div class="card-header"><h5>Medicação</h5></div>												
											</div>																						
										</div>
										<!-- Row end -->														
									</div>
									
									<!-- Tab variant tab card Botões start -->
									<div class="row">
										<div class="col-lg-12 col-xl-12">
											<div class="card-header">
												<div class="row">
													<div class="col-md-2">
														<c:if test="${ADD_MEDICAMENTO}">
															<button class="btn btn-primary btn-round waves-effect waves-light"
																data-toggle="modal" data-target="#novoMedicacao" type="button"
																id="btnNovo" >Novo
															</button>														
														</c:if>
														<button style="background: none; border: none;"></button>
														<button class="btn btn-info btn-round waves-effect waves-light"
															type="button" data-toggle="modal" data-target="#novoMedicacao"
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
												<h5>${qtd} ${qtd > 1 ? 'Medicações Cadastradas' : 'Medicação Cadastrada'}</h5>
											</div>
											
											<div style="height: 500px; overflow: scroll;">
												<table class="table" id="listaCor">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">MEDICAÇÃO</th>
															<th scope="col">STATUS</th>
															<th scope="col"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listMedicacao}" var='lista'>
															<tr>
																<c:set var="rowStyle" value="color: ${lista.status.cor}" />
																<td style="${rowStyle}">
																	<c:out value="${lista.id}"></c:out>
																</td>
																
																<td style="${rowStyle}">
																	<c:out value="${lista.medicacao}"></c:out>
																</td>
																
																<td style="${rowStyle}">
																	<c:out value="${lista.status.id}"></c:out>
																</td>
																
																<td>
																	<c:if test="${UPD_MEDICAMENTO}">
																		<a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																			data-target="#novoMedicacao" data-id="${lista.id}, ${lista.medicacao}, ${lista.status.id}">Editar</a>
																	</c:if>																	
																</td>																														
															</tr>
														</c:forEach>
													</tbody>													
												</table>												
											</div>
										</div>																					
									</div>	
									<!-- Tab variant tab card Lista end -->
									
									<!-- Basic Form Inputs card end -->
										
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
	
	<!-- Modal -->
	<div class="modal fade" id="novoMedicacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="titulo">Título</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
				
				<div class="modal-body">
					<form action="<%= request.getContextPath() %>/medicacao" id="formMedicacao" class="form-material" method="post">
						<div class="form-group form-default">
							<input type="number" name="id_medicacao" id="id_medicacao" class="form-control"
								value="0" required="required">
							<span class="form-bar"></span>
							<label id="lbl_id" class="float-label">ID</label>
						</div>
						<div id="divDescricao" class="form-group form-default">
							<input type="text" name="medicacao" id="medicacao" class="form-control"
								value="" required="required">
							<span class="form-bar"></span>
							<label class="float-label">MEDICAÇÃO</label>
						</div>						
						<div class="form-group form-default form-static-label">
							<select class="form-control form-select" name="status_medicacao"
								aria-label="Default select example" id="status_medicacao">
								<c:forEach items="${listStatus}" var="status">
									<option value="${status.id}">${status.status}</option>											
								</c:forEach>
							</select>
							<span class="form-bar"></span>
							<label id="lb_status_medicacao" class="float-label">STATUS</label>
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
	
	<!-- Java Script(Variaveis/Métodos Globais)-->
	<script type="text/javascript">		
		var contextPath = "<%= request.getContextPath() %>";
		var urlAction = document.getElementById('formMedicacao').action;
		var tituloModal = document.getElementById('titulo');
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
	
	<!-- Java Script(Eventos Clicks)-->
	<script type="text/javascript">	
		document.addEventListener("DOMContentLoaded", function () {		
			
			var btnNovo = document.getElementById("btnNovo");
			btnNovo.addEventListener("click", function () {
				tituloModal.textContent = "Cadastrar";
				limparForm('formMedicacao');
				document.getElementById("id_medicacao").style.display = "none";
				document.getElementById("id_medicacao").value = 0;
				document.getElementById("lbl_id").style.display = "none";
				document.getElementById("status_medicacao").style.display = "none";
				document.getElementById("lb_status_medicacao").style.display = "none";
			});
			
			var btnPesquisar = document.getElementById("btnPesquisar");
			btnPesquisar.addEventListener("click", function () {
				tituloModal.textContent = "Pesquisar";
				limparForm('formMedicacao');
				document.getElementById("id_medicacao").style.display = "none";
				document.getElementById("lbl_id").style.display = "none";
				document.getElementById("status_medicacao").style.display = "block";
				document.getElementById("lb_status_medicacao").style.display = "block";
			});
			
			var btnEditarList = document.querySelectorAll(".btnEditar");
			btnEditarList.forEach(function(btnEditar) {
				btnEditar.addEventListener("click", function () {
					
					var dataId = this.getAttribute("data-id");
					var values = dataId.split(",");
					var idMedicacao = values[0].trim();
					var nMedicacao = values[1].trim();
					var stMedicacao = values[2].trim();
					
					tituloModal.textContent = "Editar";
					document.getElementById("id_medicacao").style.display = "none";
					document.getElementById("lbl_id").style.display = "none";
					document.getElementById("id_medicacao").value = this.getAttribute("data-id");
					document.getElementById("status_medicacao").style.display = "block";
					document.getElementById("lb_status_medicacao").style.display = "block";
					editarMedicacao(idMedicacao, nMedicacao, stMedicacao);
				});
			});
			
		});
	</script>
	
	<!-- Java Script (Salvar)-->
	<script type="text/javascript">		
		function salvar(){
			if(tituloModal.textContent == "Cadastrar" || tituloModal.textContent == "Editar"){
				if(document.getElementById("medicacao").value != ''){
					$.ajax({
						method: "post",
						url: urlAction,
						data: $('#formMedicacao').serialize(),
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
				} else {
					alert(
						"Há Campos Obrigatórios a ser preenchidos:\n" + 
						"Medicação."
					);
				}
			} else {
				if(document.getElementById("medicacao").value != '' || document.getElementById("status_medicacao").value != ''){
					if(document.getElementById("medicacao").value.toLowerCase() == 'todos'){
						window.location.href = contextPath + "/medicacao?acao=listar";
					} else if(document.getElementById("medicacao").value != ''){
						window.location.href = contextPath + "/medicacao?acao=filtro&opcao=1&valor=" +
						document.getElementById('medicacao').value;
					} else {
						window.location.href = contextPath + "/medicacao?acao=filtro&opcao=2&valor=" +
						document.getElementById('status_medicacao').value;
					}
				} else {
					alert(
						"Os Campos de pesquisa precisa ser preenchido:\n" + 
						"Medicação.\nStatus."
					);
				}
			}
		}
	</script>
	
	<!-- Java Script (Editar)-->
	<script type="text/javascript">		
		function editarMedicacao(id, medicacao, status) {
			document.getElementById("id_medicacao").value = id;
			document.getElementById("medicacao").value = medicacao;
			document.getElementById("status_medicacao").value = status;
		}
	</script>
	
	<!-- Java Script ()-->
	<script type="text/javascript">		
				
	</script>
    
</body>

</html>