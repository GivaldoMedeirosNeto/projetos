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

import br.vet.petclini.constants.DataHora;
import br.vet.petclini.dao.generic.StatusDAO;
import br.vet.petclini.dao.pessoa.PessoaDAO;
import br.vet.petclini.dao.pessoa.TutorDAO;
import br.vet.petclini.dao.pet.ColoracaoDAO;
import br.vet.petclini.dao.pet.EspecieDAO;
import br.vet.petclini.dao.pet.PetDAO;
import br.vet.petclini.dao.pet.RacaDAO;
import br.vet.petclini.model.gerenic.Status;
import br.vet.petclini.model.pessoa.Pessoa;
import br.vet.petclini.model.pessoa.Tutor;
import br.vet.petclini.model.pet.Coloracao;
import br.vet.petclini.model.pet.Especie;
import br.vet.petclini.model.pet.Pet;
import br.vet.petclini.model.pet.Raca;

/** Servlet responsável pela manipulação de informações dos PETs no Sistema.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas aos pets,
 * consultar informações no banco de dados através do DAO correspondente (PetDAO)
 * e retornar as respostas em formato desejado.<br>
 * As URLs mapeadas para este servlet são:<br>
 * "/pet".
 * 
 * @version 1.0.0
 * @since Criação: 11/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/pet"})
public class ServletPetController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao;
	private ObjectMapper mapper = new ObjectMapper();
	private ObjectNode jsonNode = mapper.createObjectNode();
	private String json = "";
	private String msg;
	
	private Pet modelPet = new Pet();
	private Tutor modelTutor = new Tutor();
       
    public ServletPetController() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acao = request.getParameter("acao");
		List<Pet> listPet = new ArrayList<Pet>();
		
		try {
			List<Especie> listEspecie = listarEspecie();
			List<Coloracao> listCor = listarCor();
			List<Status> listStatus = listarStatus();
			
			if(acao != null && acao.equalsIgnoreCase("listarracas")) {
				List<Raca> listRaca = listarRaca(Integer.parseInt(request.getParameter("idespecie")));
				json = mapper.writeValueAsString(listRaca);
			} else if(acao != null && acao.equalsIgnoreCase("listar")) {
				listPet = new PetDAO().listar(0, "");
				request.setAttribute("listPet", listPet);
				request.setAttribute("listEspecie", listEspecie);
				request.setAttribute("listCor", listCor);
				request.setAttribute("listStatus", listStatus);
				new ServletGenericUtil().redirecionar(request, response, "", listPet.size(), "cadastros/pets.jsp");
			} else if(acao != null && acao.equalsIgnoreCase("consultar")) {				
				modelPet = new PetDAO().consultar(request.getParameter("cpf_pet"));
				jsonNode.putPOJO("pet", modelPet);
				
				if(modelPet.getCpf_tutor() != null) {
					modelTutor = new TutorDAO().consultarCpf(modelPet.getCpf_tutor());
				} else {
					modelTutor = new Tutor();
				}
				jsonNode.putPOJO("tutor", modelTutor);
				json = mapper.writeValueAsString(jsonNode);
			} else if(acao != null && acao.equalsIgnoreCase("consultartutor")) {
				modelTutor = new TutorDAO().consultarCpf(request.getParameter("cpf_tutor"));
				if(modelTutor.getCpf() != null) {
					json = mapper.writeValueAsString(modelTutor);					
				} else {
					Pessoa modelPessoa = new PessoaDAO().consultarCpf(request.getParameter("cpf_tutor"));
					json = mapper.writeValueAsString(modelPessoa);
				}
			} else if(acao != null && acao.equalsIgnoreCase("status")) {
				new PetDAO().alt_st(request.getParameter("cpf_pet"), request.getParameter("statuspet"));
				json = mapper.writeValueAsString("alterado");
			} else if(acao != null && acao.equalsIgnoreCase("filtro")) {
				
				listPet = new PetDAO().listar(
					Integer.parseInt(request.getParameter("opcao")),
					request.getParameter("valor")
				);
				
				request.setAttribute("listPet", listPet);
				request.setAttribute("listEspecie", listEspecie);
				request.setAttribute("listCor", listCor);
				request.setAttribute("listStatus", listStatus);
				
				new ServletGenericUtil().redirecionar(request, response, "", listPet.size(), "cadastros/pets.jsp");
			}
			
			response.getWriter().write(json);
			
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			if (request.getParameter("descricaoRaca") != null) {
				new RacaDAO().add_upd(1,
					new Raca(0, request.getParameter("descricaoRaca"),
						new Especie(Integer.parseInt(request.getParameter("novaRacaIdEspecie")), ""))
				);
				json = mapper.writeValueAsString(listarRaca(Integer.parseInt(request.getParameter("novaRacaIdEspecie"))));
			} else if(request.getParameter("descricaoCor") != null) {
				new ColoracaoDAO().add_upd(1, new Coloracao(0, request.getParameter("descricaoCor")));
				json = mapper.writeValueAsString(listarCor());
			} else {
				modelPet = new Pet(
					request.getParameter("cpf_pet"),
					request.getParameter("nome_pet"),
					new DataHora().formatacaoData(request.getParameter("dt_nasc_pet")),
					new Raca(Integer.parseInt(request.getParameter("raca_pet"))),
					new Coloracao(Integer.parseInt(request.getParameter("cor_pet"))),
					request.getParameter("sexo_pet"), request.getParameter("convivio_pet"),
					request.getParameter("castrado_pet"), new DataHora().dataAtual(),
					new DataHora().dataAtual(), new DataHora().dataAtual(), request.getParameter("obs_pet"),
					new Status(request.getParameter("status_pet")), request.getParameter("cpf_tutor"),
					request.getParameter("nome_tutor")
				);
				
				if(!validarCampos(modelPet).equalsIgnoreCase("aprovado")) {
					msg = validarCampos(modelPet);
					json = mapper.writeValueAsString(msg);
				} else {
					if(request.getParameter("cpf_pet") == null || request.getParameter("cpf_pet").isEmpty()) {
						new PetDAO().add_upd(1, modelPet);
						json = mapper.writeValueAsString("aprovado");
					} else {
						new PetDAO().add_upd(2, modelPet);
						json = mapper.writeValueAsString("aprovado");
					}
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ServletGenericUtil().redirecionar(request, response, e.getMessage(), 0, "error.jsp");
		}
		
		response.getWriter().write(json);
		
	}
	
	/* Methods */
	
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
		return new StatusDAO().listar(1);
	}
	
	/** Lista de Espécie
	 * <br>
	 * Método utiliza para retornar uma lista de Espécia.
	 * 
	 * @return lista de Espécie cadastrado na base.
	 * 
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see EspecieDAO#listar()
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private List<Especie> listarEspecie () throws SQLException{		
		return new EspecieDAO().listar();
	}

	/** Lista de Raça
	 * <br>
	 * Método utiliza para retornar uma lista de Raças pelo ID da especie.
	 * 
	 * @return lista de raça cadastrado na base.
	 * 
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see RacaDAO#listar(opcao, id, descricao)
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private List<Raca> listarRaca (int idEspecie) throws SQLException{		
		return new RacaDAO().listar(1, idEspecie, "");
	}
	
	/** Lista de Coloracção
	 * <br>
	 * Método utiliza para retornar uma lista de Coloracção.
	 * 
	 * @return lista de Coloração cadastrado na base conforme a opção:
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE por NOME<br>
	 * 
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see ColoracaoDAO#listar(int)
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private List<Coloracao> listarCor () throws SQLException{		
		return new ColoracaoDAO().listar(0, "");
	}
	
	/** Consulta se os Campos Obrigatórios foram preenchido.
	 * 
	 * @param pet Recebe todas as informações descritas no formulário
	 * @return string aprovado se todas as informações obrigatórias foram preenchidas ou 
	 * as informações que faltam ser preenchidas
	 * 
	 * @version 1.0.0
	 * @since Criação: 25/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private String validarCampos(Pet pet) {	
		
		String retorno = "Há Campos Obrigatórios a ser preenchidos:\n";	
		
		if(!pet.getNome().isEmpty() && !pet.getDt_nasc().isEmpty() && pet.getRaca().getId() != -1 &&
			pet.getColoracao().getId() != -1 && !pet.getConvivio().equalsIgnoreCase("-1") &&
			!pet.getCastrado().equalsIgnoreCase("-1")) {			
			retorno = "aprovado";
		} else {			
			if(pet.getNome().isEmpty()) {
				retorno += "\n Nome do Pet;";
			}
			
			if(pet.getDt_nasc().isEmpty()) {
				retorno += "\n Data de Nascimento;";
			}
			
			if(pet.getRaca().getId() == -1) {
				retorno += "\n Raça;";
			}
			
			if(pet.getColoracao().getId() == -1) {
				retorno += "\n Coloração;";
			}
			
			if(pet.getConvivio().equalsIgnoreCase("-1")) {
				retorno += "\n Convivio;";
			}
			
			if(pet.getCastrado().equalsIgnoreCase("-1")) {
				retorno += "\n Castrado;";
			}
		}
		
		return retorno;
		
	}
	
}
