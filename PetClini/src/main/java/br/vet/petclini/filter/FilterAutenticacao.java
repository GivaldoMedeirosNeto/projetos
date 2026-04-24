package br.vet.petclini.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.servlets.ServletGenericUtil;

/** Filtro para autenticação de Usuários.
 * <br>
 * Este filtro é responsável por verificar se o usuário está autenticado antes de permitir o acesso a determinadas páginas.
 * Caso o usuário não esteja autenticado, ele é redirecionado para a página de login.
 * 
 * @version 1.0
 * @since Criação: 04/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebFilter(urlPatterns = {"/index.jsp", "/cadastros/*"})
public class FilterAutenticacao extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	private static Connection connection;

	/* Constructors */
    public FilterAutenticacao() { }

    /** Encerramento do processo quando o servidor é parado.
     */
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/** Intercepta as requisições/respostas no sistema.
	 * Verifica se o usuário está autenticado antes de permitir o acesso a determinadas páginas.
	 * Caso o usuário não esteja autenticado e tente acessar uma página protegida, ele é redirecionado para a página de login.
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		try {
			HttpServletRequest requestServlet = (HttpServletRequest) request;
			HttpSession session = requestServlet.getSession();
			
			String usuarioLogado = (String) session.getAttribute("usuario");
			String urlAutenticar = requestServlet.getServletPath();
			
			if(usuarioLogado == null && !urlAutenticar.contains("login")) {
				new ServletGenericUtil().redirecionar(request, response, "Relizar o Login para acesso ao Sistema", "/acesso/login.jsp?url="+urlAutenticar);
				return;
			} else {
				chain.doFilter(request, response);			
			}
			
			connection.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), "error.jsp");
			try {
				connection.rollback();
			} catch (SQLException se) {
				se.printStackTrace();
				new ServletGenericUtil().redirecionar(request, response, se.getMessage(), "error.jsp");
			}
		}
		
	}
	
	/** Inicializa o filtro e obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}
}
