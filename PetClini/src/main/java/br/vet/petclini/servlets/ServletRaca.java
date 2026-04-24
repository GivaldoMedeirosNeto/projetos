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

import br.vet.petclini.dao.pet.EspecieDAO;
import br.vet.petclini.dao.pet.RacaDAO;
import br.vet.petclini.model.pet.Especie;
import br.vet.petclini.model.pet.Raca;

/** Servlet responsável pela manipulação das informações Raças do Pet no Sistema.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas Raças,
 * consultar informações no banco de dados através do DAO correspondente (racaDAO)
 * e retornar as respostas conforme solicitações. As URLs mapeadas para este servlet são: "/raca".
 * 
 * @version 1.0.0
 * @since Criação: 17/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/raca"})
public class ServletRaca extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao = "listarraca";
	private ObjectMapper mapper = new ObjectMapper();
	private String json = "";
       
    public ServletRaca() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acao = request.getParameter("acao");
		List<Raca> listRaca = new ArrayList<Raca>();
		
		try {
			request.setAttribute("listEspecie", listarEspecie());
			
			if(acao != null && acao.equalsIgnoreCase("listar")) {
				listRaca = new RacaDAO().listar(0, 0, "");
				request.setAttribute("listRaca", listRaca);
				new ServletGenericUtil().redirecionar(request, response, "", listRaca.size(), "cadastros/raca.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("deletar")) {
				new RacaDAO().deletar(Integer.parseInt(request.getParameter("idRaca")));
				new ServletGenericUtil().redirecionar(request, response, "", 0, "cadastros/raca.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("filtro")) {
				if(request.getParameter("idespecie") != null) {
					listRaca = new RacaDAO().listar(1, Integer.parseInt(request.getParameter("idespecie")), "");					
				} else if(request.getParameter("raca") != null){
					listRaca = new RacaDAO().listar(2, 0, request.getParameter("raca"));	
				}
				request.setAttribute("listRaca", listRaca);
				new ServletGenericUtil().redirecionar(request, response, "", 0, "cadastros/raca.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		json = mapper.writeValueAsString("");		
		try {
			if(request.getParameter("descricaoEspecie") != null) {
				new EspecieDAO().adicionar(1, new Especie(0, request.getParameter("descricaoEspecie")));
				json = mapper.writeValueAsString(listarEspecie());
				response.getWriter().write(json);
			} else if(request.getParameter("idRaca").equalsIgnoreCase("0")) {
				new RacaDAO().add_upd(1, new Raca(0, request.getParameter("raca"),
					new Especie(Integer.parseInt(request.getParameter("especie")), "")));
			} else {
				new RacaDAO().add_upd(2,
					new Raca(Integer.parseInt(request.getParameter("idRaca")), request.getParameter("raca"),
						new Especie(Integer.parseInt(request.getParameter("especie")), "")));
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}
	
	/* Methods */
	private List<Especie> listarEspecie() throws SQLException{
		return new EspecieDAO().listar();
	}

}
