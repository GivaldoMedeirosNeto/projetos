package filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnection;

@WebFilter(urlPatterns = {"/menu/*"})
public class FilterAutencicacao implements Filter {
       
	private static Connection connection;

    public FilterAutencicacao() { }


	public void destroy() {		
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpSession session = httpRequest.getSession();
			
			String logado = (String) session.getAttribute("sysUsuario");
			String urlAutenticar = httpRequest.getServletPath();
			
			if(logado == null && !urlAutenticar.equalsIgnoreCase("/menu/ServletLogin")) {
				request.setAttribute("msg", "Para acesso ao sistema informe o Login/Senha!");
				request.getRequestDispatcher("/index.jsp?url=" + urlAutenticar).forward(request, response);
				return;
			} else {
				chain.doFilter(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
			try {
				connection.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("msg", e1.getMessage());
				request.getRequestDispatcher("erro.jsp").forward(request, response);
			}
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}
