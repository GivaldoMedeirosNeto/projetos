package br.vet.petclini.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import br.vet.petclini.dao.pet.ColoracaoDAO;
import br.vet.petclini.model.pet.Coloracao;

/** Servlet responsável pela manipulação das informações do objeto Coloração.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas Coloração,
 * consultar informações no banco de dados através do DAO correspondente (coloracaoDAO)
 * e retornar as respostas em formato solicitado. As URLs mapeadas para este servlet são: "/coloracao".
 * 
 * @version 1.0.0
 * @since Criação: 17/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/coloracao"})
public class ServletColoracao extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao = "listarcoloracao";
       
    public ServletColoracao() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		acao = request.getParameter("acao");
		try {
			if(acao != null && acao.equalsIgnoreCase("listar")) {
				List<Coloracao> listCor = new ColoracaoDAO().listar(0, null);
				request.setAttribute("listCor", listCor);
				new ServletGenericUtil().redirecionar(request, response, "", listCor.size(), "cadastros/coloracao.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("filtro")) {
				List<Coloracao> listCor = new ColoracaoDAO().listar(1, request.getParameter("coloracao"));
				request.setAttribute("listCor", listCor);
				new ServletGenericUtil().redirecionar(request, response, "", listCor.size(), "cadastros/coloracao.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("deletar")) {
				new ColoracaoDAO().deletar(Integer.parseInt(request.getParameter("idCor")));
				new ServletGenericUtil().redirecionar(request, response, "", 0, "cadastros/coloracao.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			if(request.getParameter("idCor").equalsIgnoreCase("0")) {
				new ColoracaoDAO().add_upd(1,
					new Coloracao(0, request.getParameter("coloracao")));
			} else {
				new ColoracaoDAO().add_upd(2,
					new Coloracao(Integer.parseInt(
						request.getParameter("idCor")), request.getParameter("coloracao")));
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}

}
