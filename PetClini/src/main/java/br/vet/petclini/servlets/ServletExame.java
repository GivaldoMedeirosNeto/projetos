package br.vet.petclini.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.vet.petclini.dao.atendimento.ExameDAO;
import br.vet.petclini.dao.generic.StatusDAO;
import br.vet.petclini.model.atendimento.Exame;
import br.vet.petclini.model.gerenic.Status;


/** Servlet responsável pela manipulação das informações do objeto Exame.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas Exame,
 * consultar informações no banco de dados através do DAO correspondente (exameDAO)
 * e retornar as respostas em formato solicitado. As URLs mapeadas para este servlet são: "/exame".
 * 
 * @version 1.0.0
 * @since Criação: 17/09/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/exame"})
public class ServletExame extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao = "listarexame";
	private ObjectMapper mapper = new ObjectMapper();
	private String json = "";
	
	private List<Status> listStatus = new ArrayList<Status>();
    private List<Exame> listExame = new ArrayList<Exame>();
	
    public ServletExame() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acao = request.getParameter("acao");
		try {
			listStatus = listarStatus();
			if(acao != null && acao.equalsIgnoreCase("listar")) {
				listExame = new ExameDAO().listar(0, null);	
			} else if (acao != null && acao.equalsIgnoreCase("filtro")) {
				listExame = new ExameDAO().listar(
					Integer.parseInt(request.getParameter("opcao")),
					request.getParameter("valor"));
			}
			request.setAttribute("listExame", listExame);
			request.setAttribute("listStatus", listStatus);
			new ServletGenericUtil().redirecionar(request, response, "", listExame.size(), "cadastros/exames.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getParameter("id_exame").equalsIgnoreCase("0")) {
				new ExameDAO().add_upd(1,
					new Exame(0, request.getParameter("exame"), new Status("AT"))
				);
				json = mapper.writeValueAsString("aprovado");
			} else {
				new ExameDAO().add_upd(2,
						new Exame(
							Integer.parseInt(request.getParameter("id_exame")),
							request.getParameter("exame"),
							new Status(request.getParameter("status_exame"))
						)
					);
				json = mapper.writeValueAsString("aprovado");
			}
			
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}
	
	/** Lista de Status
	 * <br>
	 * Método utiliza para retornar uma lista de Status.
	 * 
	 * @return lista de Status cadastrado na base conforme a opção:
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE sem o PE e CO<br>
	 * * 2: Pesquisa com cláusula WHERE sem o BO e FA<br>
	 * * 3: Pesquisa com cláusula WHERE somente o BO<br>
	 * 
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see StatusDAO#listar(int)
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private List<Status> listarStatus () throws SQLException{		
		return new StatusDAO().listar(3);
	}

}
