<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

	<jsp:include page="/principal/head.jsp"></jsp:include>

	<body>
		<div id="pcoded" class="pcoded">
			<div class="pcoded-overlay-box"></div>
			<div class="pcoded-container navbar-wrapper">
				
				<nav class="navbar header-navbar pcoded-header">
					<div class="navbar-wrapper">
						<div class="navbar-logo">
							<div class="mobile-search waves-effect waves-light">
								<div class="header-search">
									<div class="main-search morphsearch-search">
										<div class="input-group"></div>
									</div>
								</div>
							</div>
							<div>
							
							</div>
							<a href="<%= request.getContextPath() %>/index.jsp">
								<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo03-01.png" alt="Theme-Logo" />
							</a>
							<a class="mobile-options waves-effect waves-light">
								<i class="ti-more"></i>
							</a>
						</div>
						<div class="navbar-container container-fluid">
							<ul class="nav-right">
								<li>
									<div class="sidebar_toggle">
										<a href="javascript:void(0)"><i class="ti-menu"></i></a>
									</div>
								</li>
								<li>
									<a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
										<i class="ti-fullscreen"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				
				<div class="pcoded-main-container-login">
					
					<div class="left-container">
						<div class="pcoded-wrapper">		
							<form class="md-float-material form-material"
								action ="<%=request.getContextPath() %>/login" method="post">
								<input type="hidden" value="<%= request.getParameter("url")%>" name="url">
								<div class="form-group form-primary">
		                            <input type="text" name="login" class="form-control" required="">
		                            <span class="form-bar"></span>
		                            <label class="float-label">Login</label>
		                        </div>
		                         <div class="form-group form-primary">
	                                <input type="password" name="password" class="form-control" required="">
	                                <span class="form-bar"></span>
	                                <label class="float-label">Password</label>
	                            </div>
	                            <div class="col-md-12">
	                            	<button type="submit" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
	                            		Acessar
	                            	</button>
	                           	</div>
	                           	<div class="col-md-12">
	                            	<h6>${msg}</h6>
	                           	</div>
	                       	</form>
						</div>					
					</div>
					
					<div class="right-container">
						<img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/logo02-02.gif" alt="Logo" />
					</div>
					
				</div>
				
			</div>			
		</div>
      
	    <!-- Required Jquery -->
			<jsp:include page="/principal/javascript.jsp"></jsp:include>
	</body>
</html>


