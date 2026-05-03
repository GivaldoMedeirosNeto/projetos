<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

	<!-- Head -->
	<jsp:include page="/fixo/head.jsp"></jsp:include>
	
	<body>
		<!-- Themer -->
		<jsp:include page="/fixo/themer.jsp"></jsp:include>
		
		<div id="pcoded" class="pcoded">
			
			<div class="pcoded-overlay-box"></div>
			<div class="pcoded-container navbar-wrapper">
				<!-- Barra Superior -->  
				<jsp:include page="/fixo/barra-superior.jsp"></jsp:include>   
				
				<div class="pcoded-main-container">
				
					<div class="pcoded-wrapper">
						<!-- Menu Lateral -->
						<jsp:include page="/fixo/menu-lateral.jsp"></jsp:include>
						
						<div class="pcoded-content">
							<!-- Menu Superior -->
							<!-- <jsp:include page="/fixo/menu-superior.jsp"></jsp:include> -->
							
							<div class="pcoded-inner-content">
								<!-- Menu Principal -->
								<div class="main-body">
									<!-- Body -->
									<div class="page-wrapper">
									
										<%
										    String pagina = request.getParameter("page");
										    if (pagina == null) {
										        pagina = "/menu/home.jsp"; // página padrão
										    }
										%>
										
										<jsp:include page="<%= pagina %>" />
									
									</div>
									
									<div id="styleSelector"> </div>
									
								</div>
							
							</div>
							
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
		<!-- JavaScript -->
		<jsp:include page="/fixo/javascript.jsp"></jsp:include>
		
	</body>

</html>
