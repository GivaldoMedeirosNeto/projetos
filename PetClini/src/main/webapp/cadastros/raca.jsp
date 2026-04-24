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
												<div class="card-header"><h5>Raça do PET</h5></div>												
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
														<c:if test="${ADD_RACA}">
															<button class="btn btn-primary btn-round waves-effect waves-light"
																data-toggle="modal" data-target="#novaRaca" type="button"
																id="btnNovo" >Novo
															</button>
														</c:if>
														<button style="background: none; border: none;"></button>																										
														<button class="btn btn-info btn-round waves-effect waves-light"
															type="button" data-toggle="modal" data-target="#novaRaca"
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
												<h5>${qtd} ${qtd > 1 ? 'Raças Cadastradas' : 'Raça Cadastrada'}</h5>
											</div>
											
											<div style="height: 500px; overflow: scroll;">
												<table class="table" id="listaCor">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">RAÇA</th>
															<th scope="col">ESPECIE</th>
															<th scope="col"></th>
															<th scope="col"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listRaca}" var='lista'>
															<tr>
																<td>
																	<c:out value="${lista.id}"></c:out>
																</td>
																<td>
																	<c:out value="${lista.raca}"></c:out>
																</td>
																<td data-especie-id="${lista.especie.id}">
																	<c:out value="${lista.especie.especie}"></c:out>
																</td>
																<td>
																	<c:if test="${UPD_RACA}">
																		<a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																			data-target="#novaRaca" data-id="${lista.id}">Editar</a>
																	</c:if>
																	<c:if test="${STS_RACA}">
																		<a class="btn btn-round waves-effect btnDel" data-toggle="modal"
																			data-target="#novaRaca" data-id="${lista.id}">Excluir</a>
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
	
	<!-- Modal Raça -->
	<div class="modal fade" id="novaRaca" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="titulo">Título</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form action="<%= request.getContextPath() %>/raca" id="formRaca" class="form-material" method="post">
						<div class="form-group form-default form-static-label">
							<select class="form-control form-select" name="especie"
								aria-label="Default select example" id="especie">
								<option value="" >Selecione a Espécie</option>
								<c:forEach items="${listEspecie}" var="especie">
									<option value="${especie.id}" >${especie.especie}</option>
								</c:forEach>
							</select>
							<span class="form-bar"></span>
							<label class="float-label">ESPECIE</label>
							
							<c:if test="${ADD_ESPECIE}">
								<button id="btnAdd" type="button" class="close" data-toggle="modal" data-target="#novaEspecie">
								  Nova Espécie
								</button>
							</c:if>
							
						</div>
						<div class="form-group form-default">
							<input type="number" name="idRaca" id="idRaca" class="form-control"
								value="0">
							<span class="form-bar"></span>
							<label id="lblId" class="float-label">ID</label>
						</div>
						<div id="divDescricao" class="form-group form-default">
							<input type="text" name="raca" id="raca" class="form-control"
								value="" required="required">
							<span class="form-bar"></span>
							<label class="float-label">RAÇA</label>
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

	<!-- Modal Especie -->
	<div class="modal fade" id="novaEspecie" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Espécie</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        <form action="<%= request.getContextPath() %>/raca" id="formEspecie" class="form-material" method="post">
				<div id="divDescricaoEspecie" class="form-group form-default">
					<input type="text" name="descricaoEspecie" id="descricaoEspecie" class="form-control"
						value="" required="required">
					<span class="form-bar"></span>
					<label class="float-label">ESPÉCIE</label>
				</div>
			</form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sair</button>
	        <button id="btnEspecie" type="button" class="btn btn-primary" onclick="addEspecie()">Salvar</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- Java Script -->
	<script type="text/javascript">
	
		var contextPath = "<%= request.getContextPath() %>";
	
		document.getElementById('idRaca').addEventListener('input', function (e) {
			this.value = this.value.replace(/\D/g, '');
			
			var maxLength = 3;
			if (this.value.length > maxLength) {
				this.value = this.value.slice(0, maxLength);
			}
		});
	
		document.addEventListener("DOMContentLoaded", function () {
	        var tituloModal = document.getElementById("titulo");

	        var btnNovo = document.getElementById("btnNovo");
	        var btnPesquisar = document.getElementById("btnPesquisar");
	        
	        var btnEditList = document.querySelectorAll(".btnEditar");
	        btnEditList.forEach(function (btnEditar) {
	            btnEditar.addEventListener("click", function () {
	                tituloModal.textContent = "Editar";
	                
	                document.getElementById("idRaca").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            document.getElementById("btnAdd").style.display = "none";
		            
		            
		            document.getElementById("raca").readOnly = false;
		            document.getElementById("especie").disabled = false
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.remove("form-static-label");
		            
	                var tr = this.closest("tr");
	                var id = this.getAttribute("data-id");
	                var raca = tr.querySelector("td:nth-child(2)").textContent.trim();
	                var especieId = tr.querySelector("td:nth-child(3)").getAttribute("data-especie-id");
	                
	                document.getElementById('raca').value = raca;
	                document.getElementById("idRaca").value = id;
	                document.getElementById('especie').value = especieId;
	            });
	        });
	        
	        var btnDeltList = document.querySelectorAll(".btnDel");
	        btnDeltList.forEach(function (btnDel) {
	            btnDel.addEventListener("click", function () {
	                tituloModal.textContent = "Deletar";
	                
	                document.getElementById("idRaca").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            document.getElementById("btnAdd").style.display = "none";
		            
		            document.getElementById("raca").readOnly = true;
		            document.getElementById("especie").disabled = true;
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.add("form-static-label");
		            
		            
	                var tr = this.closest("tr");
	                var id = this.getAttribute("data-id");
	                var raca = tr.querySelector("td:nth-child(2)").textContent.trim();
	                var especieId = tr.querySelector("td:nth-child(3)").getAttribute("data-especie-id");
	                
	                document.getElementById("idRaca").value = id;
	                document.getElementById('raca').value = raca;
	                document.getElementById('especie').value = especieId;
	            });
	        });
	        if (${ADD_RACA}){
		        btnNovo.addEventListener("click", function () {
		            tituloModal.textContent = "Cadastrar";
		            
		            document.getElementById("idRaca").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            document.getElementById("btnAdd").style.display = "block";
		            
		            document.getElementById("raca").readOnly = false;
		            document.getElementById("especie").disabled = false;
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.remove("form-static-label");
		            
		            document.getElementById("raca").value = "";
		            document.getElementById('especie').value = "";
		        });
	        }
	
	        btnPesquisar.addEventListener("click", function () {
	            tituloModal.textContent = "Pesquisar";
	            
	            document.getElementById("idRaca").style.display = "none";
	            document.getElementById("lblId").style.display = "none";
	            document.getElementById("btnAdd").style.display = "none";
	            
	            document.getElementById("raca").readOnly = false;
	            document.getElementById("especie").disabled = false;
	            var divDescricao = document.getElementById("divDescricao");
	            divDescricao.classList.remove("form-static-label");
	            
	            document.getElementById("idRaca").value = "";
	            document.getElementById("raca").value = "";
	            document.getElementById('especie').value = "";
	        });	
	        
	        btnAdd.addEventListener("click", function () {
				document.getElementById('descricaoEspecie').value = "";
	        });
	       
	    });
		
		
		
		function salvar() {
			var urlAction = document.getElementById('formRaca').action;
			var tituloModal = document.getElementById('titulo').textContent;
			
			
			if(tituloModal == "Cadastrar"){
				if(document.getElementById("especie").value == ""){
					alert("Selecione a Espécie para continuar o Cadastro");
					return;
				} else if (document.getElementById("raca").value == ""){
					alert("Informe a Raça para continuar o Cadastro");
					return;
				}
			}
			
			$.ajax({
				  method: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? "post" : "get",
				  url: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? contextPath + '/raca' : urlAction,
				  data: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? $('#formRaca').serialize() :
					  tituloModal == "Deletar" ? "acao=deletar&idRaca=" + document.getElementById("idRaca").value 
							  : "acao=listar",
				  success: function (response){
					  if(tituloModal == "Pesquisar"){
						  if(document.getElementById("raca").value.toLowerCase() == "todos"){
							  window.location.href = contextPath + "/raca?acao=listar";
						  } else if(document.getElementById("raca").value.toLowerCase() != "todos" &&
								  document.getElementById("raca").value.toLowerCase() != "") {
							  window.location.href = contextPath + "/raca?acao=filtro&raca=" + document.getElementById("raca").value;  					
						  } else if(document.getElementById("raca").value.toLowerCase() == "" &&
								  document.getElementById("especie").value != "") {
							  window.location.href = contextPath + "/raca?acao=filtro&idespecie=" + document.getElementById("especie").value;		  					
						  }
					  } else {
						  window.location.reload();
					  }
				  }	
			});
				
		}
		
		function addEspecie() {
			var urlAction = document.getElementById('formEspecie').action;
			
			if(document.getElementById("descricaoEspecie").value == ""){
				alert("Informe a Espécie para o cadastro!");
				return;
			}
			
			$.ajax({
				method: "post",
				url: contextPath + "/raca",
				data: $('#formEspecie').serialize(),
				success: function(response){
					var parsedResponse = JSON.parse(response);
					var options = '<option value="">Espécie</option>';
					
					parsedResponse.forEach(function(especie) {
						options += '<option value="' + especie.id + '">' + especie.especie + '</option>';
			        });
					
					$('#especie').html(options);
					$('#novaEspecie').modal('hide');
					
				}
			})
			
		}
				
	</script>
    
</body>

</html>
