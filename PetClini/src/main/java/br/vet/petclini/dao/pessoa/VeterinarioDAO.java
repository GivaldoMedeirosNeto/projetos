package br.vet.petclini.dao.pessoa;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.endereco.Bairro;
import br.vet.petclini.model.endereco.Cidade;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.endereco.Estado;
import br.vet.petclini.model.pessoa.RedeSocial;
import br.vet.petclini.model.pessoa.Veterinario;

/** Classe para manipulação de dados relacionados a Veterinários.
 * <br>
 * Esta classe é responsável por consultar informações de veterinários na base de dados
 * e retornar uma lista de veterinários com base em critérios de pesquisa específicos.
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class VeterinarioDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Construtor padrão.
	 * Obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public VeterinarioDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Consulta um veterinário pelo seu CPF.
	 * 
	 * @param cpf O CPF do veterinário a ser consultado.
	 * @return Um objeto Veterinario contendo as informações do veterinário encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Veterinario consultarVet(String cpf) throws SQLException {
		Veterinario modelVet = new Veterinario();
		return modelVet;
	}
	
	/** Consulta se o CPF do veterinário já está cadastrado.
	 * 
	 * @param cpf O CPF do veterinário a ser consultado.
	 * @return boolean TRUE se há cadastro no banco de dados e FALSE se não.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public boolean vetCpf(String cpf) throws SQLException {
		sql = "CALL sp_pes_vw_vet(1, ?);";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf);
		
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {			
			return true;
		}
		
		return false;
	}
		
	/** Retorna uma lista de veterinários baseado em diferentes critérios de pesquisa.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (0 a 9)<br>
	 * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE por CPF;<br>
	 * * 2: Pesquisa com cláusula WHERE por CRMV;<br>
	 * * 3: Pesquisa com cláusula WHERE por SEXO;<br>
	 * * 4: Pesquisa com cláusula WHERE por STATUS;<br>
	 * * 5: Pesquisa com cláusula WHERE por NOME;<br>
	 * * 6: Pesquisa com cláusula WHERE por UF;<br>
	 * * 7: Pesquisa com cláusula WHERE por ID CIDADE;<br>
	 * * 8: Pesquisa com cláusula WHERE por ID BAIRRO;<br>
	 * * 9: Pesquisa com cláusula WHERE por CEP.<br>
	 * @param valor Valor a ser utilizado como critério de pesquisa.
	 * @return Uma lista de objetos Veterinario que atendem ao critério de pesquisa.
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Modificação:
	 * 
	 * @autor Givaldo Medeiros Neto
	 */
	public List<Veterinario> listVet(int opcao, String valor)throws SQLException {
		List<Veterinario> list = new ArrayList<Veterinario>();
		return list;
	}

	/** Adiciona ou Altera uma Pessoa pelo CPF informado.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastra<br>
	 * * 2: Altera os dados<br>
	 * @param vet Um objeto Veterinario contendo as informações a ser adicionados ou alterados.
	 * @return Um objeto Veterinario contendo as informações do veterinário encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Veterinario add_upd_vet(int opcao, Veterinario vet) throws SQLException {
		return this.consultarVet(vet.getCpf());
	}
	
}
