<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

	<jsp:include page="head.jsp"></jsp:include>
	
	<body>
		
		<!-- Pre-loader start -->
		<jsp:include page="themer-loader.jsp"></jsp:include>
		<!-- Pre-loader end -->
		
		<div id="pcoded" class="pcoded">
		
			<div class="pcoded-overlay-box"></div>
			
			<div class="pcoded-container navbar-wrapper">
			
				<jsp:include page="page-head.jsp"></jsp:include>
				
				<div class="pcoded-main-container">
				
					<div class="pcoded-wrapper">
				
						<jsp:include page="main-menu.jsp"></jsp:include>
				
						<div class="pcoded-content">
				
							<div class="pcoded-inner-content">
				
								<!-- Main-body start -->
								<div class="main-body">
								
									<div class="page-wrapper">
				
										<!-- Page-body start -->
										<h1>Principal Tela</h1>
										<!-- Page-body end -->
										
									</div>
									
									<div id="styleSelector"> </div>
								
								</div>
								<!-- Main-body End -->
							</div>
						
						</div>
				
					</div>
				
				</div>
				
			</div>
		
		</div>
		
		<jsp:include page="javascript.jsp"></jsp:include>
		
	</body>

</html>