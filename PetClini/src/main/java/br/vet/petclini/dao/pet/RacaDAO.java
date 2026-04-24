package br.vet.petclini.dao.pet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.pet.Especie;
import br.vet.petclini.model.pet.Raca;

/** Classe para manipulação de dados relacionados a Raça.
 * <br>
 * Esta classe é responsável por consultar as Raça na base de dados
 * e retornar uma lista de raça com base em critérios de pesquisa específicos.
 * 
 * @version 1.0.0
 * @since Criação: 18/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class RacaDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/**  Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public RacaDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Consulta as Raças na Base de Dados conforme a opção solicitada.
	 * 
	 * * @param opcao Um inteiro representando a opção de pesquisa (0 a 2)<br>
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE por ID Especie;<br>
	 * * 2: Pesquisa com cláusula WHERE por Descrição da Raça;<br>
	 * 
	 * @return lista de todas as Raças encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 18/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Raca> listar(int opcao, int id, String raca) throws SQLException {
		List<Raca> list = new ArrayList<Raca>();
		
		sql = "CALL sp_pet_vw_raca(?, ?, ?)";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setInt(2, id);
		call.setString(3, "%" + raca + "%");
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			list.add(new Raca(resultSet.getInt("id_raca"), resultSet.getString("raca"),
					new Especie(resultSet.getInt("id_especie"), resultSet.getString("especie"))));
		}
		
		return list;
	}

	/** Adiciona ou alterar a Raça.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastrar<br>
	 * * 2: Alterar<br>
	 * @param raca Um objeto Raca contendo as informações a ser adicionados ou alterados.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 18/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void add_upd (int opcao, Raca raca) throws SQLException {
		sql = "CALL sp_pet_add_upd_raca(?, ?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setInt(2, raca.getId());
		call.setString(3, raca.getRaca().toUpperCase());
		call.setInt(4, raca.getEspecie().getId());
		
		call.execute();
		
		connection.commit();
	}

	/** Deletar uma Raça.
	 * 
	 * @param id cod da Raça para deletar.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 18/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void deletar (int id) throws SQLException{
		sql = "CALL sp_pet_del_raca(?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, id);
		
		call.execute();
		
		connection.commit();
	}
}
