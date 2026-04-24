package br.vet.petclini.servlets;

import java.io.IOException;
import java.io.Serializable;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/** Servlet genérica responsável pela reutilização nas Servlets
 * <br>
 * Esta Servlet fornece métodos genéricos que podem ser reutilizados em outras servlets.
 * 
 * @version 1.0.0
 * @since Criação: 12/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class ServletGenericUtil implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** Redirecionar
	 * <br>
	 * Este método faz que a servelt seja redirecionada para a URL informada,
	 * contendo ou não uma mensagem e QTD.
	 * 
	 * @param request Objeto HttpServletRequest que representa a solicitação HTTP.
	 * @param response Objeto HttpServletResponse que representa a resposta HTTP.
	 * @param msg Mensagem a ser exibida na página redirecionada (pode ser nula caso a qtd for maior que 0).
	 * @param qtd Usada para exibição de contadores.
	 * @param url URL da página para redirecionamento.
	 * @throws ServletException se ocorrer um erro durante o redirecionamento da solicitação.
	 * @throws IOException se ocorrer um erro de E/S durante o redirecionamento da solicitação.
	 * 
	 * @version 1.0.0
	 * @since Criação: 12/08/23
	 * @since Última modificação:
	 * 
	 * @autor Givaldo Medeiros Neto
	 */
	public void redirecionar(HttpServletRequest request, HttpServletResponse response, String msg, int qtd, String url) throws ServletException, IOException{ 		
		if(qtd > 0) {
			request.setAttribute("qtd", qtd);
		} else {
			request.setAttribute("msg", msg);			
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	/** Redirecionar.
	 * <br>
	 * Este método faz que a servelt seja redirecionada para a URL informada,
	 * contendo ou não uma mensagem.
	 * 
	 * @param request Objeto ServletRequest que representa a solicitação HTTP.
	 * @param response Objeto ServletResponse que representa a resposta HTTP.
	 * @param msg A mensagem a ser exibida na página redirecionada.
	 * @param url A URL da página para redirecionamento.
	 * @throws ServletException se ocorrer um erro durante o redirecionamento da solicitação.
	 * @throws IOException se ocorrer um erro de E/S durante o redirecionamento da solicitação.
	 * 
	 * @version 1.0.0
	 * @since Criação: 12/08/23
	 * @since Última modificação:
	 * 
	 * @autor Givaldo Medeiros Neto
	 */
	public void redirecionar(ServletRequest request, ServletResponse response, String msg, String url)
			throws ServletException, IOException{ 
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(url).forward(request, response);
	}

	/** Usuário Logado.
	 * <br>
	 * Este método captura o usuário logado
	 * 
	 * @param request Objeto HttpServletRequest que representa a solicitação HTTP.
	 * @return string o Usuário logado.
	 * @throws ServletException se ocorrer um erro durante o redirecionamento da solicitação.
	 * @throws IOException se ocorrer um erro de E/S durante o redirecionamento da solicitação.
	 * 
	 * @version 1.0.0
	 * @since Criação: 12/08/23
	 * @since Última modificação:
	 * 
	 * @autor Givaldo Medeiros Neto
	 */
	public String userLogado(HttpServletRequest request) {
		HttpServletRequest requestServlet = request;
		HttpSession session = requestServlet.getSession();		
		String usuarioLogado = (String) session.getAttribute("usuario");
		return usuarioLogado;
	}
	
}
