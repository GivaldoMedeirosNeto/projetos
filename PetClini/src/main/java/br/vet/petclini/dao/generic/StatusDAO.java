package br.vet.petclini.dao.generic;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.gerenic.Status;

/** Classe para manipulação de dados relacionados aos Status.
 * <br>
 * Esta classe é responsável por consultar informações de Status na base de dados
 * e retornar a pesquisa conforme solicitações específicos.
 * 
 * @version 1.0.0
 * @since Criação: 24/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class StatusDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/**  Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public StatusDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Lista os Status na Base de Dados conforme a opção solicitada.
	 * 
	 * * @param opcao Um inteiro representando a opção de pesquisa (0 a 3)<br>
	 * * Opções disponíveis:<br>
	 * * 0: Todos os Status;<br>
	 * * 1: Para o PET;<br>
	 * * 2: Para Tutor e Vet;<br>
	 * * 3: Para Atendimento;<br>
	 * 
	 * @return lista de status conforme solicitação
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 24/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Status> listar(int opcao) throws SQLException {
		List<Status> list = new ArrayList<Status>();
				
		sql = "CALL sp_sys_vw_status(?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			list.add(new Status( resultSet.getString("id_status"), resultSet.getString("status"), resultSet.getString("cor_status")));
		}
		return list;
	}

}
