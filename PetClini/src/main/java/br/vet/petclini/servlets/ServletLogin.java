package br.vet.petclini.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import br.vet.petclini.dao.acesso.LoginDAO;
import br.vet.petclini.model.acesso.Login;
import br.vet.petclini.model.acesso.View;

/** Servlet responsável pela autenticação e manipulação do login no Sistema.
 * <br>
 * Este servlet é responsável por receber as requisições de login, autenticar o usuário
 * e gerenciar as sessões do sistema. Ele também realiza o redirecionamento para as páginas
 * de login e exibição de mensagens de sucesso ou erro.
 * <br>
 * As URLs mapeadas para este servlet são: "/login".
 * 
 * @version 1.0.0
 * @since Criação: 12/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/login"})
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String url = "/index.jsp";
	private Login modelLogin = new Login();
	private LoginDAO dao = new LoginDAO();

    public ServletLogin() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			request.getSession().invalidate();
			new ServletGenericUtil().redirecionar(request, response, "", 0, "acesso/login.jsp");
		} else {
			doPost(request, response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			modelLogin = dao.autenticar(new Login(request.getParameter("login"), request.getParameter("password")));
			
			if(modelLogin.getLogin() != null) {
				
				request.getSession().setAttribute("usuario", modelLogin.getLogin());				
				request.getSession().setAttribute("perfil", modelLogin.getPerfil());
				
				List<View> lista = modelLogin.getListView();
				for (View view : lista) {
					request.getSession().setAttribute(view.getDescricao(), view.isView());
				}
				
				url = (request.getParameter("url") == null || request.getParameter("url").equalsIgnoreCase("null"))
						? url : request.getParameter("url");
				new ServletGenericUtil().redirecionar(request, response, "Acesso Liberado", 0, url);
			} else {
				new ServletGenericUtil().redirecionar(request, response, "Login/Senha Inválido", 0, "acesso/login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
		
	}
	
}
