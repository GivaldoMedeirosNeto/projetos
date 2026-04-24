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
												<div class="card-header"><h5>Coloração do PET</h5></div>												
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
														<c:if test="${ADD_COLORACAO}">
															<button class="btn btn-primary btn-round waves-effect waves-light"
																data-toggle="modal" data-target="#novaColoracao" type="button"
																id="btnNovo" >Novo
															</button>														
														</c:if>
														<button style="background: none; border: none;"></button>
														<button class="btn btn-info btn-round waves-effect waves-light"
															type="button" data-toggle="modal" data-target="#novaColoracao"
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
												<h5>${qtd} ${qtd > 1 ? 'Colorações Cadastradas' : 'Coloração Cadastrada'}</h5>
											</div>
											
											<div style="height: 500px; overflow: scroll;">
												<table class="table" id="listaCor">
													<thead>
														<tr>
															<th scope="col">ID</th>
															<th scope="col">COLORAÇÃO</th>
															<th scope="col"></th>
															<th scope="col"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listCor}" var='lista'>
															<tr>
																<td>
																	<c:out value="${lista.id}"></c:out>
																</td>
																<td>
																	<c:out value="${lista.coloracao}"></c:out>
																</td>
																<td>
																	<c:if test="${UPD_COLORACAO}">
																		<a class="btn btn-round waves-effect btnEditar" data-toggle="modal"
																			data-target="#novaColoracao" data-id="${lista.id}">Editar</a>
																	</c:if>
																	<c:if test="${STS_COLORACAO}">
																		<a class="btn btn-round waves-effect btnDel" data-toggle="modal"
																			data-target="#novaColoracao" data-id="${lista.id}">Excluir</a>
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
	<div class="modal fade" id="novaColoracao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="titulo">Título</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
				
				<div class="modal-body">
					<form action="<%= request.getContextPath() %>/coloracao" id="formCor" class="form-material" method="post">
						<div class="form-group form-default">
							<input type="number" name="idCor" id="idCor" class="form-control"
								value="0" required="required">
							<span class="form-bar"></span>
							<label id="lblId" class="float-label">ID</label>
						</div>
						<div id="divDescricao" class="form-group form-default">
							<input type="text" name="coloracao" id="coloracao" class="form-control"
								value="" required="required">
							<span class="form-bar"></span>
							<label class="float-label">COLORAÇÃO</label>
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
	
	<!-- Java Script -->
	<script type="text/javascript">
		document.getElementById('idCor').addEventListener('input', function (e) {
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
	                
	                document.getElementById("idCor").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            
		            document.getElementById("coloracao").readOnly = false;
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.remove("form-static-label");
		            
	                var tr = this.closest("tr");
	                var id = this.getAttribute("data-id");
	                var descricao = tr.querySelector("td:nth-child(2)").textContent.trim();
	                document.getElementById('coloracao').value = descricao;
	                document.getElementById("idCor").value = id;
	            });
	        });
	        
	        var btnDeltList = document.querySelectorAll(".btnDel");
	        btnDeltList.forEach(function (btnDel) {
	            btnDel.addEventListener("click", function () {
	                tituloModal.textContent = "Deletar";
	                
	                document.getElementById("idCor").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            
		            document.getElementById("coloracao").readOnly = true;
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.add("form-static-label");
		            
	                var tr = this.closest("tr");
	                var id = this.getAttribute("data-id");
	                var coloracao = tr.querySelector("td:nth-child(2)").textContent.trim();
	                document.getElementById('coloracao').value = coloracao;
	                document.getElementById("idCor").value = id;
	            });
	        });
	        if(${ADD_COLORACAO}){
		        btnNovo.addEventListener("click", function () {
		            tituloModal.textContent = "Cadastrar";
		            
		            document.getElementById("idCor").style.display = "none";
		            document.getElementById("lblId").style.display = "none";
		            
		            document.getElementById("coloracao").value = "";
		            
		            document.getElementById("coloracao").readOnly = false;
		            var divDescricao = document.getElementById("divDescricao");
		            divDescricao.classList.remove("form-static-label");
		        });	        	
	        }
	
	        btnPesquisar.addEventListener("click", function () {
	            tituloModal.textContent = "Pesquisar";
	            
	            document.getElementById("idCor").style.display = "none";
	            document.getElementById("lblId").style.display = "none";
	            
	            document.getElementById("idCor").value = "";
	            document.getElementById("coloracao").value = "";
	            
	            document.getElementById("coloracao").readOnly = false;
	            var divDescricao = document.getElementById("divDescricao");
	            divDescricao.classList.remove("form-static-label");
	        });	        
	       
	    });
		
		function salvar() {
			var urlAction = document.getElementById('formCor').action;
			var tituloModal = document.getElementById('titulo').textContent;
			
			if(tituloModal == "Cadastrar"){
				if (document.getElementById("coloracao").value == ""){
					alert("Informe a Coloração para continuar o Cadastro");
					return;
				}
			}
			
			$.ajax({
		  		method: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? "post" : "get",
		  		url: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? '<%= request.getContextPath() %>/coloracao' : urlAction,
		  		data: tituloModal != "Pesquisar" && tituloModal != "Deletar" ? $('#formCor').serialize() :
		  			tituloModal == "Deletar" ? "acao=deletar&idCor=" + document.getElementById("idCor").value 
		  					: "acao=filtro&coloracao=" + document.getElementById("coloracao").value,
		  		success: function (response){
		  			if(tituloModal == "Pesquisar"){
		  				if(document.getElementById("coloracao").value.toLowerCase() == "todos"){
		  					window.location.href = "<%=request.getContextPath() %>/coloracao?acao=listar";
		  				} else {
				  			window.location.href = "<%=request.getContextPath() %>/coloracao?acao=filtro&coloracao=" + document.getElementById("coloracao").value;		  					
		  				}
		  			} else {
		  				window.location.reload();
		  			}
		  		}	
			});			
		}
				
	</script>
    
</body>

</html>