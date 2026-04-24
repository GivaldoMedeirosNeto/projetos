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
import com.fasterxml.jackson.databind.node.ObjectNode;

import br.vet.petclini.constants.CPF;
import br.vet.petclini.constants.DataHora;
import br.vet.petclini.dao.generic.StatusDAO;
import br.vet.petclini.dao.pessoa.PessoaDAO;
import br.vet.petclini.dao.pessoa.TutorDAO;
import br.vet.petclini.dao.pessoa.VeterinarioDAO;
import br.vet.petclini.dao.pet.PetDAO;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.gerenic.Status;
import br.vet.petclini.model.pessoa.Contato;
import br.vet.petclini.model.pessoa.RedeSocial;
import br.vet.petclini.model.pessoa.Tutor;
import br.vet.petclini.model.pet.Pet;

/** Servlet responsável pela manipulação de informações dos TUTOREs no Sistema.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas aos tutores,
 * consultar informações no banco de dados através do DAO correspondente (TutorDAO)
 * e retornar as respostas em formato JSON. As URLs mapeadas para este servlet são: "/tutor".
 * 
 * @version 1.0.0
 * @since Criação: 08/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/tutor"})
public class ServletTutorController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao;
	private ObjectMapper mapper = new ObjectMapper();
	private ObjectNode jsonNode = mapper.createObjectNode();
	private String json = "";
	private String msg;
	
	private List<Tutor> listTutor = new ArrayList<Tutor>();
	private Tutor modelTutor = new Tutor();
	private List<Pet> listPet = new ArrayList<Pet>();
	private List<Status> listStatus = new ArrayList<Status>();
	private Endereco modelEnd = new Endereco();
	
    public ServletTutorController() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acao = request.getParameter("acao");		
		
		try {
			listStatus = listarStatus();
			
			if(acao != null && acao.equalsIgnoreCase("listar")) {
				listTutor = new TutorDAO().listar(0, "");
				request.setAttribute("listTutor", listTutor);
				request.setAttribute("listStatus", listStatus);
				new ServletGenericUtil().redirecionar(request, response, "", listTutor.size(), "cadastros/tutores.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("consultar")) {
				modelTutor = new TutorDAO().consultarCpf(request.getParameter("cpf_tutor"));
				json = mapper.writeValueAsString(modelTutor);
			} else if(acao != null && acao.equalsIgnoreCase("consultarpets")) {
				listPet = new PetDAO().listar(5, request.getParameter("cpf_tutor"));
				json = mapper.writeValueAsString(listPet);
			} else if(acao != null && acao.equalsIgnoreCase("desvincular")) {
				new TutorDAO().desvincularPet(request.getParameter("cpf_pet"), request.getParameter("cpf_tutor"));
				json = mapper.writeValueAsString("desvinculado");
			} else if(acao != null && acao.equalsIgnoreCase("vincularpet")) {
				json = mapper.writeValueAsString(
					new TutorDAO().vincularPet(
						request.getParameter("cpf_pet"),
						request.getParameter("cpf_tutor"))
				);				
			} else if(acao != null && acao.equalsIgnoreCase("filtro")) {
				listTutor = new TutorDAO().listar(
					Integer.parseInt(request.getParameter("opcao")),
					request.getParameter("valor")
				);
				
				request.setAttribute("listTutor", listTutor);
				request.setAttribute("listStatus", listStatus);
				new ServletGenericUtil().redirecionar(request, response, "", listTutor.size(), "cadastros/tutores.jsp");
				
			} else if(acao != null && acao.equalsIgnoreCase("listarpettutor")) {
				jsonNode.putPOJO("pet", listarPets());
				jsonNode.putPOJO("tutor", new TutorDAO().listar(0, ""));
				json = mapper.writeValueAsString(jsonNode);
			} else if(acao != null && acao.equalsIgnoreCase("migrar")) {
				new TutorDAO().migrarTutor(request.getParameter("cpf"));
				listTutor = new TutorDAO().listar(0, "");
				request.setAttribute("listTutor", listTutor);
				request.setAttribute("listStatus", listStatus);
				new ServletGenericUtil().redirecionar(request, response, "", listTutor.size(), "cadastros/tutores.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("consultarcep")) {
				modelEnd = consultarEnd(request.getParameter("cep"));
				json = mapper.writeValueAsString(modelEnd);
			}
			
			response.getWriter().write(json);
			
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(!request.getParameter("cep_tutor").isEmpty()) {
				modelEnd = consultarEnd(request.getParameter("cep_tutor"));				
			} else {
				modelEnd = new Endereco();
			}
			
			modelTutor = new Tutor(
				request.getParameter("cpf_tutor"), request.getParameter("nome_tutor"), request.getParameter("rg_tutor"),
				new DataHora().formatacaoData(request.getParameter("dt_nasc_tutor")), request.getParameter("sexo_tutor"),
				modelEnd, request.getParameter("num_end"), request.getParameter("compl_end"),
				new DataHora().dataAtual(), new DataHora().dataAtual(), request.getParameter("obs_tutor"),
				new Status(request.getParameter("status_tutor")),
				new RedeSocial(
					request.getParameter("inst_tutor"), request.getParameter("you_tutor"), request.getParameter("tik_tutor"),
					request.getParameter("twit_tutor"), request.getParameter("link_tutor"), request.getParameter("face_tutor"),
					request.getParameter("snap_tutor")),
				new Contato(
					request.getParameter("cpf_tutor"), request.getParameter("email_tutor"),
					request.getParameter("contato_tutor"), request.getParameter("whats_tutor")),
				null/*imagem*/);
			 
			 if(!validarCampos(modelTutor).equalsIgnoreCase("aprovado")) {
				 msg = validarCampos(modelTutor);
				 json = mapper.writeValueAsString(msg);
			 } else {
				 if(request.getParameter("status_tutor").equalsIgnoreCase("-1")) {
					 Tutor tutor = new TutorDAO().consultarCpf(request.getParameter("cpf_tutor"));
					 if(tutor.getCpf() == null) {
						 if(new VeterinarioDAO().vetCpf(request.getParameter("cpf_tutor"))) {
							 json = mapper.writeValueAsString("vet");						 
						 } else {
							 new TutorDAO().add_upd(1, modelTutor);
							 json = mapper.writeValueAsString("cadastrado");
						 }
					 }
				 } else {
					 new TutorDAO().add_upd(2, modelTutor);
					 json = mapper.writeValueAsString("cadastrado");
				 }

				 
			 }
		} catch (Exception e) {
			e.printStackTrace();
	        new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
		
		response.getWriter().write(json);
	}
	
	/** Lista de Status
	 * <br>
	 * Método utiliza para retornar uma lista de Status.
	 * 
	 * @return lista de Status cadastrado na base conforme a opção:
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE sem o PE e CO<br>
	 * * 2: Pesquisa com cláusula WHERE sem o CO<br>
	 * * 3: Pesquisa com cláusula WHERE sem o BO e FA e AT<br>
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
		return new StatusDAO().listar(1);
	}

	/**Consulta CEP na base de dados, caso não esteja adicionando
	 * o sistema irá busca via webservice.
	 * 
	 * @param cep Recebe o CEP para pesquisa
	 * @return Endereco os dados fornecidos
	 * 
	 * @version 1.0
	 * @since Criação: 08/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private Endereco consultarEnd(String cep) {
		cep = cep.replace(".", "").replace("-", "");
		return new Endereco().buscar(cep);
	}
	
	/** Lista de Pets
	 * <br>
	 * Método utiliza para retornar uma lista de Pets para vinculo.
	 * 
	 * @return lista de Status cadastrado na base conforme a opção:
	 * 
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see petDAO#listar(int)
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private List<Pet> listarPets () throws SQLException{		
		return new PetDAO().listar(0, "");
	}
	
	/** Consulta se os Campos Obrigatórios foram preenchido.
	 * 
	 * @param tutor Recebe todas as informações descritas no formulário
	 * @return string aprovado se todas as informações obrigatórias foram preenchidas ou 
	 * as informações que faltam ser preenchidas
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private String validarCampos(Tutor tutor) {	
		
		String retorno = "Há Campos Obrigatórios a ser preenchidos:\n";	

		if(!tutor.getNome().isEmpty() && !tutor.getDt_nasc().isEmpty()
				&& tutor.getSexo() != "-1" && !tutor.getRg().isEmpty()
				&& !tutor.getCpf().isEmpty()) {			
			retorno = "aprovado";
		} else {			
			if(tutor.getCpf().isEmpty()) {
				retorno += "\n CPF do Tutor;";
			}
			
			if(tutor.getNome().isEmpty()) {
				retorno += "\n Nome do Tutor;";
			}
			
			if(tutor.getDt_nasc().isEmpty()) {
				retorno += "\n Data de Nascimento;";
			}
			
			if(tutor.getSexo() == "-1") {
				retorno += "\n Sexo;";
			}
			
		}
		
		return retorno;
		
	}

}
