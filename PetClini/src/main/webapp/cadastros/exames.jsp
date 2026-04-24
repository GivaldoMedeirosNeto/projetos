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
												<div class="card-header"><h5>Exame</h5></div>												
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
														<c:if test="${ADD_EXAME}">
															<button class="btn btn-primary btn-round waves-effect waves-light"
																data-toggle="modal" data-target="#novoExame" type="button"
																id="btnNovo" >Novo
															</button>														
														</c:if>
														<button style="background: none; border: none;"></button>
														<button class="btn btn-info btn-round waves-effect waves-light"
															type="button" data-toggle="modal" data-target="#novoExame"
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
												<h5>${qtd} ${qtd > 1 ? 'Exames Cadastradas' : 'Exame Cadastrada'}</h5>
											</div>
											
											<div style="height: 500px; overflow: scroll;">
												<table class="table" id="listaCor">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">EXAME</th>
															<th scope="col">STATUS</th>
															<th scope="col"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listExame}" var='lista'>
															<tr>
																<c:set var="rowStyle" value="color: ${lista.status.cor}" />
																<td style="${rowStyle}">
																	<c:out value="${lista.id}"></c:out>
																</td>
																
																<td style="${rowStyle}">
																	<c:out value="${lista.exame}"></c:out>
																</td>
																
																<td style="${rowStyle}">
																	<c:out value="${lista.status.id}"></c:out>
																</td>
																
																<td>
																	<c:if test="${UPD_EXAME}">
																		<a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																			data-target="#novoExame" data-id="${lista.id}, ${lista.exame}, ${lista.status.id}">Editar</a>
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
	<div class="modal fade" id="novoExame" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="titulo">Título</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
				
				<div class="modal-body">
					<form action="<%= request.getContextPath() %>/exame" id="formExame" class="form-material" method="post">
						<div class="form-group form-default">
							<input type="number" name="id_exame" id="id_exame" class="form-control"
								value="0" required="required">
							<span class="form-bar"></span>
							<label id="lbl_id" class="float-label">ID</label>
						</div>
						<div id="divDescricao" class="form-group form-default">
							<input type="text" name="exame" id="exame" class="form-control"
								value="" required="required">
							<span class="form-bar"></span>
							<label class="float-label">EXAME</label>
						</div>						
						<div class="form-group form-default form-static-label">
							<select class="form-control form-select" name="status_exame"
								aria-label="Default select example" id="status_exame">
								<c:forEach items="${listStatus}" var="status">
									<option value="${status.id}">${status.status}</option>											
								</c:forEach>
							</select>
							<span class="form-bar"></span>
							<label id="lb_status_exame" class="float-label">STATUS</label>
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
		var urlAction = document.getElementById('formExame').action;
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
				limparForm('formExame');
				document.getElementById("id_exame").style.display = "none";
				document.getElementById("id_exame").value = 0;
				document.getElementById("lbl_id").style.display = "none";
				document.getElementById("status_exame").style.display = "none";
				document.getElementById("lb_status_exame").style.display = "none";
			});
			
			var btnPesquisar = document.getElementById("btnPesquisar");
			btnPesquisar.addEventListener("click", function () {
				tituloModal.textContent = "Pesquisar";
				limparForm('formExame');
				document.getElementById("id_exame").style.display = "none";
				document.getElementById("lbl_id").style.display = "none";
				document.getElementById("status_exame").style.display = "block";
				document.getElementById("lb_status_exame").style.display = "block";
			});
			
			var btnEditarList = document.querySelectorAll(".btnEditar");
			btnEditarList.forEach(function(btnEditar) {
				btnEditar.addEventListener("click", function () {
					
					var dataId = this.getAttribute("data-id");
					var values = dataId.split(",");
					var idExame = values[0].trim();
					var nExame = values[1].trim();
					var stExame = values[2].trim();
					
					tituloModal.textContent = "Editar";
					document.getElementById("id_exame").style.display = "none";
					document.getElementById("lbl_id").style.display = "none";
					document.getElementById("id_exame").value = this.getAttribute("data-id");
					document.getElementById("status_exame").style.display = "block";
					document.getElementById("lb_status_exame").style.display = "block";
					editarExame(idExame, nExame, stExame);
				});
			});
			
		});
	</script>
	
	<!-- Java Script (Salvar)-->
	<script type="text/javascript">		
		function salvar(){
			if(tituloModal.textContent == "Cadastrar" || tituloModal.textContent == "Editar"){
				if(document.getElementById("exame").value != ''){
					$.ajax({
						method: "post",
						url: urlAction,
						data: $('#formExame').serialize(),
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
						"Exame."
					);
				}
			} else {
				if(document.getElementById("exame").value != '' || document.getElementById("status_exame").value != ''){
					if(document.getElementById("exame").value.toLowerCase() == 'todos'){
						window.location.href = contextPath + "/exame?acao=listar";
					} else if(document.getElementById("exame").value != ''){
						window.location.href = contextPath + "/exame?acao=filtro&opcao=1&valor=" +
						document.getElementById('exame').value;
					} else {
						window.location.href = contextPath + "/exame?acao=filtro&opcao=2&valor=" +
						document.getElementById('status_exame').value;
					}
				} else {
					alert(
						"Os Campos de pesquisa precisa ser preenchido:\n" + 
						"Exame.\nStatus."
					);
				}
			}
		}
	</script>
	
	<!-- Java Script (Editar)-->
	<script type="text/javascript">		
		function editarExame(id, exame, status) {
			document.getElementById("id_exame").value = id;
			document.getElementById("exame").value = exame;
			document.getElementById("status_exame").value = status;
		}
	</script>
	
	<!-- Java Script ()-->
	<script type="text/javascript">		
				
	</script>
    
</body>

</html>