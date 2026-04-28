package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
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

@WebFilter(urlPatterns = {"/principal/*"})
public class FilterAutenticacao implements Filter {
	
	private static Connection connection;
       

    public FilterAutenticacao() {}

    /* Encerra os processo quando o servidor é parado*/
	public void destroy() {
		
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	/*Intercepta as requisições do sistema*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			HttpServletRequest hRequest = (HttpServletRequest) request;
			HttpSession session = hRequest.getSession();
			
			String logado = (String) session.getAttribute("usuario");
			String urlAutenticar = hRequest.getServletPath();
			
			if(logado == null && !urlAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				
				RequestDispatcher rediricionar = request.getRequestDispatcher("/index.jsp?url=" + urlAutenticar);
				request.setAttribute("msg", "Para acesso ao sistema informe o Login/Senha!");
				rediricionar.forward(request, response);
				return;
				
			} else {
				chain.doFilter(request, response);
			}
			
			connection.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rediricionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			rediricionar.forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e.printStackTrace();
				rediricionar = request.getRequestDispatcher("erro.jsp");
				request.setAttribute("msg", e1.getMessage());
				rediricionar.forward(request, response);
			}
		}
		
	}

	/*Inicia os processos quando o servidor é iniciado*/
	public void init(FilterConfig fConfig) throws ServletException {
		
		connection = SingleConnection.getConnection();
		
	}

}
