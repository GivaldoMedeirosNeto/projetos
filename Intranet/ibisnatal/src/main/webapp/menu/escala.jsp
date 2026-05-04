<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<h1>ESCALA DO MÊS: ${sessionScope.mes != null ? sessionScope.mes : "Não definido"}</h1>
<iframe 
    src="<%= request.getContextPath() %>/menu/ServletEscala" 
    width="100%" 
    height="600px">
</iframe>
