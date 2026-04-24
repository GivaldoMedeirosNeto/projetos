<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

	<!-- head start -->
	<jsp:include page="principal/head.jsp"></jsp:include>
	<!-- head end -->
	
	<body>
	
	<!-- Pre-loader start -->
	<jsp:include page="principal/theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
		
			<!-- navbar start -->
		  	<jsp:include page="principal/navbar.jsp"></jsp:include>
			<!-- navbar end -->
			
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
				
	                <!-- menunavbar start -->
				  	<jsp:include page="principal/menunavbar.jsp"></jsp:include>
					<!-- menunavbar end -->
					
                  <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                        <h3>Paginal Principal</h3>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                            <!-- Main-body end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Required Jquery -->
 	<jsp:include page="principal/javascript.jsp"></jsp:include>
	<!-- Required Jquery -->
    
</body>

</html>
