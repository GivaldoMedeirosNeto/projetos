package br.vet.petclini.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;
import br.vet.petclini.constants.CPF;
import br.vet.petclini.constants.DataHora;
import br.vet.petclini.dao.pessoa.PessoaDAO;
import br.vet.petclini.dao.pessoa.VeterinarioDAO;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.pessoa.RedeSocial;
import br.vet.petclini.model.pessoa.Veterinario;

/** Servlet responsável pela manipulação de informações dos veterinários no Sistema.
 * <br>
 * Este servlet é responsável por receber as requisições relacionadas aos veterinários,
 * consultar informações no banco de dados através do DAO correspondente (VeterinarioDAO)
 * e retornar as respostas em formato JSON. As URLs mapeadas para este servlet são: "/veterinario".
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
@WebServlet(urlPatterns = {"/veterinario"})
public class ServletVetController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private VeterinarioDAO daoVet = new VeterinarioDAO();
	private PessoaDAO daoPessoa = new PessoaDAO();
	private Veterinario modelVet = new Veterinario();
	private Endereco modelEnd = new Endereco();
	private RedeSocial modelRS = new RedeSocial();
	private String acao = "listarvet";
	private String msg = "";
	private ObjectMapper mapper = new ObjectMapper();
	private String json = "";

    public ServletVetController() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

	}
		
}
