package br.vet.petclini.dao.pet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.pet.Coloracao;

/** Classe para manipulação de dados relacionados a Coloração.
 * <br>
 * Esta classe é responsável por consultar informações da Coloração na base de dados
 * e retornar as informações necessárias referente ao objeto Colorações conforme os
 * critérios de pesquisa específicados.
 * 
 * @version 1.0.0
 * @since Criação: 17/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class ColoracaoDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public ColoracaoDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/** Consulta as Colorações na Base de Dados conforme a opção solicitada.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (0 e 1)<br>
	 * * 0: Pesquisa Todos;<br>
	 * * 1: Pesquisa pela DESCRIÇÃO;<br>
	 * 
	 * @return lista das Colorações encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Coloracao> listar(int opcao, String coloracao) throws SQLException {
		List<Coloracao> list = new ArrayList<Coloracao>();
		
		sql = "CALL sp_pet_vw_coloracao(?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, ("%" + coloracao + "%").toUpperCase());
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			list.add(new Coloracao(resultSet.getInt("id_coloracao"), resultSet.getString("coloracao")));
		};		
		
		return list;
	}
		
	/** Adicionar ou alterar a Coloração.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastrar<br>
	 * * 2: Alterar<br>
	 * @param cor descrição da cor para ser adicionada ou alterada conforme a
	 * opcao informada.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void add_upd (int opcao, Coloracao cor) throws SQLException {
		
		sql = "CALL sp_pet_add_upd_coloracao(?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setInt(2, cor.getId());
		call.setString(3, cor.getColoracao().toUpperCase());
		
		call.execute();
		
		connection.commit();
		
	}

	/** Deletar uma Coloração.
	 * 
	 * @param id da coloracao para ser deletado na base.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void deletar (int id) throws SQLException{
		sql = "CALL sp_pet_del_coloracao(?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, id);
		
		call.execute();
		
		connection.commit();
	}
}
