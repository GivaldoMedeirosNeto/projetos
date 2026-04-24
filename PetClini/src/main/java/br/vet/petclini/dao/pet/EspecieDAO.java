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

/** Classe para manipulação de dados relacionados ao Especie.
 * <br>
 * Esta classe é responsável por consultar as Especies na base de dados
 * e retornar com base em critérios de pesquisa específicos.
 * 
 * @version 1.0.0
 * @since Criação: 18/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class EspecieDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/**  Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public EspecieDAO() {
		connection = SingleConnection.getConnection();
	}

	/* Methods */
	
	/** Consulta as Espécies na Base de Dados.
	 * 
	 * @return lista de todas as Espécies encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Especie> listar() throws SQLException {
		List<Especie> list = new ArrayList<Especie>();
		
		
		sql = "CALL sp_pet_vw_especie()";
		
		call = connection.prepareCall(sql);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			List<Raca> listRaca = new ArrayList<Raca>();
			
			sql = "CALL sp_pet_vw_raca(?, ?, ?)";
			
			call = connection.prepareCall(sql);
			call.setInt(1, 1);
			call.setInt(2, resultSet.getInt("id_especie"));
			call.setString(3, "");
			
			ResultSet result = call.executeQuery();
			
			while(result.next()) {
				listRaca.add(new Raca(result.getInt("id_raca"), result.getString("raca")));					
			}	
			
			list.add(new Especie(resultSet.getInt("id_especie"), resultSet.getString("especie"), listRaca));
		}
		
		return list;
	}

	/** Adicionar ou Alterar as Especies na base de dados
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 e 2)<br>
	 * * 1: Adicionar<br>
	 * * 2: Alterar<br>
	 * @param especie objeto Especie para ser adicionado<br>
	 * 
	 * @return void
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 18/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void adicionar(int opcao, Especie especie) throws SQLException {
		sql = "CALL sp_pet_add_upd_especie(?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setInt(2, especie.getId());
		call.setString(3, especie.getEspecie().toUpperCase());
		
		call.execute();
		
		connection.commit();
	}

}
